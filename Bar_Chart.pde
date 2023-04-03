import org.gicentre.utils.stat.*;
import controlP5.*;

class chartBar{       
  BarChart barChart;
  
  chartBar(BarChart chart, String label){
  barChart = chart;
  //barChart.setData(data);
  barChart.setMinValue(0);
  barChart.setMaxValue(1000);
  
  barChart.showValueAxis(true);
  barChart.showCategoryAxis(true);
  //barChart.setBarLabels(labels);
  barChart.setBarColour(color(#C1E5B7));
  barChart.setAxisLabelColour(250);
  barChart.setAxisValuesColour(250);
  barChart.setCategoryAxisLabel(label);
  barChart.setBarGap(4.2);
 }
 
 void setData(float[] data, ArrayList<String> labels){
   String[] airports = new String[labels.size()];
   for (int i = 0; i < labels.size(); i++){
     boolean found = false;
     int count = 0;
     while (!found){
       Flight temp = flights.flights.get(count);
       if (temp.originCity.equals(labels.get(i))){
         airports[i] = temp.originAirport;
         found = true;
       }
       count += 1;
     }
    
   }
   barChart.setData(data);
   barChart.setBarLabels(airports);
 }
 
 void draw(){
   barChart.draw(900, 70, 600, 400);
   barChart.setMaxValue(1000 + zoom * 300);
 }
}
