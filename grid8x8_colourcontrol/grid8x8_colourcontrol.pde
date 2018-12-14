OPC opc;

float current_colour[] = { 0, 0, 0 };
float desired_colour[] = { 0, 0, 0 };

void setup()
{
  size(255, 255);

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map an 8x8 grid of LEDs to the center of the window
  opc.ledGrid8x8(0, width/2, height/2, height / 12.0, 0, false);


  frameRate(50);
  
  colorMode(RGB, 255);
}

void draw()
{
  if ((current_colour[0] != desired_colour[0]) || (current_colour[1] != desired_colour[1]) || (current_colour[2] != desired_colour[2]))
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

  background(current_colour[0], current_colour[1], current_colour[2]); //<>//

  float inv_color = brightness(color(current_colour[0], current_colour[1], current_colour[2]));

  if(inv_color > 128)
  {
    fill(0);
    stroke(0);
  }
  else
  {
    fill(255);
    stroke(255);
  }
  
  line((width / 3), 0, (width / 3), height);
  
  line(((width / 3) * 2), 0, ((width / 3) * 2), height);
  
  textSize(20);
      
  text("Red",28, 30); 

  text("Green",100, 30); 

  text("Blue",195, 30); 

  text((int)current_colour[0], 28, 235); 

  text((int)current_colour[1], 110, 235); 

  text((int)current_colour[2], 195, 235); 
}

void mouseDragged() 
{
  if ((mouseX > 0) && (mouseX < (width / 3)))
  {
    desired_colour[0] = map(constrain(mouseY, 0, height), 0, 255, 0, height);
  }

  if ((mouseX > ((width / 3)+1) && (mouseX < ((width / 3) * 2))))
  {
    desired_colour[1] = map(constrain(mouseY, 0, height), 0, 255, 0, height);
  }

  if ((mouseX > (((width / 3) * 2) + 1)) && (mouseX < width ))
  {
    //desired_colour[2] = map(mouseY, 0, height, 0, 255);
    desired_colour[2] = map(constrain(mouseY, 0, height), 0, 255, 0, height);
  }

}

void mouseClicked() 
{
  if ((mouseX > 0) && (mouseX < (width / 3)))
  {
    desired_colour[0] = map(constrain(mouseY, 0, height), 0, 255, 0, height);
  }

  if ((mouseX > ((width / 3)+1) && (mouseX < ((width / 3) * 2))))
  {
    desired_colour[1] = map(constrain(mouseY, 0, height), 0, 255, 0, height);
  }

  if ((mouseX > (((width / 3) * 2) + 1)) && (mouseX < width ))
  {
    //desired_colour[2] = map(mouseY, 0, height, 0, 255);
    desired_colour[2] = map(constrain(mouseY, 0, height), 0, 255, 0, height);
  }

}
