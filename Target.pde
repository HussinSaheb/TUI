
class Target {

  /* Rectangular targets.
   have x, y location location & dimensions.
   Can test whether an object inside them -- contains
   Display colour depends on whether they've been 'hit'.
   */

  int x, y, xSize, ySize, halfXSize, halfYSize, tag;

  color fillCol, hitFillCol, strokeCol;
  boolean hit=false; 
  // better to store a list of tracked objects that are inside this target;
  // hit = list non-empty.

  String name="";
  String description ="";

  Target(int xx, int yy, int sx, int sy, String n) {
    x=xx; 
    y=yy; 
    xSize=sx; 
    halfXSize=sx/2;
    ySize=sy;
    halfYSize=sy/2;
    fillCol=color(245, 244, 227);
    hitFillCol=color(200, 100, 0, 250);
    strokeCol=color(200);
    name=n;
  }

  void draw() {
    pushStyle();
    if (hit) {
      fill(hitFillCol);
     // text(description, 10, 10);
    } else {
      noFill();
    }  
    stroke(strokeCol);
    if (name == "Suspension") {
      
    rect(x -75, y-10, xSize, ySize);
    }
    else if (name == "Intake") {
      
    rect(x -100, y-10, xSize, ySize);
    }
    else if (name == "Car Type") {
      
    rect(x -125, y-10, xSize, ySize);
    }
    
    else {
      
    rect(x -25, y-10, xSize, ySize);
    }
    fill(245, 244, 227);
    //text(name, x-xSize/2, y-ySize/2);
    popStyle();
  }


  
  boolean contains(int ox, int oy) {
    // does this target contain the location (ox, oy)? 
    return (ox>x-halfXSize && ox<x+halfXSize && oy>y-halfYSize && oy<y+halfYSize);
  }

  void entered(Car o) {
    hit=true;
  }
  void entered(Part o) {
    hit=true;
  }
   void entered(Scenario o) {
    hit=true;
  }
  
  void left(Car o) {
    hit=false;
  }
   void left(Part o) {
    hit=false;
  }
    void left(Scenario o) {
    hit=false;
  }
  void moved(Car o) {
    hit=true;
  }
  void moved(Part o) {
    hit=true;
  }
  void moved(Scenario o) {
    hit=true;
  }
}