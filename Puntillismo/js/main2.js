var c = [];
var cant = 100;
var exploto;
var explotoAlgo = false;
var canvas;
function setup(){
    console.log("https://www.youtube.com/watch?v=OGaUpFOLtes");
    frameRate(20);
canvas = createCanvas(window.innerWidth, window.innerHeight);
for (var i=0; i<cant; i++) {
    c.push(new circulo());
  }
  noStroke();

}

function draw(){
background(0);
for (var i=0; i<cant; i++) {
    c[i].dibujar();
    c[i].rebotar(1);
  
}
if(explotoAlgo){
setTimeout(detener,1000*30);
}
}
function detener(){
    noLoop();
}

function mousePressed(){
    for (var i=0; i<cant; i++) {
        c[i].explod();
        explotoAlgo = true;
    }
   

}

class circulo{
    constructor(){
        this.randomXe=[];
        this.randomYe=[];
        this.randomX = random(0,width);
        this.randomY = random(0,height);
        this.posXe = this.randomX;
        this.posXy = this.randomY;
        this.tam = 30;
        this.dibujando = true;
        this.colores = color(random(0,255),random(0,255),random(0,255));
        for(var i = 0; i<cant;i++){
            this.randomXe[i]= this.randomX + random(-50,50);
            this.randomYe[i]= this.randomY + random(-50,50);
        }
    }
    dibujar(){
        if(this.dibujando){
        fill(this.colores);
        ellipse(this.randomX,this.randomY,this.tam,this.tam);
        }
        if(this.dibujando == false){ 
            this.explotar();
        }
    }
    rebotar(velocidad){
       if(this.tam<80){
            this.tam = this.tam+velocidad;
       }else{
           this.tam = 30;
       }
    }
    explod(){
        if(dist(mouseX,mouseY,this.randomX,this.randomY)<30){
            this.dibujando = false;
        
        }
    }
    explotar(){
        fill(random(0,255),random(0,255),this.alpha);
        this.alpha ++;
        for(var i = 0; i<cant;i++){
            ellipse(this.randomXe[i]+random(-50,60),this.randomYe[i]+ random(-100,100),random(5,10),random(5,10));
            ellipse(this.randomXe[i]+random(-50,60),this.randomYe[i]+ random(-100,100),5,5);
        }
    }

}
