class TemperatureDate
{
  //stores temperature data and date
  Date day ;
  float minTemp;
  float maxTemp;
  float snowfall; 
  
  TemperatureDate(){
    day = new Date(0,0);
    minTemp = 0;
    maxTemp = 0;
    snowfall = 0;
    
  }
  
  TemperatureDate(int y, int m, float max, float min, float snow){
    minTemp = min;
    maxTemp = max;
    snowfall = snow;
    day = new Date(m, y);
  }
  
  class Date
{
  int Month;
  int Year;
  
  Date(int m, int y){
   Month = m;
   Year = y;
  }
}
  
}
