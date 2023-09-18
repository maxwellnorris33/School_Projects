void lineGraph(ScatterPointPlot[] sc){
  //draws line graphs
  minLine(sc);
  maxLine(sc);
  grid();
}

void minLine(ScatterPointPlot[] sc){
  //draw min line only
  stroke(0,200,255);
  for(int i = 0; i < sc.length-1; i++){
    line( sc[i].x, sc[i].ymin, sc[i+1].x, sc[i+1].ymin);
  }
}

void maxLine(ScatterPointPlot[] sc){
  //draws max line only, get it its my name
  stroke(255, 0 , 0);
  for(int i = 0; i < sc.length-1; i++){
    line( sc[i].x, sc[i].ymax, sc[i+1].x, sc[i+1].ymax);
  }
}
