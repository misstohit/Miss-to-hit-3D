diametro_cilindo = 25;
diametro_cilindo_interior = 10;
altura = 3;
pathRadius=36/2;
num=8;

radio_pajita = 5.4/2;
radio_pajita_medio = 4.9/2;
radio_pajita_grosor = 1.5;
cono_altura = 18;


main();
module main() {
  difference() {
    difference() {
      cilindro_base(diametro_cilindo, diametro_cilindo_interior, altura);
      separacion_cilindro(pathRadius, num, altura);
    }
    triangulo_macho(10.5, 5.3);
    pestana(altura);
  }
  triangulo_macho(10.5, 5.3);
}

module pestana(altura) {
  translate([18, 0, 10]) {
    rotate([0, 90, 0]) {
      translate([5, -5, 5.5]) {
        cube(size=[4, 10, 2.5]);
      }
    }
  }
  translate([-31, 0, 10]) {
    rotate([0, 90, 0]) {
      translate([5, -5, 5.5]) {
        cube(size=[4, 10, 2.5]);
      }
    }
  }
}
module triangulo_macho(altura, radio) {
  translate([18, 0, altura]) {
    rotate([0, 90, 0]) {
      colores = "red";
      color(colores){
        triangulo_base(altura, radio, radio);
      }
    }
  }
  translate([-18, 0, altura]) {
    rotate([0, 90, 0]) {
      colores = "red";
      color(colores){
        triangulo_base(altura, radio, radio);
      }
    }
  }
}


module cilindro_base(diamentro, interior, altura) {
  difference() {
    cylinder(r=diamentro, h=altura, $fn=100);
  }
}

module cilindro() {
  difference() {
    cono(radio_pajita, radio_pajita_medio, cono_altura);
  }
}

module triangulo_base(altura, radio_exterior, radio_interior){
  rotate([0, 90, 0]) {
    rotate(-30){
      triangle_tube(altura, radio_exterior, radio_interior);
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
