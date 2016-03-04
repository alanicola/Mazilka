void Up()                                          // set pen servo to raised position
{
  for(int i=0;i<15;i++)                            // send 15 pulses to the servo to allow time for the servo to reach the new position
  {
    digitalWrite(Srvopin,1);                       // set servo control pin high to start pulse
    delayMicroseconds(1100);                       // hold pulse high for 1500uS
    digitalWrite(Srvopin,0);                       // set servo control pin low to finish pulse
    delay(20);                                     // wait for 20mS before repeating the pulse
  }
//  pen=0;
//  Serial.println("pen0");
//
//  delay(250);
//    myservo.attach(12);
//  Serial.println("PEN_UP()");
//    myservo.write(90);
////  delayMicroseconds(2100);
//  myservo.detach();
  pen=0;
  Serial.println("pen0");
}
