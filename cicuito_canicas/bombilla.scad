//include <relativity.scad>

radio_borde = 10/2;
radio_pajita = 5.4/2;
altura = 10;


union() {
  difference() {
    varandilla();
    taladro_soporte();
  }
  /*difference() {
    difference() {
      soporte(altura);
    }
    taladros_pagitas();
    quitar_material();
  }*/
}

module taladro_soporte(){
  translate([4, 10, 5]) {
    rotate([90, 0, 0]) {
      cylinder(r=radio_pajita, h=altura-5,$fn=100);
    }
  }
}



module varandilla() {
  translate([8, 8, 0]) {
    rotate([0, 0, 90]) {
      cube(size=[1.5, 8, 10]);
    }
  }
  mirror([0, 0, 0])
    translate([0, -3, 0]) {
      cube(size=[1.5, 12, 10]);
      translate([0, 4, 0]) {
        cube(size=[1.5, 4, 20]);
      }
    }
}



module quitar_material() {
  translate([-17, -2, 0])
    cube(size=[19, 4, 10]);
  translate([-12, -5, 0])
    cube(size=[5, 10, 10]);
}
