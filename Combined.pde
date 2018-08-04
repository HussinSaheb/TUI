PImage img, pic;
PFont fontMain, fontTitle;
import org.gicentre.utils.stat.*;
import TUIO.*; 

TuioProcessing tuioClient  = new TuioProcessing(this);

HashMap<Integer, Part> objs = new HashMap<Integer, Part>();
HashMap<Integer, Scenario> scen = new HashMap<Integer, Scenario>();
HashMap<Integer, Car> cars = new HashMap<Integer, Car>();
ArrayList<Target> targets = new ArrayList<Target>();
ArrayList<Part> parts = new ArrayList<Part>();
HashMap<Integer, Part> part = new HashMap<Integer, Part>();


void setup() {

  // we need to setup the defualt values of a car and add it to the hashmap on id =5.
  // make a default scenario to reach and add default values id =6.
  //size(1300, 769);
  //size(2420, 1080);
  fullScreen();
  //background(245, 244, 227);
  // Images must be in the "data" directory to load correctly
  img = loadImage("Honda.png");
  fontMain = loadFont("HelveticaNeue-Light-15.vlw");
  fontTitle = loadFont("Helvetica-Light-35.vlw");
  //drawShapes();

  cars.put(new Integer(5), new Car("Honda", "Integra Type-R", "2001", 0.42, 0.37, 0.47, parts, img));
  scen.put(new Integer(6), new Scenario(2000, "No scenario", 0.38, 0.36, 0.38, 6));
}

void draw() {
  background(245, 244, 227);
    image(cars.get(5).getPicture(), 350, 100);
  textFont(fontTitle, 35);
  fill(200, 108, 227);
  text("Car Scenario", 550, 70);

  // printArray(parts);


  for (Target t : targets) {
    t.draw();
  }

  drawShapes();
  displayDescriptions();
  displayInstructions();

  setupBarGraphs();
  barChart.draw(1050, 50, width-1050, height-600);
  //barChart2.draw(1050, 50, width-1050, height-600);
 // barChart.draw(1050, 50, width-1500, height-800);
 // barChart2.draw(1050, 50, width-1500, height-800);
  
  // legend for bar
  int conW = 1600;
  int conH = 300;
  
  fill(255,0,0);
  rect(conW, conH, 40,40);
  noFill();
  text("Current car progress", conW + 50, conH);
  fill(0,255,0);
  rect(conW, conH - 50, 40,40);
  text("to comeplete this scenario", conW +50 , conH -50);
}

void drawShapes() {
  // rectMode(CORNERS);
  noFill();
  strokeWeight(2);
  int tWidth = 100;
  int tHeight= 100;
  int yshift = 75;
  int xshift = 100;
  //targets.add(new Target(355, 550, 415, 610, "Tyre Size"));
  targets.add(new Target(325 - xshift, 550- yshift, tWidth, tHeight, "Tyre Size"));

  //targets.add(new Target(490, 550, 550, 610, "Tyre Tier"));
  targets.add(new Target(460- xshift, 550- yshift, tWidth, tHeight, "Tyre Tier"));

  //targets.add(new Target(630, 550, 690, 610, "Exhaust"));
  targets.add(new Target(590- xshift, 550- yshift, tWidth, tHeight, "Exhaust"));

  //targets.add(new Target(785, 550, 845, 610, "Suspension"));
  targets.add(new Target(765- xshift, 550- yshift, tWidth, tHeight, "Suspension"));

  // targets.add(new Target(930, 550, 990, 610, "Intake"));
  targets.add(new Target(920- xshift, 550- yshift, tWidth, tHeight, "Intake"));

  //targets.add(new Target(1100, 550, 1160, 610, "Car Type"));
  targets.add(new Target(1100- xshift, 550- yshift, tWidth, tHeight, "Car Type"));

  //  targets.add(new Target(1100, 550, 1160, 610, "Scenario"));
 // targets.add(new Target(1200- xshift, 650- yshift, tWidth, tHeight, "Scenario"));
}

void displayDescriptions() {
  //font = loadFont("Futura-Medium-48.vlw");
  textFont(fontMain, 15);
  //textSize(18);

  fill(255, 0, 200);
  text("Tyre Width", 215, 590);
  text("Tyre Tier", 360, 590);
  text("Exhaust", 485, 590);
  text("Suspension", 605, 590);
  text("Intake", 750, 590);
  text("Car Type", 900, 590);
 // text("Scenario", 1120, 340);
  fill(0);
}

void displayInstructions() {

  text("Instructions:", 560, 700);
  text("To change a part on the car place the block into your", 560, 720);
  text("chosen box and swivel clockwise to select the specific part.", 560, 740); 
  noFill();
  stroke(82, 170, 180);
  strokeWeight(1);
  //rect(505, 640, 915, 710);
  rect(555, 680, 400, 80);
}

void displayPartDescriptions() {
}

// adds the physcial tags as virtual objects to be tracked.
void addTuioObject(TuioObject tobj) {
  int id = tobj.getSymbolID();
  // for all Fuducials below number 6,
  if (id < 7) {
    if (id == 0 || id == 4) {
      // if the tag is 0, then create a tyre object. this is particularly useful, to set the individual fields.
      objs.put(new Integer(id), new Tyre(1, 0, 0, 0, 0, "", id));
    } else if (id == 1 ) {
      // if the tag is 1, make an exhaust object.
      objs.put(new Integer(id), new Exhaust(1, 0, 0, 0, 0, "", id));
    } else if (id == 2 ) {
      objs.put(new Integer(id), new Suspension(1, 0, 0, 0, 0, "", id));
    } else if (id == 3 ) {
      objs.put(new Integer(id), new Intake(1, 0, 0, 0, 0, "", id));
    } else if (id == 5 ) {
      cars.put(new Integer(id), new Car("Honda", "Integra Type-R", "2001", 0.42, 0.37, 0.47, parts, pic));
    } else if (id == 6 ) {
      scen.put(new Integer(id), new Scenario(2000, "No scenario", 0.38, 0.36, 0.38, id));
    } else {
      objs.put(new Integer(id), new Part(1, 0, 0, 0, 0, "", id));
    }
  }
}


void updateTuioObject (TuioObject tobj) {
  // decelare globals to track
  int oldX;
  int oldY;

  Part  o = objs.get(new Integer(tobj.getSymbolID()));
  Car o_ = cars.get(new Integer(tobj.getSymbolID()));
  Scenario O_ = scen.get(new Integer(tobj.getSymbolID()));
  //o.getInfo();

  float angle = tobj.getAngleDegrees();


  // check if o is in any of the targets; if so 'hit' the target
  for (Target t : targets) {
    boolean wasIn = false;
    boolean isIn =  false;
    if (tobj.getSymbolID() == 5) {
      // or if car tag
      oldX = o_.xx;
      oldY = o_.yy;
      o_.xx = tobj.getScreenX(width);
      o_.yy = tobj.getScreenY(height);
      wasIn = t.contains(oldX, oldY);
      isIn = t.contains(o_.xx, o_.yy);
    } 
    if (tobj.getSymbolID() == 6) {
      //or if scenario Tag
      oldX = O_.xx;
      oldY = O_.yy;
      O_.xx = tobj.getScreenX(width);
      O_.yy = tobj.getScreenY(height);
      wasIn = t.contains(oldX, oldY);
      isIn = t.contains(O_.xx, O_.yy);
    } 
    if (tobj.getSymbolID() < 5) {
      oldX = o.xx;
      oldY = o.yy;
      o.xx = tobj.getScreenX(width);
      o.yy = tobj.getScreenY(height);
      wasIn = t.contains(oldX, oldY);
      isIn = t.contains(o.xx, o.yy);
    }










    //boolean wasIn = t.contains(oldX, oldY);
    //boolean isIn = t.contains(XX, YY);

    if (isIn) {
      t.moved(o);
      t.moved(o_);
      t.moved(O_);
      // has object o moved into the target? 
      if (angle < 120) {
        // is the target area the correct one?
        // if so, then set variables of object.
        if (t.name.equals("TyreTier")) {
          o.setTier(1);
        } else if (t.name.equals("TyreSize")) {
          o.setAngle(angle);
          o.getInfo();
        } else if (t.name.equals("Exhaust")) {
          o.setTier(1);
        } else if (t.name.equals("Suspension")) {
          o.setTier(1);
        } else if (t.name.equals("Intake")) {
          o.setTier(1);
        } else if (t.name.equals("Scenario")) {
          O_.setScenario(2000, "Mild upgrades to improve overall performance while maintaining comfort for city driving.", 0.38, 0.36, 0.38);
        } else if (t.name.equals("Car Type")) {
          o_.setCar("Honda", "Integra Type-R", "2001", 0.42, 0.37, 0.47, loadImage("Honda.png"));
 
        }
      } else if (angle > 120 && angle <=240) {
        if (t.name.equals("TyreTier")) {
          o.setTier(2);
        } else if (t.name.equals("TyreSize")) {
          o.setAngle(angle);
          o.getInfo();
        } else if (t.name.equals("Exhaust")) {
          o.setTier(2);
        } else if (t.name.equals("Suspension")) {
          o.setTier(2);
        } else if (t.name.equals("Intake")) {
          o.setTier(2);
        } else if (t.name.equals("Scenario")) {
          O_.setScenario(3000, "Road legal car while also performing well on the track but not suitable for daily driving.", 0.46, 0.45, 0.55);
        } else if (t.name.equals("Car Type")) {
          o_.setCar("Audi", "A4", "2004", 0.34, 0.32, 0.35, loadImage("audi1.png"));
        }
      } else {
        if (t.name.equals("TyreTier")) {
          o.setTier(3);
        } else if (t.name.equals("TyreSize")) {
          o.setAngle(angle);
          o.getInfo();
        } else if (t.name.equals("Exhaust")) {
          o.setTier(3);
        } else if (t.name.equals("Suspension")) {
          o.setTier(3);
        } else if (t.name.equals("Intake")) {
          o.setTier(3);
        } else if (t.name.equals("Scenario")) {
          O_.setScenario(4000, "Dedicated track car. Achieve the highest possible performance possible within the given budget. Not road legal.", 0.65, 0.72, 0.65);
        } else if (t.name.equals("Car Type")) {
          o_.setCar("Nissan", "Skyline R35", "2010", 0.60, 0.66, 0.58, loadImage("nissan2.png"));
        }
      }
      if (o != null) {
        o.getInfo();
      }
      println(scen.get(6).description);

      // if the id is in the hashmap, then just tell us it already exists.
      // if its not in the hashmap. then add it to the hashmap
      // and add it to the parts
      // this way we avoid adding duplicate parts to the arraylist.
      if (part.containsKey(tobj.getSymbolID()) || cars.containsKey(tobj.getSymbolID()) ||scen.containsKey(tobj.getSymbolID())  ) {
        //println("hashsmap already contains this part");
      } else {
        if (tobj.getSymbolID()< 5 ) {
          part.put(new Integer(tobj.getSymbolID()), o);
          parts.add(o);
        } else if (tobj.getSymbolID() == 5) {
          cars.put(new Integer(tobj.getSymbolID()), o_);
        } else if (tobj.getSymbolID() == 6) {
          scen.put(new Integer(tobj.getSymbolID()), O_);
        }
      }

      if (!wasIn) {
        t.entered(o);
        t.entered(o_);
        t.entered(O_);
      }
    }
    // has object o moved out of the target? 
    if (wasIn && !isIn) {
      t.left(o_);
      t.left(O_);
      t.left(o);
      parts.remove(o);
    }
  }
}