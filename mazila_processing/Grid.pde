void mygrid()
{
  stroke(0);
  for (int i = 0; i < width/step; i++ ) {
    line(i*step, 0, i*step, height);
    line(0, i*step, width, i*step);
  }
}

