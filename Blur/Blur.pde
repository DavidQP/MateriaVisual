String[] shaders = new String[] {"hue.glsl", "pixelate.glsl","blur.glsl"};
  
PGraphics pg;
PShader shade;
PImage imagen;
PImage imagen2;
int idxShader = 0;
int idxSource = 0;
void setup() 
{
  size(800, 640, P3D);
  textSize(22);
  fill(0);
  pg = createGraphics(800, 640);
  imagen = loadImage("cyt.jpg");
  imagen2 = loadImage("a.jpg");
  setupShader();
  
}

void draw() 
{
  //setShaderParameters();

  //shader(shade);
  image(imagen, 0, 0, width, height);

  //resetShader();
  text(shaders[idxShader], 5, 20);
  pg.beginDraw();
  pg.image(imagen2, 0, 0, width, height);
  //setShaderParameters();
  pg.clear();
  pg.stroke(0);
  pg.fill(255,255,255,40);
  pg.rectMode(CENTER);
  pg.rect(mouseX, mouseY, 80, 80);
  pg.endDraw();
  image(pg, 0, 0);
}

void setupShader() 
{
  shade = loadShader(shaders[idxShader]);
}

void setShaderParameters() 
{
  if (idxShader == 0) {
    shade.set("hue", map(mouseX, 0, width, 0, TWO_PI));
    System.out.println("Puntos: " + map(mouseX, 0, width, 0, TWO_PI));
  } 

  // pixelate
  else if (idxShader == 1) {
    shade.set("pixels", 0.1 * mouseX, 0.1 * mouseY);
  } 
  else if(idxShader == 2){
    shade.set("sigma", map(mouseX, 0, width, 0, 10.0));
    shade.set("blurSize", (int) map(mouseY, 0, height, 0, 30.0));
  }
  
   
}

void keyPressed() {
  if(key == 'n'){
    idxShader = (idxShader + 1) % shaders.length;
    setupShader();
  } else {
    fill(0);
   pg.ellipse(mouseX, mouseY, 100, 100); 
  }
  

}