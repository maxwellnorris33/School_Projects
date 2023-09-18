class snowfall{
 float snow;
 int x_coordinate;
 int wide;
 
 snowfall(){
  snow = 0;
  x_coordinate = 0;
  wide = 4;
 }
 
 snowfall(TemperatureDate temp){
   snow = 500 - (temp.snowfall * 15);
   x_coordinate = 50+4*temp.day.Month + 4*12*(temp.day.Year - 1990);
   wide = 4;
 }
 
 void plotSnowfall(){
   fill(255);
   ellipse(x_coordinate, snow, wide, wide);
 }
 
}
