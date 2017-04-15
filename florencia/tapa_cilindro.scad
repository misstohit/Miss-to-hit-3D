diametro_cilindo = 25;
diametro_cilindo_interior = 10;
altura = 5;
pathRadius=36/2;
num=8;

radio_pajita = 5.4/2;
radio_pajita_medio = 4.9/2;
radio_pajita_grosor = 1.5;
cono_altura = 18;

difference() {
  cilindro_base(diametro_cilindo, diametro_cilindo_interior, altura);
  separacion_cilindro(pathRadius, num, altura);
}
conos();

module conos() {
  translate([18, 0, 16]) {
    rotate([0, 90, 0]) {
      colores = "red";
      color(colores){
        triangulo_base();
      }
    }
    //#cilindro();
  }
  translate([-18, 0, 16]) {
    rotate([0, 90, 0]) {
      colores = "red";
      color(colores){
        triangulo_base();
      }
    }
    /*#cilindro();*/
  }
}


module separacion_cilindro(distancia, numero, alt) {

  for (i=[1:numero])  {
    translate([distancia*cos(i*(360/numero)),distancia*sin(i*(360/numero)),0])
    if (i == 4){
      colores = "red";
      color(colores){
        //cylinder(r=4,h=alt, $fn=100);
        /*ranura_cilindro([distancia*cos(i*(360/numero)),distancia*sin(i*(360/numero)),0]);*/
      }
    } else if(i == 8) {
      colores = "blue";
      color(colores){
        //cylinder(r=4,h=alt, $fn=100);
        /*ranura_cilindro([distancia*cos(i*(360/numero)),distancia*sin(i*(360/numero)),0]);*/
      }
    } else {
      colores = "green";
      color(colores){
        //cylinder(r=5,h=alt, $fn=100);
      }
    }
  }
}

module cilindro_base(diamentro, interior, altura) {
  difference() {
    cylinder(r=diamentro, h=altura, $fn=100);
    //cylinder(r=diametro_cilindo_interior, h=altura, $fn=100);
  }
}

module cilindro() {
  difference() {
		/*cylinder(r=radio_pajita*radio_pajita_grosor, h=altura, $fn=100);*/
		cono(radio_pajita, radio_pajita_medio, cono_altura);
  }
}

module cono(base, medio, altura_cono) {
	translate([0, 0, altura_cono/2]) {
  	cylinder(r=medio, r2=base, h=altura_cono/2, $fn=100);
	}
  cylinder(r=base, r2=medio, h=altura_cono/2, $fn=100);
}

module triangulo_base(){
  rotate([0, 90, 0]) {
    rotate(-30){
      triangle_tube(16, 6.2/2, 6.2/2);
    }
  }
}



//triangle_tube(20, 5, 5);
module triangle_tube(height,radius,wall)
{
   tubify(radius,wall) triangle_prism(height,radius);
}

//Tubifies any regular prism
module tubify(radius,wall)
{
  difference()
  {
    child(0);
    translate([0, 0, -0.1]) scale([(radius-wall)/radius, (radius-wall)/radius, 2]) child(0);
  }
}

module triangle_prism(height,radius)
{
  linear_extrude(height=height) triangle(radius);
}

module triangle(radius)
{
  o=radius/2;		//equivalent to radius*sin(30)
  a=radius*sqrt(3)/2;	//equivalent to radius*cos(30)
  polygon(points=[[-a,-o],[0,radius],[a,-o]],paths=[[0,1,2]]);
}
