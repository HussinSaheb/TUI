class Scenario{
  float budget;
  float power;
  float acceleration;
  float handling;
  float id;
  int  xx, yy;

  String description;

  public Scenario(float budget_, String description_, float power_, float acceleration_, float handling_, float id_){
    this.budget = budget_;
    this.description = description_;
    this.power = power_;
    this.acceleration = acceleration_;
    this.handling = handling_;
    this.id = id_;
  }

  void setScenario(float budget_, String description_, float power_, float acceleration_, float handling_) {
    handling = handling_;
    power= power_;
    acceleration = acceleration_;
    description= description_;
  }
}