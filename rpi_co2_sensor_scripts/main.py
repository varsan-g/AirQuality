# Use python3.8 to run this script.

import getpass
import hashlib
import hmac
import requests
import RPi.GPIO as GPIO
import time
from co2_sensor import CO2Sensor
from lcd import LCD


LED_GREEN = 13
LED_YELLOW = 19
LED_RED = 26
BUZZER = 21
API_ENDPOINT = "https://co2-backend-production.up.railway.app/api/sensor/data"


def main():
    setup_gpio()

    sensor = CO2Sensor("SER14710391759133") # The sensors serial number is needed to identify the sensor in the database.
    secret_key = getpass.getpass("Enter the secret key: ")#.encode()
    token = generate_token(sensor.ID, secret_key)
    lcd = LCD()
    buzzer_beeped = False
    start_time = 0
    batch_time_interval = 60 # The time interval in seconds for sending data to the server.
    first_run = True
    
    while True:
        sensor.measure()
        print(sensor.data_set)
        
        if first_run:
            token = generate_token(sensor.ID, secret_key)
            send_sensor_data(API_ENDPOINT, sensor.data_set, token)
            start_time = time.time()
            first_run = False
        
        if sensor.has_data:
            lcd.lcd_string("ID:%s" %sensor.ID, lcd.LCD_LINE_1, 1)
            lcd.lcd_string("CO2: %d ppm" %sensor.CO2, lcd.LCD_LINE_2, 1)
            lcd.lcd_string("Temp: %0.1f C" %sensor.temperature, lcd.LCD_LINE_3, 1)
            lcd.lcd_string("Humidity: %0.1f %%" %sensor.relative_humidity, lcd.LCD_LINE_4, 1)

        if sensor.has_data and sensor.CO2 < sensor.yellow_threshold:
            change_led_state("green")
            buzzer_beeped = False
        elif sensor.has_data and sensor.CO2 < sensor.red_threshold:
            change_led_state("yellow")
            buzzer_beeped = False
        elif sensor.has_data and buzzer_beeped == False:
            change_led_state("red")
            beep_buzzer(3, 0.05, 0.05)
            buzzer_beeped = True
            print("WARNING! CO2 level is above %d ppm. Sending data to server." %sensor.red_threshold)
            token = generate_token(sensor.ID, secret_key)
            send_sensor_data(API_ENDPOINT, sensor.data_set, token)
        else:
            change_led_state("red")
        
        # For future versions: The sensor unit should send live when a user is watching a live graph through the app/web.
        # Also have some deactivation threshold for the lights, buzzer and sending data to the server so there is no flickering and spam effect.
        if time.time() - start_time >= batch_time_interval:
            token = generate_token(sensor.ID, secret_key)
            send_sensor_data(API_ENDPOINT, sensor.data_set, token)
            start_time = time.time()
           

def generate_token(serial_number, secret_key):
    timestamp = str(int(time.time()))
    message = serial_number + timestamp
    print(f"Message: {message}")
    signature = hmac.new(secret_key.encode(), message.encode(), hashlib.sha256).hexdigest()
    print(f"Signature: {signature}")
    token = f"{timestamp}:{signature}"
    print(f"Token: {token}")
    return token


def send_sensor_data(url, data_set, token):
    headers = {
        "Authorization": f"Bearer {token}"
    }
    response = requests.put(url, json=data_set, headers=headers) # The data set dictionary gets automatically converted to JSON format.
    print(f"Status Code: {response.status_code}")
    print(f"Response Text: {response.text}")

    try:
        response_json = response.json()
        print(response_json)
    except ValueError:
        print("Response content is not valid JSON")


def setup_gpio():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(LED_GREEN, GPIO.OUT)
    GPIO.setup(LED_YELLOW, GPIO.OUT)
    GPIO.setup(LED_RED, GPIO.OUT)
    GPIO.setup(BUZZER, GPIO.OUT)
    
    GPIO.output(LED_GREEN, GPIO.LOW)
    GPIO.output(LED_YELLOW, GPIO.LOW)
    GPIO.output(LED_RED, GPIO.LOW)
    GPIO.output(BUZZER, GPIO.LOW)
                 

def change_led_state(str):
    if str.lower() == "green":
        GPIO.output(LED_GREEN, GPIO.HIGH)
        GPIO.output(LED_YELLOW, GPIO.LOW)
        GPIO.output(LED_RED, GPIO.LOW)
    elif str.lower() == "yellow":
        GPIO.output(LED_GREEN, GPIO.LOW)
        GPIO.output(LED_YELLOW, GPIO.HIGH)
        GPIO.output(LED_RED, GPIO.LOW)
    elif str.lower() == "red":
        GPIO.output(LED_GREEN, GPIO.LOW)
        GPIO.output(LED_YELLOW, GPIO.LOW)
        GPIO.output(LED_RED, GPIO.HIGH)
    elif str.lower() == "off":
        GPIO.output(LED_GREEN, GPIO.LOW)
        GPIO.output(LED_YELLOW, GPIO.LOW)
        GPIO.output(LED_RED, GPIO.LOW)


def beep_buzzer(number_of_times, high_time, low_time):
    for i in range(number_of_times):
        GPIO.output(BUZZER, GPIO.HIGH)
        time.sleep(high_time)
        GPIO.output(BUZZER, GPIO.LOW)
        time.sleep(low_time)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        GPIO.cleanup()
