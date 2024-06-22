// Car Class
class Car {
  // Properties
  String brand;         // the brand of the car
  String model;         // the model of the car
  int year;             // the year the car was made
  double milesDriven;   // the number of miles driven by the car

  // Static property to keep track of number of Car objects created
  static int numberOfCars = 0;

  // Constructor
  Car(this.brand, this.model, this.year, this.milesDriven) {
    numberOfCars++;
  }

  // Method to drive the car and add miles
  void drive(double miles) {
    milesDriven += miles;
  }

  // Getter methods
  double getMilesDriven() {
    return milesDriven;
  }

  String getBrand() {
    return brand;
  }

  String getModel() {
    return model;
  }

  int getYear() {
    return year;
  }

  // Method to get the age of the car
  int getAge() {
    int currentYear = DateTime.now().year;
    return currentYear - year;
  }
}

void main() {
  // Creating three Car objects
  Car car1 = Car('BanglaMotors', 'Tiger', 2020, 67000.0);
  Car car2 = Car('Bengal', 'Duel', 2021, 34000.0);
  Car car3 = Car('BDCar', 'Hilsha', 2022, 13000.0);

  // Driving each car a different number of miles
  car1.drive(170.0);
  car2.drive(230.0);
  car3.drive(320.0);

  // Printing details for each car
  print('Car 1: ${car1.getBrand()} ${car1.getModel()}, Year: ${car1.getYear()}, Miles Driven: ${car1.getMilesDriven()}, Age: ${car1.getAge()}');
  print('Car 2: ${car2.getBrand()} ${car2.getModel()}, Year: ${car2.getYear()}, Miles Driven: ${car2.getMilesDriven()}, Age: ${car2.getAge()}');
  print('Car 3: ${car3.getBrand()} ${car3.getModel()}, Year: ${car3.getYear()}, Miles Driven: ${car3.getMilesDriven()}, Age: ${car3.getAge()}');

  // Printing the total number of Car objects created
  print('Total number of cars created: ${Car.numberOfCars}');
}
