class Part {
  float tier, power, handling, acceleration, price, angle;
  String description;
  int tag, xx, yy;


  Part(float tier, float power, float handling, float acceleration, float price, String description, int tag) {
    this.tier = tier;
    this.power = power;
    this.handling = handling;
    this.acceleration = acceleration;
    this.price = price;
    this.description = description;
    this.tag = tag;
  }
  


  void setAngle(float o) {
    angle = o;
  }

  void setTier(float o) {
    tier = o;
  }

  float getTier() {
    return tier;
  }

  float getPrice() {
    return price;
  }

  String getDesc() {
    return description;
  }

  float getPower() {
    return power;
  }

  float getHandling() {
    return handling;
  }

  float getAcceleration() {
    return acceleration;
  }

  void getInfo() {
  }
}

class Tyre extends Part {
  float size, angle;

  Tyre(float tier, float power, float handling, float acceleration, float price, String description, int tag) {
    super(tier, power, handling, acceleration, price, description, tag);
  }

  void getInfo() {
    if (angle < 120) {
      setSize(205);
      if (tier == 1) {
        power = 0;
        handling = 0.02;
        acceleration = 0.01;
        price = 200;
      } else if (tier == 2) {
        power = 0;
        handling = 0.025;
        acceleration = 0.02;
        price = 250;
      } else {
        power = 0;
        handling = 0.03;
        acceleration = 0.025;
        price = 300;
      }
      description = "Hard compound tyre. Ideal for daily driving as they last long however, they lack in grip under fast cornering.";
    } else if (angle > 120 && angle <=240) {
      setSize(215);
      if (tier == 1) {
        power = 0;
        handling = 0.025;
        acceleration = 0.015;
        price = 250;
      } else if (tier == 2) {
        power = 0;
        handling = 0.03;
        acceleration = 0.025;
        price = 300;
      } else {
        power = 0;
        handling = 0.035;
        acceleration = 0.03;
        price = 350;
      }
      description = "Medium compound tyre. This tyre provides best of both worlds, good for day to day driving while also maintaining good grip under harsh driving.";
    } else {
      setSize(225);
      if (tier == 1) {
        power = 0;
        handling = 0.03;
        acceleration = 0.02;
        price = 400;
      } else if (tier == 2) {
        power = 0;
        handling = 0.035;
        acceleration = 0.03;
        price = 450;
      } else {
        power = 0;
        handling = 0.04;
        acceleration = 0.035;
        price = 500;
      }
      description = "Super soft compound (slick tyres). These tyres are not road legal as they do not have any tread, they are extremely soft making them very sticky during dry weather and also deteriorate very quickly. Track use only.";
    }
  }

  float getSize() {
    return size;
  }

  void setSize(float o) {
    size =  o;
  }
  void setAngle(float o) {
    angle = o;
  }
}

class Exhaust extends Part {
  float diameter;

  Exhaust(float tier, float power, float handling, float acceleration, float price, String description, int tag) {
    super(tier, power, handling, acceleration, price, description, tag);
  }

  void getInfo() {
    if (tier == 1) {
      diameter = 2;
      power = 0.05;
      handling = 0;
      acceleration = 0.03;
      description = "Silenced exhaust and 2” pipes. Catalytic convertor on.";
      price = 200;
    } else if (tier == 2) {
      diameter = 2.5;
      power = 0.07;
      handling = 0;
      acceleration = 0.05;
      description = "Silenced exhaust and 2.5” pipes. Catalytic convertor on.";
      price = 250;
    } else {
      diameter = 3;
      power = 0.09;
      handling = 0;
      acceleration = 0.07;
      description = " Unsilenced exhaust and 3” pipes. Catalytic convertor deleted. ";
      price = 350;
    }
  }
}

class Suspension extends Part {
  String type;

  Suspension(float tier, float power, float handling, float acceleration, float price, String description, int tag) {
    super(tier, power, handling, acceleration, price, description, tag);
  }

  void getInfo() {
    if (tier == 1) {
      type = "Upgraded springs";
      power = 0;
      handling = 0.02;
      acceleration = 0;
      description = "Road use coilovers with softer spring rates. This increases handling without sacrificing too much comfort." ; // get desc
      price = 200;
    } else if (tier == 2) {
      type = "Street use coilover";
      power = 0;
      handling = 0.06;
      acceleration = 0;
      description = "Road use coilovers with softer spring rates. This increases handling without sacrificing too much comfort." ;
      price = 700;
    } else {
      type = "Track use coilover";
      power = 0;
      handling = 0.11;
      acceleration = 0;
      description = "Track use coilovers with stiff spring rates. Decreases ride comfort for day to day use in exchange of optimum handling for track use.";
      price = 1100;
    }
  }
}

class Intake extends Part {
  String type;

  Intake(float tier, float power, float handling, float acceleration, float price, String description, int tag) {
    super(tier, power, handling, acceleration, price, description, tag);
  }

  void getInfo() {
    if (tier == 1) {
      type = "Induction Kit";
      power = 0.03;
      handling = 0;
      acceleration = 0.01;
      description = "Naturally aspirated: Uprated induction kit, less restrictive than standard. Increases the amount of air that’s sucked into the engine.";
      price = 150;
    } else if (tier == 2) {
      type = "Supercharger Kit";
      power = 0.07;
      handling = 0;
      acceleration = 0.05;
      description = "Forced Induction: Supercharger kit. The supercharger uses the kinetic energy to spin a turbine that forces more air into the engine. Uses some of the engines power to create more in a linear fashion based on the engines RPM. ";
      price = 500;
    } else {
      type = "Turbocharger kit";
      power = 0.11;
      handling = 0;
      acceleration = 0.07;
      description = "Forced Induction: Turbocharger kit. A turbocharger scavenges the wasted exhaust fumes to spin a turbine that compresses and forces air into the engine. Sudden surge of power when the turbine starts spooling up forcing air into the engine.";
      price = 800;
    }
  }
}