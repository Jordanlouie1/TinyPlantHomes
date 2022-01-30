#include <Wire.h>
#include <LiquidCrystal_I2C.h>
volatile int value; //RTOS Bro
volatile int temp; //Do not Cache
int val = 0; // declare variable
int buzzer = 3; // Define the buzzer pin at D3

//Code taken from Star wars buzzer theme tutorial
const int c = 261;
const int d = 294;
const int e = 329;
const int f = 349;
const int g = 391;
const int gS = 415;
const int a = 440;
const int aS = 455;
const int b = 466;
const int cH = 523;
const int cSH = 554;
const int dH = 587;
const int dSH = 622;
const int eH = 659;
const int fH = 698;
const int fSH = 740;
const int gH = 784;
const int gSH = 830;
const int aH = 880;
const int buzzerPin = 3;
double counter = 0;
 
int counter = 0;
LiquidCrystal_I2C mylcd (0x27,16,2); // set the LCD address to 0x27 for a16 chars and 2 line display

void setup () {
  
  Serial.begin (9600); // Set the serial port baud rate to 9600
  value = 0;
  mylcd.init ();
  mylcd.backlight (); // Light up the backlight
  mylcd.clear (); // Clear the screen
  Serial.begin (9600); // Set the serial port baud rate to 9600
  pinMode (A4, INPUT); // Temp sensor is at A2, the mode is input
  pinMode (A2, INPUT); // Humidity sensor is at A2, the mode is input
  pinMode (7, OUTPUT); //define D7 pin as output fan
  pinMode (5, OUTPUT); //LED strip
  pinMode (A0, INPUT); // MQ2 gas sensor as input
  Serial.begin (9600); // Set the serial port baud rate to 9600
  pinMode(buzzerPin, OUTPUT);// Set the digital IO pin mode for output

}
void loop () {
  
  displayLCD(temp, value)
  checkGas()
  //Play first section
  firstSection();
 
  //Play second section
  secondSection();
  checkFan()
}

void beep(int note, int duration)
{
  //Play tone on buzzerPin
  tone(buzzerPin, note, duration);
 
  //Play different LED depending on value of 'counter'

 
  //Stop tone on buzzerPin
  noTone(buzzerPin);
 
  delay(50);
 
  //Increment counter
  counter++;
}

void checkGas()
{
   
    val = analogRead (A0)
    if (val > 550){
        digitalWrite (7, HIGH);//Set Fan high
    }

    else if (val<550) 
    {
        digitalWrite (7, LOW);//Set Fan off
    }
}
void checkFan()
{
   
    
    if (counter > 300000000){
        digitalWrite (6, HIGH);//Set Fan high
    }

    else if (counter<300000000) 
    {
        digitalWrite (6, LOW);//Set Fan off
    }
}
void displayLCD(int temp, int value )
{
       if (value <300) // If the value is less than 300
{
    mylcd.clear (); // clear screen
    mylcd.setCursor (0, 0);
    mylcd.print ("Temperature:"); //
    mylcd.setCursor (12, 0);
    mylcd.print (temp);
    mylcd.setCursor (0, 1);
    mylcd.print ("dry soil"); // LCD screen print dry soil
    delay (300); // Delay 0.3S
  } 
  else if ((value>=300) && (value <= 700)) // If the value is greater than 300 and less than 700
 {
    mylcd.clear (); //clear screen
    mylcd.setCursor (0, 0);
    mylcd.print ("Temperature:");
    mylcd.setCursor (6, 0);
    mylcd.print (temp);
    mylcd.setCursor (0, 1);
    mylcd.print ("humid soil"); // LCD screen printing humid soil
    delay (300); // Delay 0.3S
  } else if (value> 700) // If the value is greater than 700
 {
    mylcd.clear ();//clear screen
    mylcd.setCursor (0, 0);
    mylcd.print ("Temperature:");
    mylcd.setCursor (6, 0);
    mylcd.print (temp);
    mylcd.setCursor (0, 1);
    mylcd.print ("in water"); /// LCD screen printing in water
    delay (300); // Delay 0.3S
  }
 }
void firstSection()
{
  beep(a, 500);
  beep(a, 500);    
  beep(a, 500);
  beep(f, 350);
  beep(cH, 150);  
  beep(a, 500);
  beep(f, 350);
  beep(cH, 150);
  beep(a, 650);
 
  delay(500);
 
  beep(eH, 500);
  beep(eH, 500);
  beep(eH, 500);  
  beep(fH, 350);
  beep(cH, 150);
  beep(gS, 500);
  beep(f, 350);
  beep(cH, 150);
  beep(a, 650);
 
  delay(500);
}
 
void secondSection()
{
  beep(aH, 500);
  beep(a, 300);
  beep(a, 150);
  beep(aH, 500);
  beep(gSH, 325);
  beep(gH, 175);
  beep(fSH, 125);
  beep(fH, 125);    
  beep(fSH, 250);
 
  delay(325);
 
  beep(aS, 250);
  beep(dSH, 500);
  beep(dH, 325);  
  beep(cSH, 175);  
  beep(cH, 125);  
  beep(b, 125);  
  beep(cH, 250);  
 
  delay(350);
}
