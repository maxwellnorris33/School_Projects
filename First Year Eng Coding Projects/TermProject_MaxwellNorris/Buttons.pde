


public void BarChart(){
  
  if(button!=1){
  button = 1;
  }
  else{
    button = 0;
  }
 
}

public void ScatterPlot(){
  if(button!=2){
   button =2; 
  }
  else{
   button = 0; 
  }
}

public void Maximum(){
  if (maxMin==0){
    maxMin=2;
  }
  else{
    maxMin=0;
  }
}

public void Minimum(){
  if (maxMin==0){
    maxMin=1;
  }
  else{
    maxMin=0;
  }
}

public void Jan(){
  if(Month[0]==true){
    Month[0]=false;
    monthButtons[0].setColorBackground(color(0,200,255));
  }
  else{
    Month[0]=true;
    monthButtons[0].setColorBackground(color(0,0,95));
  }
}

public void Feb(){
  if(Month[1]==true){
    Month[1]=false;
    monthButtons[1].setColorBackground(color(0,200,255));
  }
  else{
    Month[1]=true;
    monthButtons[1].setColorBackground(color(0,0,95));
  }
}

public void March(){
  if(Month[2]==true){
    Month[2]=false;
    monthButtons[2].setColorBackground(color(0,200,255));
  }
  else{
    Month[2]=true;
    monthButtons[2].setColorBackground(color(0,0,95));
  }
}

public void Apr(){
  if(Month[3]==true){
    Month[3]=false;
    monthButtons[3].setColorBackground(color(0,200,255));
  }
  else{
    Month[3]=true;
    monthButtons[3].setColorBackground(color(0,0,95));
  }
}

public void May(){
  if(Month[4]==true){
    Month[4]=false;
    monthButtons[4].setColorBackground(color(0,200,255));
  }
  else{
    Month[4]=true;
    monthButtons[4].setColorBackground(color(0,0,95));
  }
}

public void June(){
  if(Month[5]==true){
    Month[5]=false;
    monthButtons[5].setColorBackground(color(0,200,255));
  }
  else{
    Month[5]=true;
    monthButtons[5].setColorBackground(color(0,0,95));
  }
}

public void July(){
  if(Month[6]==true){
    Month[6]=false;
    monthButtons[6].setColorBackground(color(0,200,255));
  }
  else{
    Month[6]=true;
    monthButtons[6].setColorBackground(color(0,0,95));
  }
}

public void Aug(){
  if(Month[7]==true){
    Month[7]=false;
    monthButtons[7].setColorBackground(color(0,200,255));
  }
  else{
    Month[7]=true;
    monthButtons[7].setColorBackground(color(0,0,95));
  }
}

public void Sept(){
  if(Month[8]==true){
    Month[8]=false;
    monthButtons[8].setColorBackground(color(0,200,255));
  }
  else{
    Month[8]=true;
    monthButtons[8].setColorBackground(color(0,0,95));
  }
}

public void Oct(){
  if(Month[9]==true){
    Month[9]=false;
    monthButtons[9].setColorBackground(color(0,200,255));
  }
  else{
    Month[9]=true;
    monthButtons[9].setColorBackground(color(0,0,95));
  }
}

public void nov(){
  if(Month[10]==true){
    Month[10]=false;
    monthButtons[10].setColorBackground(color(0,200,255));
  }
  else{
    Month[10]=true;
    monthButtons[10].setColorBackground(color(0,0,95));
  }
}

public void dec(){
  if(Month[11]==true){
    Month[11]=false;
    monthButtons[11].setColorBackground(color(0,200,255));
  }
  else{
    Month[11]=true;
    monthButtons[11].setColorBackground(color(0,0,95));
  }
}

public void RESET(){
  //resets all buttons to default settings
  for(int i = 0; i<Month.length; i++){
    Month[i] = true;
    monthButtons[i].setColorBackground(color(0,0,95));
  }
  if(maxMin==1||maxMin==2)
    maxMin=0;
  if(yesSnow==true)
    yesSnow=false;
}

public void Snowfall(){
  if(yesSnow==true){
    yesSnow=false;
  }
  else{
    yesSnow=true;
  }
}

public void LineGraph(){
  if(button==3){
   button=0; 
  }
  else{
   button=3; 
  }
}
