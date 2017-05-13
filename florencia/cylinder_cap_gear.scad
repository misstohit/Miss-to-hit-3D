/**
* Info TODO
* Interzonas.info create piece mishtohit
**/

//utils triangle suport piece
include <utils/triangle_system.scad>;

//Const cylinder
cylinder_dim = 25;
cylinder_dim_gear =40;
height = 3;

//hole cones
pathRadius=36/2;
num_cap=2;


/**
* Init the piece
**/
main();
module main() {
  difference() {
    cylinder_base(cylinder_dim, height);
    //tabs(pathRadius, num_cap, height);
  }
  cylinder_hole_creator(pathRadius, num_cap, height);
  cyliner_gear(cylinder_dim_gear, height);
}

/**
* Modulo create gear
* TODO
**/
module cyliner_gear(cylinder_dim, height){
  height_gear = 4;
  gear_thickness =2;

  //TODO hardcode position
  translate([0, 0, height-1.5]) {
    cube(size=[5, cylinder_dim*2-0.4, height], center=true);
    cube(size=[cylinder_dim*2-0.4, 5, height], center=true);
  }
    translate([0, 0, height]) {
  }

  difference() {
    cylinder_base(cylinder_dim_gear, height*height_gear);
    cylinder_base(cylinder_dim_gear-gear_thickness, height*height_gear);
  }
}

/**
* Modulo create triagle support
* Params Distence bwteeen of support, num of support, height of support
**/
module cylinder_hole_creator(distancia, numero, alt) {
  triangle_data = [10.5, 5.3, 5.3, -90];
  for (i=[1:numero])  {
    translate([distancia*cos(i*(360/numero)),distancia*sin(i*(360/numero)),0]){
      if(i == 1){
        colores = "red";
        color(colores) {
          triangle_base(triangle_data[0], triangle_data[1], triangle_data[2], triangle_data[3]);
        }
      } else {
        colores = "green";
        color(colores) {
          triangle_base(triangle_data[0], triangle_data[1], triangle_data[2], -30);
        }
      }
    }
  }
}

/**
* Modulo  cylinder base
**/
module cylinder_base(diamentro, height) {
  cylinder(r=diamentro, h=height, $fn=100);
}

module triangle_base(height, radio_exterior, radio_interior, rotate_angle){
  rotate(rotate_angle){
    triangle_tube(height, radio_exterior, radio_interior);
  }
}
