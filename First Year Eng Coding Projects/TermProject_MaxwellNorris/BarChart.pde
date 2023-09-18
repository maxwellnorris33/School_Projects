class BarChart{
  int x;
  float ymax;
  float ymin;
  int w;
  float lmax;
  float lmin;
  
  BarChart(TemperatureDate  temp ){
    x= 50+4*temp.day.Month + 4*12*(temp.day.Year - 1990);
    ymax = 500 - (temp.maxTemp * 15);
    ymin = 500 - (temp.minTemp * 15);
    w = 4;
    lmax = abs(temp.maxTemp * 15);
    lmin = abs(temp.minTemp * 15);
  }
  
  void drawBChart(){
  //draws max and min bar graphs
  drawBmax();
  drawBmin();
  grid();
}

void drawBmin(){
  fill(0,200,255);
  //draws min for when min button is pressed
  if(maxMin==1){ 
     if (ymin > 500){
       rect(x, 500, w, lmin);
   }
   else { 
     rect(x, ymin, w, lmin); 
   }
  }
  
  else{    //draws normal min bar graph
 
   if (ymin > 500){
     if(ymax >500){
       rect(x, 500+lmax, w, lmin-lmax);
     }
     else{
       rect(x, 500, w, lmin);
     }
   }
   else { 
     rect(x, ymin, w, lmin); 
   }
  }
  
}

void drawBmax(){
   fill(255,0,0);
   //draws max graph if max button is pressesd
   if(maxMin==2){
     if (ymax > 500){
       rect(x, 500, w, lmax);
     }
     else { 
       rect(x, ymax, w, lmax); 
   }
  }
  
  else{ //draws normal max bar chart
  
    if( ymax > 500){
      rect(x, 500, w, lmax);
    }
    else{
      if(ymin < 500){
        rect(x, ymax, w, lmax-lmin);
      }
      else{
        rect(x, ymax, w, lmax); 
      }
    }
  }


}
  
}
