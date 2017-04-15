diametro_cilindo = 25;
diametro_cilindo_interior = 10;
altura = 60;
pathRadius=36/2;
num=8;

radio_pajita = 5.4/2;
radio_pajita_medio = 4.9/2;
radio_pajita_grosor = 1.5;
cono_altura = 18;

difference() {
  cilindro_base(diametro_cilindo, diametro_cilindo_interior, altura);
  conos();
  separacion_cilindro(pathRadius, num, altura);

}

module conos() {
  translate([18, 0, 0]) {
    #cilindro();
  }
  translate([-18, 0, 0]) {
    #cilindro();
  }
  translate([18, 0, altura-cono_altura]) {
    #cilindro();
  }
  translate([-18, 0, altura-cono_altura]) {
    #cilindro();
  }
}
/*module ranura_cilindro(posicion){
  echo(str("Variable = ",posicion));
  translate([posicion[0]+11,posicion[1]-2, posicion[2]])
    color("black"){
      cube(size=[3, 2, 6]);
    }
  translate([posicion[0]+11,posicion[1]-6, posicion[2]+4])
    color("pink"){
      cube(size=[4, 4, 2]);
    }
}*/



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
        cylinder(r=5,h=alt, $fn=100);
      }
    }
  }
}

module cilindro_base(diamentro, interior, altura) {
  difference() {
    cylinder(r=diamentro, h=altura, $fn=100);
    cylinder(r=diametro_cilindo_interior, h=altura, $fn=100);
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