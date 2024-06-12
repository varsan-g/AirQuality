import adafruit_scd4x
import board
import time


class CO2Sensor(adafruit_scd4x.SCD4X):
    def __init__(self, ID = None, yellow_threshold = 800, red_threshold = 1000, timeout = 10):
        i2c = board.I2C()
        super().__init__(i2c) # Call the parent class's constructor with the necessary parameters so that the CO2Sensor class can inherit everything from the SCD4X class.
        #self.scd4x = adafruit_scd4x.SCD4X(i2c) # This creates an instance variable that is not needed with inheritance.

        #self.ID = ID if ID is not None else [hex(i) for i in self.serial_number] # If no ID is provided then use the hex serial number of the sensor.
        self.ID = ID if ID is not None else str(self.serial_number) # If no ID is provided then use the decimal serial number of the sensor.
        self.yellow_threshold = yellow_threshold
        self.red_threshold = red_threshold

        self.data_set = { "The sensor has to measure first before data is available." }
        self.has_data = False
        self.timeout = timeout

        
    def measure(self):
        if self.has_data == False:
            print("SCD41 Sensor with serial number (hex):", [hex(i) for i in self.serial_number])
            print("SCD41 Sensor with serial number (dec):", self.serial_number)
            print("Waiting for measurements...\n")
        
        self.start_periodic_measurement() # Initiate continuous measurement mode. Remember to also use stop_periodic_measurement()
                                          # or the program will crash because the sensor can not handle multiple commands at once.
         
        timeout = 10
        start_time = time.time()

        while True:
            if self.data_ready:
                self.data_set = {
                    "serialNum": self.ID,
                    "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
                    "co2": self.CO2,
                    "temperature": round(self.temperature, 1),
                    "humidity": round(self.relative_humidity, 1)
                }
                #print("Data set:", self.data_set)
                self.has_data = True
                break

            if time.time() - start_time >= timeout:
                print("Timeout reached. No data available.")
                break

        self.stop_periodic_measurement()


# For testing
def main():
    sensor = CO2Sensor()
    sensor.measure()


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        pass


# Example code from the adafruit_scd4x module
 
#i2c = board.I2C() # Uses board.SCL and board.SDA
#i2c = board.STEMMA_I2C()  # For using the built-in STEMMA QT connector on a microcontroller
#scd4x = adafruit_scd4x.SCD4X(i2c)

#print("SCD41 Serial number:", [hex(i) for i in scd4x.serial_number])

#scd4x.start_periodic_measurement()
# print("Waiting for measurements...")

# while True:
#     if scd4x.data_ready:
#         print("CO2: %d ppm" %scd4x.CO2)
#         print("Temperature: %0.1f *C" % scd4x.temperature)
#         print("Humidity: %0.1f %%" % scd4x.relative_humidity)
#         print()
#     time.sleep(2)
