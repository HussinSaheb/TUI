class Car {
  PImage picture;
  String brand, model, rYear;
  float power, handling, acceleration, price;
  ArrayList<Part> parts ;
  int  xx, yy;

  public Car(String brand, String model, String rYear, float power, float handling, float acceleration, ArrayList<Part> parts, PImage pic) {
    this.brand = brand;
    this.model = model;
    this.rYear = rYear;
    this.power = power;
    this.handling = handling;
    this.acceleration = acceleration;
    this.parts = parts;
    this.picture = pic;
    price = 0;
  }

  float getPower() {
    float sum = 0; 
    for (Part p : parts) {
      sum += p.power;
    }
    return sum+power;
  }


  float getHandling() {
    float sum = 0; 
    for (Part p : parts) {
      sum += p.handling;
    }
     return sum + handling;
  }

  float getAcceleration() {
    float sum = 0; 
    for (Part p : parts) {
      sum += p.acceleration;
    }
    return sum + acceleration;
  }

  float getPrice() {
    float sum = 0; 
    for (Part p : parts) {
      sum += p.price;
    }
    return sum;
  }



  void setCar(String brand_, String model_, String rYear_, float power_, float acceleration_, float handling_, PImage pic) {
    this.brand = brand_;
    this.model = model_;
    this.rYear = rYear_;
    this.power = power_;
    this.handling = handling_;
    this.acceleration = acceleration_;
    this.picture =pic;
  }

  PImage getPicture() {
    if (brand == "Honda") {
      return loadImage("Honda.png");
    } else if (brand == "Audi") {
      return loadImage("audi1.png") ;
    } else if (brand == "Nissan") {
      return loadImage("nissan2.png") ;
    } else {
      return loadImage("car_outline.png");
    }
  }
}