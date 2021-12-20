import processing.serial.*;


void setup() {
  size(1200, 800);
  myPort = new Serial(this, portName, 921600);  
  myPort.clear();
  table = loadTable("211201_02_Filtered.csv", "header");
  //println(table.getInt(0,0));
  //println(table.getInt(1,0));
  textAlign(LEFT, CENTER); 
 
  //table.getColumnCount()
  //table.getRowCount()
  savedTime = millis();
  centerX = random(width);
  centerY = random(height);

  delay(2000);
}

void draw() {
  background(0);
  fill(255);


  totalTime= table.getInt(d,0);
  int passedTime = millis()- savedTime;
  fill(255);
  
  //println("passed:"+passedTime/1000);
  //println("total:"+totalTime);
  
  if(myPort.available()>0){
    val = myPort.readStringUntil('\n');
    if (val!=null) 
    {
      println(val);
      if(val.equals("reset"))
      {
        println(val);
      }  
    }
    val = trim(val);
    //println(val);
  }
  
  for(int i =0; i< holes.size(); i++)
  {
    Hole myHole = holes.get(i);
    myHole.display();
    myHole.move();
    if(myHole.del==true)
    {
      holes.remove(i);
    }
    if(val!=null)
    {
      if (val.equals("reset")==true)
      {  
        println("reseted");
        for (int k=0 ; k<holes.size(); k++)
        {
          holes.remove(k);
        }
      }
    }
  }
 
  holes.add(new Hole(centerX, centerY, passedTime));
  
  //ellipse(centerX, centerY, passedTime/10, passedTime/10);
  
  if (passedTime/1000 > totalTime){
      if (d > table.getColumnCount())
      {
        d = 0;
      }
      //println(totalTime+"초가 지났습니다.");
      savedTime = millis();
      d++;
      centerX = random(width);
      centerY = random(height);
  }
 
    //text(table.getString(d,0), centerX, centerY);
    fill(120, 200, 50, 50);
    //ellipse(centerX, centerY, sqrt(table.getFloat(d, 2))*3, sqrt(table.getFloat(d, 2))*3);
  

}
  
void stop(){
  myPort.clear();
  myPort.stop();
  
}
  
