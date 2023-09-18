void createStrings(){
  //populates strings of tipes listed below and imports table from files
table = loadTable("CalgaryWeather.csv");
  
  for(int i = 0; i < Temp.length; i++){
    Temp[i] = new  TemperatureDate(table.getInt(i,0), table.getInt(i,1), table.getFloat(i,2)
                                   , table.getFloat(i,3), table.getFloat(i,4));
  }
  
  for(int i = 0; i< Bar.length; i++){
   Bar[i] = new BarChart(Temp[i]); 
  }
  
  for(int i = 0; i< Scat.length; i++){
   Scat[i] = new ScatterPointPlot(Temp[i]); 
  }
  
  for(int i = 0; i < Snow.length; i++){
    Snow[i] = new snowfall(Temp[i]);
  }
  
}
