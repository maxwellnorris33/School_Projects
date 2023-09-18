// First year coding course in processing IDE
// install this module for code to work https://github.com/sojamo/controlp5
import controlP5.*; 

int button=0;
int maxMin = 0;
boolean yesSnow = true;
ControlP5 cp5; 
Button [] monthButtons = new Button[12];
//monthButtons[i] = new Button(cp5, 

Table table;
TemperatureDate[] Temp = new TemperatureDate[360];
BarChart [] Bar = new BarChart[360];
ScatterPointPlot [] Scat = new ScatterPointPlot[360];
boolean [] Month = new boolean[12];
snowfall [] Snow = new snowfall[360];

void setup(){
  background(150);
  size(1600,800);
  
  for(int i = 0; i< Month.length; i++)
    Month[i] = false;
  
  createStrings();
  
  cp5 = new ControlP5(this);
  cp5.addButton("BarChart").setValue(1).setPosition(100,20).setSize(100,60);
  cp5.addButton("ScatterPlot").setValue(2).setPosition(220,20).setSize(100,60);
  cp5.addButton("Minimum").setValue(3).setPosition(340,20).setSize(80,40);
  cp5.addButton("Maximum").setValue(4).setPosition(440,20).setSize(80,40);
  cp5.addButton("Snowfall").setValue(4).setPosition(1040,20).setSize(80,40);
  cp5.addButton("LineGraph").setValue(4).setPosition(1140,20).setSize(100,60);
  
  monthButtons[0] = new Button(cp5,"Jan").setValue(5).setPosition(540,20).setSize(60,20);
  monthButtons[1] = new Button(cp5,"Feb").setValue(6).setPosition(610,20).setSize(60,20);
  monthButtons[2] = new Button(cp5,"March").setValue(5).setPosition(680,20).setSize(60,20);
  monthButtons[3] = new Button(cp5,"Apr").setValue(5).setPosition(750,20).setSize(60,20);
  monthButtons[4] = new Button(cp5,"May").setValue(5).setPosition(820,20).setSize(60,20);
  monthButtons[5] = new Button(cp5,"June").setValue(5).setPosition(890,20).setSize(60,20);
  monthButtons[6] = new Button(cp5,"July").setValue(5).setPosition(540,50).setSize(60,20);
  monthButtons[7] = new Button(cp5,"Aug").setValue(5).setPosition(610,50).setSize(60,20);
  monthButtons[8] = new Button(cp5,"Sept").setValue(5).setPosition(680,50).setSize(60,20);
  monthButtons[9] = new Button(cp5,"Oct").setValue(5).setPosition(750,50).setSize(60,20);
  monthButtons[10] = new Button(cp5,"nov").setValue(5).setPosition(820,50).setSize(60,20);
  monthButtons[11] = new Button(cp5,"dec").setValue(5).setPosition(890,50).setSize(60,20);
  cp5.addButton("RESET").setValue(5).setPosition(960,20).setSize(60,50);
}

void draw()
{
  background(150);
  if(button==1){
    if(maxMin==1){
      for(int m = 0; m< Month.length; m++){
        if(Month[m]==true){
          for(int i =m; i<Bar.length; i+=12)
            Bar[i].drawBmin();
        }
      }
      grid();
        
    }
    else if(maxMin==2){
      for(int mon =0; mon<Month.length; mon++){
        if(Month[mon]==true){
          for(int i =mon; i<Bar.length; i+=12)
            Bar[i].drawBmax();
     
        }
         grid();
      }
    }
    else{
      for(int mon = 0; mon<Month.length; mon++){
        if(Month[mon]==true){
          for(int i = mon; i< Bar.length; i+=12)
            Bar[i].drawBChart();
        }
      }
    }
  }
  
    
  else if (button ==2){
    if(maxMin==1){
      for(int month = 0; month<Month.length; month++){
        if(Month[month]==true){
          for(int i = month; i<Scat.length;i+=12)
            Scat[i].drawSmin();
        }
      }
      grid();
    }
    else if (maxMin==2){
      for(int month =0; month<Month.length; month++){
        if(Month[month]==true){
          for(int i = month; i<Scat.length;i+=12)
            Scat[i].drawSmax();
        }
      }
      grid();
    }
    else{
      for(int month =0; month<Month.length; month++){
        if(Month[month]==true){
          for(int i = month; i<Scat.length;i+=12 )
            Scat[i].drawSChart();
        }
      }
    }
  }
  
  
  
  if(button==3){
   if(maxMin==0){
     lineGraph(Scat);
   }
   else if (maxMin==1){
     minLine(Scat);
     grid();
   }
   else if (maxMin==2){
     maxLine(Scat);
     grid();
   }
  }
  
  if(yesSnow==true){
    if(button == 2|| button == 1|| button ==3){
      for(int month =0; month<Month.length; month++){
        if(Month[month]==true){
          for(int i = month; i<Snow.length;i+=12 )
            Snow[i].plotSnowfall();
       
        }
      }
    }
  }
  
}
