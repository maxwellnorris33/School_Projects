void grid(){
  //draws& lables x and y axis
  stroke(0);
  line(50, 0, 50, 1000);
  line(50, 500, 2000, 500);
  
  textSize(10);
  
  int t = 0;
  for(int i = 500; i >= 125; i-=75)
  {
   fill(0);
   text(t, 20, i);
   t+=5;
  }
  
  t = -5;
  for(int i = 575; i<= 725; i+=75){
    fill(0);
    text(t, 20, i);
    t-=5;
  }
  fill(255);
  textSize(12);
  int year = 1990;
  for(int i = 54; i <= 1494; i+=4*12*2){
   text(year, i, 520);
   year+=2;
   
  }
}
