void Down()                                        // set pen servo to raised position
{
      for(int i=0;i<15;i++)                            // send 15 pulses to the servo to allow time for the servo to reach the new position
      {
        digitalWrite(Srvopin,1);                       // set servo control pin high to start pulse
        delayMicroseconds(1000);                        // hold pulse high for 2200uS
        digitalWrite(Srvopin,0);                       // set servo control pin low to finish pulse
        delay(20);                                     // wait for 20mS before repeating the pulse
      }
//    delay(250);
  //  Serial.println(DOWN);
  //  penServo.write(DOWN);
  //// delayMicroseconds(2100);
  //myservo.attach(12);
  //  Serial.println("PEN_UP()");
//  myservo.write(80);
//  ////  delayMicroseconds(2100);
//  myservo.detach();

  pen = 1;
  Serial.println("pen1"); // risuem
}
