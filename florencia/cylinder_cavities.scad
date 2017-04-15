
//Cilinder system
cylinder_dim = 25; //External cilinder diametre
cylinder_dim_inside = 10; //Internal hole on cilinder
height = 60; //height of cilinder;

//loop hole cone in cylinder
pathRadius=36/2; //Distance hole
num=8; //num hole

//Cone sistema
radio_cone = 5;
radio_cone_middle = 4;
cone_height = height;


/***
 * Init module
 ***/
main();
module main(){
  difference() {
    %cilindro_base(cylinder_dim, cylinder_dim_inside, height);
    cylinder_hole_creator(pathRadius, num, height);
  }
}


/***
 * Modulo tu create externla hole
 ***/
module cylinder_hole_creator(distancia, numero, alt) {
  for (i=[1:numero])  {
    translate([distancia*cos(i*(360/numero)),distancia*sin(i*(360/numero)),0])
    if (1 == 1){
      colores = "red";
      color(colores){
	      #cone(radio_cone, radio_cone_middle, height);
      }
    }
  }
}


/***
 * Modulo cilinder base
 ***/
module cilindro_base(diamentro, interior, height) {
  difference() {
    cylinder(r=diamentro, h=height, $fn=100);
    cylinder(r=cylinder_dim_inside, h=height, $fn=100);
  }
}

module cone(base, medio, height_cone) {
	translate([0, 0, height_cone/2]) {
  	cylinder(r=medio, r2=base, h=height_cone/2, $fn=100);
	}
  cylinder(r=base, r2=medio, h=height_cone/2, $fn=100);
}
