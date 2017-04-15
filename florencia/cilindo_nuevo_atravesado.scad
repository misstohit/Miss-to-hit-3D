
//Cilinder sistem
diametro_cilindo = 25; //External cilinder diametre
diametro_cilindo_interior = 10; //Internal hole on cilinder
altura = 60; //height of cilinder;

//Bucle de taladros en el cilindro
pathRadius=36/2; //Distance hole
num=8; //num hole

//Cone sistema
radio_cono = 5;
radio_cono_medio = 4;
cono_altura = altura;


/***
 * Init module
 ***/
main();
module main(){
  difference() {
    cilindro_base(diametro_cilindo, diametro_cilindo_interior, altura);
    separacion_cilindro(pathRadius, num, altura);
  }
}


/***
 * Modulo tu create externla hole
 ***/
module separacion_cilindro(distancia, numero, alt) {
  for (i=[1:numero])  {
    translate([distancia*cos(i*(360/numero)),distancia*sin(i*(360/numero)),0])
    if (1 == 1){
      colores = "red";
      color(colores){
	      cono(radio_cono, radio_cono_medio, altura);
      }
    }
  }
}


/***
 * Modulo cilinder base
 ***/
module cilindro_base(diamentro, interior, altura) {
  difference() {
    cylinder(r=diamentro, h=altura, $fn=100);
    cylinder(r=diametro_cilindo_interior, h=altura, $fn=100);
  }
}

module cilindro() {
}

module cono(base, medio, altura_cono) {
	translate([0, 0, altura_cono/2]) {
  	cylinder(r=medio, r2=base, h=altura_cono/2, $fn=100);
	}
  cylinder(r=base, r2=medio, h=altura_cono/2, $fn=100);
}
