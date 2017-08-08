include <triangle_union.scad>
//triangulo_base(10, 5.4/2, 5.4/2);


trinagle_positon_x = 5;
triangle_radio = 3.8;
triangle_step_distance = 10;
triangle_angle = 90; //TODO max 170 to fixed

triagle_generator(trinagle_positon_x, triangle_step_distance, triangle_radio, triangle_angle);

module triagle_generator(positon_x, step_distance, radio, angle){
  for (i = [1:2]) {
    position = [positon_x+i*triangle_step_distance,0,0];
    echo(str("Variable = ", position));

    translate([0, positon_x-0.1+i*step_distance, 1.2]) {
      rotate([0, 90, 0]) {
        rotate([0, 0, -30]){
          linear_extrude(height=6){
            triangle(2.6);
          }
        }
      }
    }

    //TODO parametrice extension
    translate([-15, 0, 1.3]) {
      rotate([90, 90, 0]) {
        rotate([0, 0, -30]){
          linear_extrude(height=8){
            triangle(2.5);
          }
        }
      }
    }

    //TODO parametrice extension
    translate([-25, 0, 1.3]) {
      rotate([90, 90, 0]) {
        rotate([0, 0, -30]){
          linear_extrude(height=8){
            triangle(2.5);
          }
        }
      }
    }

    intersection() {
      rotate_extrude() {
        translate(position) {
          triangle(radio);
        }
      }
      hull() {
        rotate(0) cube([0.1,700,700]);
        rotate(angle) cube([0.1,700,700]);
      }
    }
  }
}

module triangle(radius) {
  o=radius/2;
  a=radius*sqrt(3)/2;
  polygon(points=[[-a,-o],[0,radius],[a,-o]],paths=[[0,1,2]]);
}

function position_poligonos(radius) =
let(a=radius*sqrt(3)/2)
let(o=1000)
[[-a,-o],[0,radius],[a,-o]];
