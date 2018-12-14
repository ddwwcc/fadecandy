OPC opc;

float current_colour[] = { 230, 16, 56 };
float desired_colour[] = { 230, 16, 56 };

void setup()
{
  size(360, 360);

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map an 8x8 grid of LEDs to the center of the window
  opc.ledGrid8x8(0, width/2, height/2, height / 12.0, 0, false);


  frameRate(50);
  
  colorMode(RGB, 255);
}

void draw()
{
  if ((current_colour[0] == desired_colour[0]) && (current_colour[1] == desired_colour[1]) && (current_colour[2] == desired_colour[2]))
  {
    desired_colour[0] = round(random(255));
    desired_colour[1] = round(random(255));
    desired_colour[2] = round(random(255));
  }
  else
  {
    for (int i = 0; i < 3; i++)
    {
      if(current_colour[i] > desired_colour[i])
      {
        current_colour[i] = current_colour[i] - 1;
      }
      if(current_colour[i] < desired_colour[i])
      {
        current_colour[i] = current_colour[i] + 1;
      }
    }
  }
  background(current_colour[0], current_colour[1], current_colour[2]);


}
