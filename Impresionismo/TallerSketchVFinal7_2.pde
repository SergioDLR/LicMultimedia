
import TUIO.*;
TuioProcessing tuioClient;
int valorDeIdle;
int x;
int y;
int contador;
String estados;
PImage imagen[];
int cant = 195;
int tamanoPantallaX = 1280;
int tamanoPantallaY = 720;
int xPantalla = -50;
int yPantalla = -50;
int alphaDeCursor = 255;
PImage imagenMenu;
int contadorIdle = 0;



void setup() {
  tuioClient  = new TuioProcessing(this);
  ellipseMode(CENTER);
  estados = "menu";
  imagen = new PImage[cant];
  size(1280, 720);
  imagenMenu = loadImage("00.jpg");
  imagenMenu.resize(tamanoPantallaX, tamanoPantallaY);
  for (int i = 0; i<imagen.length; i++) {
    imagen[i] = loadImage(i+".jpg");
    imagen[i].resize(tamanoPantallaX, tamanoPantallaY);
  }
  noStroke();
}


void draw() {
   
  if (estados == "menu" ) {
    image(imagenMenu, 0, 0);
  }
  for (int i=0; i<imagen.length; i++) {
    if (estados.equals("pagina"+i)) {
      image(imagen[i], 0, 0);
    }
  }
  pushStyle();
  fill(alphaDeCursor);
  ellipse(xPantalla, yPantalla, 50, 50);
  popStyle();
  
  //Cambio De pantalla Menu
  cambiarPantalla("pagina0", "pagina1", 0.34*width, 0.64*height, 50);
  cambiarPantalla("pagina0", "pagina9", 0.41*width, 0.39*height, 50);
  cambiarPantalla("pagina0", "pagina14", 0.59*width, 0.40*height, 50);
  cambiarPantalla("pagina0", "pagina19", 0.65*width, 0.65*height, 50);
  // informacion
  hover("pagina1", "pagina2", 0.078*width, 0.75*height, 50);
  hover("pagina1", "pagina3", 0.50*width, 0.38*height, 50);
  hover("pagina1", "pagina4", 0.52*width, 0.71*height, 50);
  hover("pagina1", "pagina5", 0.81*width, 0.39*height, 50);
  cambiarPantalla("pagina1", "pagina6", 0.84*width, 0.77*height, 50);
  hover("pagina6", "pagina7", 0.65*width, 0.84*height, 50);
  hover("pagina6", "pagina8", 0.77*width, 0.84*height, 50);
  cambiarPantalla("pagina6", "pagina1", 0.10*width, 0.91*height, 50);
  // fin pantalla informacion

  // teoria de color
  hover("pagina14", "pagina15", 0.25*width, 0.56*height, 50);
  hover("pagina14", "pagina16", 0.70*width, 0.54*height, 50);
  hover("pagina14", "pagina17", 0.26*width, 0.85*height, 50);
  hover("pagina14", "pagina18", 0.70*width, 0.84*height, 50);
  //tecnica
  hover("pagina9", "pagina10", 0.23*width, 0.55*height, 80);
  hover("pagina9", "pagina11", 0.71*width, 0.55*height, 80);
  hover("pagina9", "pagina12", 0.22*width, 0.85*height, 80);
  hover("pagina9", "pagina13", 0.72*width, 0.85*height, 80);
  //Antecedentes
  cambiarPantalla("pagina19", "pagina20", 0.25*width, 0.50*height, 80);
  cambiarPantalla("pagina19", "pagina24", 0.70*width, 0.52*height, 80);
  cambiarPantalla("pagina19", "pagina28", 0.24*width, 0.80*height, 80);
  cambiarPantalla("pagina19", "pagina32", 0.71*width, 0.80*height, 80);
  //antecedentes hover 1 lluvia
  hover("pagina20", "pagina23", 0.62*width, 0.47*height, 50);
  hover("pagina20", "pagina22", 0.37*width, 0.28*height, 50);
  hover("pagina20", "pagina21", 0.09*width, 0.53*height, 50);
  cambiarPantalla("pagina20", "pagina19", 0.09*width, 0.91*height, 50);
  //antecedentes 2
  hover("pagina24", "pagina25", 0.13*width, 0.69*height, 50);
  hover("pagina24", "pagina26", 0.30*width, 0.28*height, 50);
  hover("pagina24", "pagina27", 0.67*width, 0.51*height, 50);
  cambiarPantalla("pagina24", "pagina19", 0.09*width, 0.91*height, 50);
  //antecedentes 3
  hover("pagina28", "pagina29", 0.27*width, 0.48*height, 50);
  hover("pagina28", "pagina30", 0.67*width, 0.16*height, 50);
  hover("pagina28", "pagina31", 0.51*width, 0.55*height, 50);
  cambiarPantalla("pagina28", "pagina19", 0.09*width, 0.91*height, 50);
  //antecedentes 4
  hover("pagina32", "pagina33", 0.19*width, 0.36*height, 50);
  hover("pagina32", "pagina34", 0.41*width, 0.56*height, 50);
  hover("pagina32", "pagina35", 0.75*width, 0.26*height, 50);
  cambiarPantalla("pagina32", "pagina19", 0.09*width, 0.91*height, 50);
  //cambios menu
  cambioMenu("pagina9", "pagina14", "pagina19", 0.50*width, 0.12*height, 50, "pagina1");
  cambioMenu("pagina1", "pagina14", "pagina19", 0.63*width, 0.12*height, 50, "pagina9");
  cambioMenu("pagina1", "pagina9", "pagina19", 0.76*width, 0.12*height, 50, "pagina14");
  cambioMenu("pagina1", "pagina9", "pagina14", 0.89*width, 0.12*height, 50, "pagina19");

  //monet

  
  hover("pagina36", "pagina37", 0.15*width, 0.74*height, 30);
  hover("pagina36", "pagina38", 0.12*width, 0.70*height, 30);
  hover("pagina36", "pagina39", 0.40*width, 0.68*height, 60);
  hover("pagina36", "pagina40", 0.58*width, 0.69*height, 60);
  cambiarPantalla("pagina36", "pagina41", 0.81*width, 0.69*height, 80);
  hover("pagina41", "pagina42", 0.79*width, 0.86*height, 60);
  cambiarPantalla("pagina41", "pagina36", 0.09*width, 0.93*height, 80);
  //monet menut inicial
  cambiarPantalla("pagina36", "pagina43", 0.10*width, 0.20*height, 80);
  cambiarPantalla("pagina36", "pagina57", 0.30*width, 0.20*height, 80);
  cambiarPantalla("pagina36", "pagina76", 0.69*width, 0.20*height, 80);
  cambiarPantalla("pagina36", "pagina84", 0.88*width, 0.20*height, 80);
  //monet menu 
  cambioMenu("pagina57", "pagina76", "pagina84", 0.10*width, 0.20*height, 50, "pagina43");
  cambioMenu("pagina43", "pagina76", "pagina84", 0.29*width, 0.20*height, 50, "pagina57");
  cambioMenu("pagina43", "pagina57", "pagina84", 0.70*width, 0.20*height, 50, "pagina76");
  cambioMenu("pagina43", "pagina57", "pagina76", 0.89*width, 0.19*height, 50, "pagina84");
  //monet tenica
  cambiarPantalla("pagina43", "pagina44", 0.15*width, 0.68*height, 40);
  hover("pagina44", "pagina45", 0.79*width, 0.86*height, 40);
  cambiarPantalla("pagina44", "pagina43", 0.09*width, 0.93*height, 40);
  cambiarPantalla("pagina44", "pagina46", 0.96*width, 0.40*height, 40);
  cambiarPantalla("pagina44", "pagina52", 0.024*width, 0.41*height, 40);
  hover("pagina46", "pagina47", 0.79*width, 0.86*height, 40);
  cambiarPantalla("pagina46", "pagina48", 0.96*width, 0.40*height, 40);
  cambiarPantalla("pagina46", "pagina44", 0.024*width, 0.41*height, 40);
  cambiarPantalla("pagina46", "pagina43", 0.09*width, 0.93*height, 40);
  hover("pagina48", "pagina49", 0.79*width, 0.86*height, 40);
  cambiarPantalla("pagina48", "pagina50", 0.96*width, 0.40*height, 40);
  cambiarPantalla("pagina48", "pagina46", 0.024*width, 0.41*height, 40);
  cambiarPantalla("pagina48", "pagina43", 0.09*width, 0.93*height, 40);
  hover("pagina50", "pagina51", 0.79*width, 0.86*height, 40);
  cambiarPantalla("pagina50", "pagina52", 0.96*width, 0.40*height, 40);
  cambiarPantalla("pagina50", "pagina48", 0.024*width, 0.41*height, 40);
  cambiarPantalla("pagina50", "pagina43", 0.09*width, 0.93*height, 40);

  cambiarPantalla("pagina52", "pagina44", 0.96*width, 0.40*height, 40);
  cambiarPantalla("pagina52", "pagina50", 0.024*width, 0.41*height, 40);
  cambiarPantalla("pagina52", "pagina43", 0.09*width, 0.93*height, 40);
  hover("pagina52", "pagina53", 0.79*width, 0.86*height, 40);

  hover("pagina43", "pagina54", 0.41*width, 0.72*height, 60);
  hover("pagina43", "pagina55", 0.64*width, 0.72*height, 60);
  hover("pagina43", "pagina56", 0.86*width, 0.72*height, 60);

  //monet pinturas destacadas
  cambiarPantalla("pagina57", "pagina58", 0.22*width, 0.69*height, 80);
  cambiarPantalla("pagina57", "pagina64", 0.52*width, 0.69*height, 80);
  cambiarPantalla("pagina57", "pagina70", 0.84*width, 0.69*height, 80);

  //hovers pinturas
  hover("pagina58", "pagina59", 0.68*width, 0.85*height, 40);
  hover("pagina58", "pagina60", 0.80*width, 0.86*height, 40);
  hover("pagina58", "pagina63", 0.56*width, 0.38*height, 40);
  hover("pagina58", "pagina62", 0.62*width, 0.62*height, 60);
  hover("pagina58", "pagina61", 0.22*width, 0.55*height, 60);
  cambiarPantalla("pagina58", "pagina57", 0.09*width, 0.92*height, 80);

  //pintura2
  hover("pagina64", "pagina65", 0.68*width, 0.85*height, 60);
  hover("pagina64", "pagina66", 0.80*width, 0.86*height, 60);
  hover("pagina64", "pagina69", 0.61*width, 0.26*height, 40);
  hover("pagina64", "pagina68", 0.47*width, 0.59*height, 40);
  hover("pagina64", "pagina67", 0.11*width, 0.50*height, 40);
  cambiarPantalla("pagina64", "pagina57", 0.09*width, 0.92*height, 80);

  //pintura3 
  hover("pagina70", "pagina71", 0.68*width, 0.85*height, 60);
  hover("pagina70", "pagina72", 0.80*width, 0.86*height, 60);
  hover("pagina70", "pagina75", 0.59*width, 0.37*height, 40);
  hover("pagina70", "pagina74", 0.39*width, 0.73*height, 40);
  hover("pagina70", "pagina73", 0.16*width, 0.31*height, 40);
  cambiarPantalla("pagina70", "pagina57", 0.09*width, 0.92*height, 80);
  //monet Curiosidades 
  hover("pagina76", "pagina77", 0.13*width, 0.70*height, 80);
  hover("pagina76", "pagina78", 0.34*width, 0.71*height, 80);
  cambiarPantalla("pagina76", "pagina79", 0.57*width, 0.72*height, 80);
  cambiarPantalla("pagina76", "pagina82", 0.84*width, 0.72*height, 80);
  cambiarPantalla("pagina79", "pagina76", 0.09*width, 0.92*height, 80);
  cambiarPantalla("pagina82", "pagina76", 0.09*width, 0.92*height, 80);
  hover("pagina79", "pagina80", 0.68*width, 0.85*height, 60);
  hover("pagina79", "pagina81", 0.80*width, 0.85*height, 60);
  hover("pagina82", "pagina83", 0.80*width, 0.85*height, 60);

  //monet fechas claves
  hover("pagina84", "pagina85", 0.067*width, 0.64*height, 60);
  hover("pagina84", "pagina86", 0.17*width, 0.68*height, 60);
  hover("pagina84", "pagina87", 0.27*width, 0.64*height, 60);
  hover("pagina84", "pagina88", 0.38*width, 0.68*height, 60);
  hover("pagina84", "pagina89", 0.48*width, 0.64*height, 60);
  hover("pagina84", "pagina90", 0.59*width, 0.68*height, 60);
  hover("pagina84", "pagina91", 0.70*width, 0.64*height, 60);
  hover("pagina84", "pagina92", 0.81*width, 0.68*height, 60);
  hover("pagina84", "pagina93", 0.92*width, 0.64*height, 60);

  //ronoir cambio menu inicial
  cambiarPantalla("pagina94", "pagina102", 0.10*width, 0.20*height, 80);
  cambiarPantalla("pagina94", "pagina113", 0.30*width, 0.20*height, 80);
  cambiarPantalla("pagina94", "pagina131", 0.69*width, 0.20*height, 80);
  cambiarPantalla("pagina94", "pagina136", 0.88*width, 0.20*height, 80);

  hover("pagina94", "pagina95", 0.18*width, 0.77*height, 60);
  hover("pagina94", "pagina96", 0.12*width, 0.74*height, 60);
  hover("pagina94", "pagina97", 0.40*width, 0.70*height, 60);
  hover("pagina94", "pagina98", 0.58*width, 0.69*height, 60);

  cambiarPantalla("pagina94", "pagina99", 0.82*width, 0.70*height, 80);
  hover("pagina99", "pagina100", 0.68*width, 0.85*height, 60);
  hover("pagina99", "pagina101", 0.79*width, 0.85*height, 60);
  cambiarPantalla("pagina99", "pagina94", 0.09*width, 0.91*height, 50);

  //renoir menu
  cambioMenu("pagina113", "pagina131", "pagina136", 0.10*width, 0.20*height, 50, "pagina102");
  cambioMenu("pagina102", "pagina131", "pagina136", 0.29*width, 0.20*height, 50, "pagina113");
  cambioMenu("pagina102", "pagina113", "pagina136", 0.70*width, 0.20*height, 50, "pagina131");
  cambioMenu("pagina102", "pagina113", "pagina131", 0.89*width, 0.19*height, 50, "pagina136");
  //renoir  tecnica
  //ruedita cromatica
  hover("pagina102", "pagina103", 0.15*width, 0.77*height, 30);
  hover("pagina102", "pagina104", 0.18*width, 0.66*height, 30);
  hover("pagina102", "pagina105", 0.12*width, 0.63*height, 30);
  hover("pagina102", "pagina106", 0.10*width, 0.72*height, 30);
  hover("pagina102", "pagina107", 0.19*width, 0.75*height, 30);

  hover("pagina102", "pagina108", 0.40*width, 0.70*height, 80);
  hover("pagina102", "pagina109", 0.64*width, 0.69*height, 80);

  cambiarPantalla("pagina102", "pagina110", 0.85*width, 0.66*height, 80);

  hover("pagina110", "pagina112", 0.12*width, 0.49*height, 60);
  hover("pagina110", "pagina111", 0.57*width, 0.27*height, 60);
  cambiarPantalla("pagina110", "pagina102", 0.09*width, 0.92*height, 60);

  //ronoir cuadros
  cambiarPantalla("pagina113", "pagina114", 0.21*width, 0.67*height, 80);
  cambiarPantalla("pagina113", "pagina120", 0.52*width, 0.67*height, 80);
  cambiarPantalla("pagina113", "pagina125", 0.83*width, 0.67*height, 80);

  //cuadro 1 renoir
  hover("pagina114", "pagina115", 0.68*width, 0.86*height, 60);
  hover("pagina114", "pagina116", 0.79*width, 0.84*height, 60);
  hover("pagina114", "pagina119", 0.45*width, 0.15*height, 30);
  hover("pagina114", "pagina118", 0.71*width, 0.33*height, 30);
  hover("pagina114", "pagina117", 0.34*width, 0.43*height, 30);

  cambiarPantalla("pagina114", "pagina113", 0.09*width, 0.92*height, 60);

  //cuadro 2 renoir
  hover("pagina120", "pagina121", 0.68*width, 0.86*height, 60);
  hover("pagina120", "pagina122", 0.79*width, 0.84*height, 60);
  hover("pagina120", "pagina123", 0.16*width, 0.50*height, 30);
  hover("pagina120", "pagina124", 0.76*width, 0.41*height, 30);
  hover("pagina120", "pagina192", 0.44*width, 0.32*height, 30);

  cambiarPantalla("pagina120", "pagina113", 0.09*width, 0.92*height, 60);

  //cuadro 3 renoir
  hover("pagina125", "pagina126", 0.68*width, 0.86*height, 60);
  hover("pagina125", "pagina127", 0.79*width, 0.84*height, 60);
  hover("pagina125", "pagina128", 0.19*width, 0.56*height, 30);
  hover("pagina125", "pagina129", 0.51*width, 0.21*height, 30);
  hover("pagina125", "pagina130", 0.61*width, 0.37*height, 30);

  cambiarPantalla("pagina125", "pagina113", 0.09*width, 0.92*height, 60);

  //ronoir curiosidades

  hover("pagina131", "pagina132", 0.12*width, 0.71*height, 80);
  hover("pagina131", "pagina133", 0.35*width, 0.73*height, 80);
  hover("pagina131", "pagina193", 0.83*width, 0.73*height, 80);

  cambiarPantalla("pagina131", "pagina134", 0.58*width, 0.75*height, 80);
  hover("pagina134", "pagina135", 0.80*width, 0.85*height, 60);
  cambiarPantalla("pagina134", "pagina131", 0.09*width, 0.91*height, 80);

  //fechas destacadas renoio
  hover("pagina136", "pagina137", 0.067*width, 0.64*height, 60);
  hover("pagina136", "pagina138", 0.17*width, 0.68*height, 60);
  hover("pagina136", "pagina139", 0.27*width, 0.64*height, 60);
  hover("pagina136", "pagina140", 0.38*width, 0.68*height, 60);
  hover("pagina136", "pagina141", 0.48*width, 0.64*height, 60);
  hover("pagina136", "pagina142", 0.59*width, 0.68*height, 60);
  hover("pagina136", "pagina143", 0.70*width, 0.64*height, 60);
  hover("pagina136", "pagina144", 0.81*width, 0.68*height, 60);
  hover("pagina136", "pagina145", 0.92*width, 0.64*height, 60);

  //degas cambio menu inicial
  cambiarPantalla("pagina146", "pagina153", 0.10*width, 0.20*height, 80);
  cambiarPantalla("pagina146", "pagina158", 0.30*width, 0.20*height, 80);
  cambiarPantalla("pagina146", "pagina177", 0.69*width, 0.20*height, 80);
  cambiarPantalla("pagina146", "pagina182", 0.88*width, 0.20*height, 80);

  //degas hover
  hover("pagina146", "pagina147", 0.13*width, 0.73*height, 30);
  hover("pagina146", "pagina148", 0.13*width, 0.66*height, 30);
  hover("pagina146", "pagina149", 0.40*width, 0.70*height, 60);
  hover("pagina146", "pagina150", 0.58*width, 0.68*height, 60);
  hover("pagina146", "pagina194", 0.80*width, 0.69*height, 60);
  //degas menu
  cambioMenu("pagina158", "pagina177", "pagina182", 0.10*width, 0.20*height, 50, "pagina153");
  cambioMenu("pagina153", "pagina177", "pagina182", 0.29*width, 0.20*height, 50, "pagina158");
  cambioMenu("pagina153", "pagina158", "pagina182", 0.70*width, 0.20*height, 50, "pagina177");
  cambioMenu("pagina153", "pagina158", "pagina177", 0.89*width, 0.19*height, 50, "pagina182");
  //degas tecnica
  hover("pagina153", "pagina154", 0.13*width, 0.70*height, 80);
  hover("pagina153", "pagina155", 0.40*width, 0.73*height, 80);
  hover("pagina153", "pagina156", 0.64*width, 0.70*height, 80);
  hover("pagina153", "pagina157", 0.850*width, 0.68*height, 80);
  //degas pintura destacadas
  cambiarPantalla("pagina158", "pagina159", 0.22*width, 0.68*height, 80);
  cambiarPantalla("pagina158", "pagina165", 0.52*width, 0.68*height, 80);
  cambiarPantalla("pagina158", "pagina171", 0.83*width, 0.67*height, 80);
  //hover pinturea 1
  hover("pagina159", "pagina160", 0.68*width, 0.85*height, 60);
  hover("pagina159", "pagina161", 0.79*width, 0.86*height, 60);
  hover("pagina159", "pagina164", 0.43*width, 0.55*height, 40);
  hover("pagina159", "pagina163", 0.74*width, 0.33*height, 40);
  hover("pagina159", "pagina162", 0.44*width, 0.17*height, 40);
  cambiarPantalla("pagina159", "pagina158", 0.09*width, 0.92*height, 60);
  //hhover pintura 2
  hover("pagina165", "pagina166", 0.68*width, 0.85*height, 60);
  hover("pagina165", "pagina167", 0.79*width, 0.86*height, 60);
  hover("pagina165", "pagina170", 0.42*width, 0.24*height, 40);
  hover("pagina165", "pagina169", 0.63*width, 0.26*height, 40);
  hover("pagina165", "pagina168", 0.52*width, 0.32*height, 40);
  cambiarPantalla("pagina165", "pagina158", 0.09*width, 0.92*height, 60);
  //hover pintura 3
  hover("pagina171", "pagina172", 0.68*width, 0.85*height, 60);
  hover("pagina171", "pagina173", 0.79*width, 0.86*height, 60);
  hover("pagina171", "pagina176", 0.65*width, 0.17*height, 60);
  hover("pagina171", "pagina175", 0.75*width, 0.49*height, 60);
  hover("pagina171", "pagina174", 0.21*width, 0.31*height, 60);
  cambiarPantalla("pagina171", "pagina158", 0.09*width, 0.92*height, 60);
  //degas curiosidades
  hover("pagina177", "pagina178", 0.13*width, 0.73*height, 80);
  hover("pagina177", "pagina179", 0.35*width, 0.73*height, 80);
  hover("pagina177", "pagina180", 0.59*width, 0.72*height, 80);
  hover("pagina177", "pagina181", 0.84*width, 0.71*height, 80);
  //degas linea de tiempo
  hover("pagina182", "pagina183", 0.067*width, 0.64*height, 60);
  hover("pagina182", "pagina184", 0.17*width, 0.68*height, 60);
  hover("pagina182", "pagina185", 0.27*width, 0.64*height, 60);
  hover("pagina182", "pagina186", 0.38*width, 0.68*height, 60);
  hover("pagina182", "pagina187", 0.48*width, 0.64*height, 60);
  hover("pagina182", "pagina188", 0.59*width, 0.68*height, 60);
  hover("pagina182", "pagina189", 0.70*width, 0.64*height, 60);
  hover("pagina182", "pagina190", 0.81*width, 0.68*height, 60);
  hover("pagina182", "pagina191", 0.92*width, 0.64*height, 60);
  if (valorDeIdle == xPantalla && estados !="menu") {
    contadorIdle++;
  } else {
    contadorIdle = 0;
  }
  if (contadorIdle>3000 && estados != "menu") {
    estados = "menu";
  }

  valorDeIdle = xPantalla;
  xPantalla = mouseX;
  yPantalla = mouseY;
}


void mousePressed() {
  println(map(mouseX, 0, width, 0, 1), map(mouseY, 0, height, 0, 1), estados);
}



void addTuioObject(TuioObject tobj) {
  if (tobj.getSymbolID() == 0 && estados != "pagina0" && estados != "pagina1" && estados != "pagina2" && estados != "pagina3"  && estados != "pagina4"  && estados != "pagina5" && estados != "pagina6"
    && estados != "pagina7" && estados != "pagina8" && estados != "pagina9" && estados != "pagina10" && estados != "pagina11" && estados != "pagina12" && estados != "pagina10" && estados != "pagina13"
    && estados != "pagina14" && estados != "pagina15" && estados != "pagina16" && estados != "pagina17" && estados != "pagina18" && estados != "pagina19" 
    && estados != "pagina20" && estados != "pagina21" && estados != "pagina22" && estados != "pagina23" && estados != "pagina24" && estados != "pagina25"
    && estados != "pagina26" && estados != "pagina27" && estados != "pagina28" && estados != "pagina29" && estados != "pagina30" && estados != "pagina31"
    && estados != "pagina32" && estados != "pagina33" && estados != "pagina34" && estados != "pagina35") {
    estados = "pagina0";
    contadorIdle = 0;
  }

  if (tobj.getSymbolID() == 1   && estados != "pagina36" && estados != "pagina37" && estados != "pagina38" && estados != "pagina39" && estados != "pagina40" && estados != "pagina41" && estados != "pagina42"  && estados != "pagina43"  && estados != "pagina44" 
    && estados != "pagina45" && estados != "pagina46" && estados != "pagina47" && estados != "pagina48" && estados != "pagina49"  && estados != "pagina50"  && estados != "pagina51" 
    && estados != "pagina52" && estados != "pagina53" && estados != "pagina54" && estados != "pagina55" && estados != "pagina56"  && estados != "pagina57"  && estados != "pagina58"
    && estados != "pagina59" && estados != "pagina60" && estados != "pagina61" && estados != "pagina62"  && estados != "pagina63"  && estados != "pagina64"
    && estados != "pagina65" && estados != "pagina66" && estados != "pagina67" && estados != "pagina68"  && estados != "pagina69"  && estados != "pagina70" 
    && estados != "pagina71" && estados != "pagina72" && estados != "pagina73" && estados != "pagina77"  && estados != "pagina78"  && estados != "pagina79"
    && estados != "pagina80" && estados != "pagina81" && estados != "pagina82" && estados != "pagina83"  && estados != "pagina84"  && estados != "pagina85"
    && estados != "pagina86" && estados != "pagina87" && estados != "pagina88" && estados != "pagina89"  && estados != "pagina90"  && estados != "pagina91"  && estados != "pagina92" && estados != "pagina93"
    && estados != "pagina94") {
    estados = "pagina36";
    contadorIdle = 0;
  }
  if (tobj.getSymbolID() == 2 && estados != "pagina95" && estados != "pagina96" && estados != "pagina97" && estados != "pagina98"  && estados != "pagina99"  && estados != "pagina100" 
    && estados != "pagina101" && estados != "pagina102" && estados != "pagina103" && estados != "pagina104"  && estados != "pagina105"  && estados != "pagina106" 
    && estados != "pagina107" && estados != "pagina108" && estados != "pagina109" && estados != "pagina110"  && estados != "pagina111"  && estados != "pagina112" 
    && estados != "pagina113" && estados != "pagina113" && estados != "pagina114" && estados != "pagina115"  && estados != "pagina116"  && estados != "pagina117" 
    && estados != "pagina118" && estados != "pagina119" && estados != "pagina120" && estados != "pagina121"  && estados != "pagina122"  && estados != "pagina123"
    && estados != "pagina124" && estados != "pagina125" && estados != "pagina126" && estados != "pagina127"  && estados != "pagina128"  && estados != "pagina129" 
    && estados != "pagina130" && estados != "pagina131" && estados != "pagina132" && estados != "pagina133"  && estados != "pagina134"  && estados != "pagina135" 
    && estados != "pagina136" && estados != "pagina137" && estados != "pagina138" && estados != "pagina139"  && estados != "pagina140"  && estados != "pagina141" 
    && estados != "pagina142" && estados != "pagina143"  && estados != "pagina144" && estados != "pagina145"  && estados != "pagina192"  && estados != "pagina193"   ) {
    estados = "pagina94";
    contadorIdle = 0;
  }

  if (tobj.getSymbolID() == 3 && estados != "pagina146" && estados != "pagina147" && estados != "pagina148"  && estados != "pagina149"  && estados != "pagina150" 
    && estados != "pagina151" && estados != "pagina152" && estados != "pagina153" && estados != "pagina154"  && estados != "pagina155"  && estados != "pagina156" 
    && estados != "pagina157" && estados != "pagina158" && estados != "pagina159" && estados != "pagina160"  && estados != "pagina161"  && estados != "pagina162"
    && estados != "pagina163" && estados != "pagina164" && estados != "pagina165" && estados != "pagina166"  && estados != "pagina167"  && estados != "pagina168"
    && estados != "pagina169" && estados != "pagina170" && estados != "pagina171" && estados != "pagina172"  && estados != "pagina173"  && estados != "pagina174"
    && estados != "pagina175" && estados != "pagina176" && estados != "pagina177" && estados != "pagina178"  && estados != "pagina179"  && estados != "pagina180"
    && estados != "pagina181" && estados != "pagina182" && estados != "pagina183" && estados != "pagina184"  && estados != "pagina185"  && estados != "pagina186"
    && estados != "pagina187" && estados != "pagina188" && estados != "pagina189" && estados != "pagina190"    && estados != "pagina191" && estados != "pagina194"  ) {
    estados = "pagina146";
    contadorIdle = 0;
  }
}
void updateTuioObject (TuioObject tobj) {
  if (tobj.getSymbolID() == 0 || tobj.getSymbolID() == 1 || tobj.getSymbolID() == 2 || tobj.getSymbolID() == 3 || tobj.getSymbolID() == 4) {
    //xPantalla = round(tobj.getX() * width);
    //yPantalla = round(tobj.getY() * height);
  }
}


void removeTuioObject(TuioObject tobj) {
  if (tobj.getSymbolID() == 0 || tobj.getSymbolID() == 1 || tobj.getSymbolID() == 2 || tobj.getSymbolID() == 3 || tobj.getSymbolID() == 4) {
  }
}
