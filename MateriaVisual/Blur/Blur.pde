String shaders = "blur.glsl";

PShader shade;
PImage img1;

void setup() 
{
  size(640, 480, P2D);
  textSize(22);
  fill(0);

  // load sources
  img1 = loadImage("cyt.jpg");


  setupShader();
}

void draw() 
{
  setShaderParameters();

  shader(shade);
  image(img1, 0, 0, width, height);

  resetShader();
  text(shaders, 5, 20);
}

void setupShader() 
{
  shade = loadShader(shaders);
}

void setShaderParameters() 
{
  shade.set("sigma", map(mouseX, 0, width, 0, 10.0));
  shade.set("blurSize", (int) map(mouseY, 0, height, 0, 30.0));
   
}