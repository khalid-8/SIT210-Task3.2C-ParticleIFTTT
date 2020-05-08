// This #include statement was automatically added by the Particle IDE.
#include <HC_SR04.h>


// Sensor gateway using the Argon board. This contains the HC-SR04
// Ultrasonic code and sends data to the other nodes to notify of a trip


double cm = 0.0;
//bool beam_status = false;

int trigPin = A0;
int echoPin = A1;

HC_SR04 rangefinder = HC_SR04(trigPin, echoPin);

void setup() 
{
    Spark.variable("cm", &cm, DOUBLE);
}

void loop() 
{
    cm = rangefinder.getDistanceCM();
    

    if (cm<30)
    {
        
        Particle.publish("Exposure" , "SunLight", PRIVATE);
        
    } 
    else {
        
        Particle.publish("Exposure" , "No_SunLight", PRIVATE);
        
    } 
   
    delay(15000);
}
