/**
 * Info TODO
 * Interzonas.info create piece mishtohit
 **/

//utils triangle suport piece
include <utils/triangle_system.scad>;

//Const cylinder
cylinder_dim = 25;
height = 3;

//hole cones
pathRadius=36/2;
num=2;


/**
* Init the piece
**/
main();
module main() {
  difference() {
    cylinder_base(cylinder_dim, height);
    tabs(pathRadius, num, height);
  }
  cylinder_hole_creator(pathRadius, num, height);
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
* Modulo create tabs of cap
**/
module tabs(distancia, numero, alt) {
  tabs_dimensions = [4, 10, 2.5];
  position = [-7.5, -5, 2];
  position_x = position[0];
  position_x_opos = abs(position_x) / 2;
  for (i=[1:numero])  {
    translate([distancia*cos(i*(360/numero)),distancia*sin(i*(360/numero)),0]){
      if(i == 1){
        translate([-7.5, -5, 2]) {
          cube(size=tabs_dimensions);
        }

      } else {
        translate([position_x_opos, position[1], position[2]]) {
          cube(size=tabs_dimensions);
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
