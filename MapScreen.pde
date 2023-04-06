//import org.gicentre.utils.spatial.*;    // For map projections //<>// //<>//

class MapScreen
{
  ArrayList<Pin> myPins;
  ArrayList<String> flightCompareTable;
  final float BACKGROUND_WIDTH =(SCREENX*0.75);
  final float BAKCGROUND_HEIGHT =(SCREENY*0.75);
  PImage backgroundMap;
  final int EVENT_NULL = 0;


  void setup()
  {
    myPins = new ArrayList<Pin>();
    flightCompareTable = new ArrayList<String>();
    Pin pin1, pin2, pin3, pin4, pin5, pin6, pin7, pin8, pin9, pin10,
      pin11, pin12, pin13, pin14, pin15, pin16, pin17, pin18, pin19,
      pin20, pin21, pin22, pin23, pin24, pin25, pin26, pin27, pin28,
      pin29, pin30, pin31, pin32, pin33, pin34, pin35, pin36, pin37,
      pin38, pin39, pin40, pin41, pin42, pin43, pin44, pin45, pin46,
      pin47, pin48, pin49, pin50;
    pin1 = new Pin( 693, 611.625, 1);//DFW
    pin2 = new Pin(892.5, 595, 2);// ATL
    pin3 = new Pin( 805, 428.75, 3);//ORD
    pin4 = new Pin(562.625, 462, 4);//DEN
    pin5 = new Pin(934,562,5); // CLT
    pin6 = new Pin( 350, 595, 6);//LAX
    pin7 = new Pin(281, 268, 7); // SEA
    pin8 = new Pin(1062, 430, 8); // LGA
    pin9 = new Pin(463, 617, 9); // PHX
    //pin10 = new Pin(1056, 450, 10); //EWR
    pin11 = new Pin(951, 717, 11); // MCO
    pin12 = new Pin(718, 670, 12); // IAH
    pin13 = new Pin(1011, 497, 13); //DCA
    pin14 = new Pin(397, 548, 14); // LAS
  
    pin15 = new Pin(962, 763, 15); //MIA
    pin16 = new Pin(1093, 438, 16); // JFK
    pin17 = new Pin(912, 413, 17); // DTW
    pin18 = new Pin(1112, 400, 18); // BOS
    pin19 = new Pin(279, 518, 19); // SFO
    pin20 = new Pin(753, 347, 20); // MSP
    pin21 = new Pin(451, 441, 21); // SLC
    pin22 = new Pin(1037, 465, 22); // PHL
    //pin23 = new Pin(963, 746, 23); // FLL
    pin24 = new Pin(928, 746, 24); // TPA
    pin25 = new Pin(683, 677, 25); // AUS
    pin26 = new Pin(861, 548, 26); // BNA
    
    //pin27 = new Pin(993, 460, 27); // BWI
    
   // pin28 = new Pin(1005, 489, 28); // IAD
    pin29 = new Pin(365, 617, 29); // SAN
    pin30 = new Pin(276, 331, 30); // PDX


    myPins.add(pin1);
    myPins.add(pin2);
    myPins.add(pin3);
    myPins.add(pin4);
    myPins.add(pin5);
    myPins.add(pin6);
    
    myPins.add(pin7);
    myPins.add(pin8);
    myPins.add(pin9);
   // myPins.add(pin10);
    myPins.add(pin11);
    myPins.add(pin12);
    myPins.add(pin13);
    myPins.add(pin14);
    myPins.add(pin15);
    myPins.add(pin16);
    myPins.add(pin17);
    myPins.add(pin18);
    myPins.add(pin19);
    myPins.add(pin20);
    myPins.add(pin21);
    myPins.add(pin22);
    //myPins.add(pin23);
    myPins.add(pin24);
    
    myPins.add(pin25);
    myPins.add(pin26);
   // myPins.add(pin27);
   // myPins.add(pin28);
    myPins.add(pin29);
    myPins.add(pin30);
    readData();
    //WebMercator map = new WebMercator();

    for (int i = 0; i < myPins.size(); i++) {
      Pin aPin = (Pin) myPins.get(i);
      aPin.setup();
    }
  }
  void clearCompare() {
    flightCompareTable.removeAll(flightCompareTable);
  }


  void draw()
  {
    image (backgroundMap, 0, SCREENY - BAKCGROUND_HEIGHT, BACKGROUND_WIDTH, BAKCGROUND_HEIGHT);
    noFill();
    strokeWeight(16);
    stroke(0, 45, 90);
    rect(0, SCREENY - BAKCGROUND_HEIGHT, BACKGROUND_WIDTH, BAKCGROUND_HEIGHT);

    /*strokeWeight(4);
     stroke(0);
     rect( 4, SCREENY - BAKCGROUND_HEIGHT, BACKGROUND_WIDTH -9 , BAKCGROUND_HEIGHT - 8 );
     */
    strokeWeight(1);
    for (int i = 0; i < myPins.size(); i++) {
      Pin aPin = (Pin) myPins.get(i);
      aPin.draw();
    }
  }

  void readData()
  {
    backgroundMap = loadImage ("background.png");
  }
  void getHoverEvent() {
    int event;

    for (int i = 0; i<myPins.size(); i++) {
      Pin aPin = (Pin)myPins.get(i);
      event = aPin.getEvent(mouseX, mouseY);
      if (aPin.hasBeenPressed == false) {
        if (event != EVENT_NULL) {
          aPin.mouseOver();
        } else {
          aPin.mouseNotOver();
        }
      }
    }
  }
  void getMousePress() {
    int event;

    for (int i =0; i<myPins.size(); i++) {
      Pin aPin = (Pin)myPins.get(i);
      event = aPin.getEvent(mouseX, mouseY);




      if (event != EVENT_NULL) {
        aPin.mousePress();
        switch(event) {
        case 1:
          if (flightCompareTable.size() < 6)
            flightCompareTable.add("Dallas/Fort Worth, TX");
          break;
        case 2:
          if (flightCompareTable.size() < 6)
            flightCompareTable.add("Atlanta, GA");
          break;
        default:
          println("no");
        }
        mainMap.removeDuplicateAirports();
      } else {
        aPin.mouseNotPressed();
        println(mouseX, mouseY);
      }
    }
  }
  void removeDuplicateAirports() {
    ArrayList<String> tempList = new ArrayList<String>();
    for (String element : flightCompareTable) {
      if (!tempList.contains(element)) {
        tempList.add(element);
      }
    }
    flightCompareTable = tempList;
  }
}
