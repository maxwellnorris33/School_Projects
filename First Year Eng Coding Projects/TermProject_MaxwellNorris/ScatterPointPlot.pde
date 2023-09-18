class ScatterPointPlot{
  int x;
  float ymax;
  float ymin;
  int w;
  
  ScatterPointPlot(TemperatureDate temp){
   x =  50+4*temp.day.Month + 4*12*(temp.day.Year - 1990);
   w = 4;
   ymax = 500 - (temp.maxTemp * 15);
   ymin = 500 - (temp.minTemp * 15);
  }
  
  void drawSChart(){
  //draws max min and grid scatter plots
  drawSmax();
  drawSmin();
  grid();
}

void drawSmax(){
  //draws maximum scatter points
  fill(255,0,0);
    ellipse( x, ymax, w, w);
  
}
void drawSmin(){
  //draws minimum scatter points
  fill(0,200,255);
    ellipse( x, ymin, w, w);

}


}
