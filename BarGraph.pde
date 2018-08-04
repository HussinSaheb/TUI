import org.gicentre.utils.stat.*;    // For chart classes.

BarChart barChart;
BarChart barChart2;


// Initialises the sketch and loads data into the chart.
void setupBarGraphs() {


  barChart = new BarChart(this);
  barChart2 = new BarChart(this);

  // this one for car 
  barChart.setData(new float[] {cars.get(5).getPower(), cars.get(5).getHandling(), cars.get(5).getAcceleration()});
  // this one for the scenario 
  barChart2.setData(new float[] {scen.get(6).power, scen.get(6).handling, scen.get(6).acceleration});


  // Axis scaling
  barChart.setMinValue(0);
  barChart.setMaxValue(1);

  barChart2.setMinValue(0);
  barChart2.setMaxValue(1);


  //Set font  
  textFont(createFont("Arial", 10), 10);

  //Set scaling format  
  barChart.setValueFormat("#%");

  barChart2.setValueFormat("#%");

  //Set Bar labels
  barChart.setBarLabels(new String[] {"Power", "Handling", "Acceleration"});

  barChart2.setBarLabels(new String[] {"Power", "Handling", "Acceleration"});


  //Show axis                                     
  barChart.showValueAxis(true);                                     
  barChart.showCategoryAxis(true);
  barChart.setBarGap(6);

  barChart2.showValueAxis(true);                                     
  barChart2.showCategoryAxis(true);
  barChart2.setBarGap(6);


  //Set Colour
  barChart.setBarColour(color(50, 150, 100, 255));

  barChart2.setBarColour(color(50, 150, 100, 255));
}

// Draws the chart in the sketch