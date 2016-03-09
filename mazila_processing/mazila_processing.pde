import processing.serial.*;

int step = 10;

Serial myPort;
String inString = null; 
int lf = 10;      // ASCII linefeed
int timer;
float xw = 50, xn = 50;
float yw = 300, yn = 300;
float Q = 0;
float   mQ = 0;
int D = 0;
boolean marker = false;


void setup()
{
  size(1000, 600);
  background(100);  
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 57600);
  myPort.bufferUntil(lf);
  ellipse (xw, yw, 2, 2);
  stroke(153);
  line(xw, yw, xn, yn);
  mygrid();
}

void draw()
{

  if ( myPort.available() > 0) {

    inString = myPort.readStringUntil('\n');
  }
  if (inString == null)
  {
  } else if (inString !=null) {

    String Cmd = inString.trim();
    println(Cmd);
    int mlen = Cmd.length();
    if (mlen >= 2) {
      String mCmd = Cmd.substring(0, 3);

      if (mCmd.equals("run"))
      {
        background(100); 
        mygrid();
        xw = 50; 
        xn = 50; 
        yw = 300; 
        yn = 300;
      }
      if (mCmd.equals("pen"))
      {
        String Znach = Cmd.substring(3, Cmd.length());
        int mr = Integer.parseInt(Znach);
        if (mr == 1) { 
          marker = true;
        } else 
        { 
          marker = false;
        }
        println("risuem - " + marker);
      }

      if (mCmd.equals("len"))
      {
        String Znach = Cmd.substring(3, Cmd.length());
        // println(Znach);  
        D = Integer.parseInt(Znach);
        D = D*20;
        xn = xw+D*cos(Q);
        yn = yw + D*sin(Q);
        //text("dlina puti D : " + D, 10,110);
        println("dlina puti D : " + D);
      }

      if (mCmd.equals("ang"))
      {
        String Znach = Cmd.substring(3, Cmd.length()); 
        mQ = radians(Float.parseFloat(Znach)); 
        println("ugol comanda Q : " + Q);//, 10,110);
        xn = xw;
        yn = yw;
        Q = Q+mQ;
        println("povorot na Q : " + Q);
      }

      Cmd = "";
      mCmd = "";
      inString = null;    
      ellipse(xn, yn, 1, 1);
      if (marker)
      {
        stroke(255);
        line (xw, yw, xn, yn);
      }
      xw = xn; 
      yw = yn;
      D = 0;
    }
  }
}