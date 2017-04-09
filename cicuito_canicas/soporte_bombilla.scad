//include <relativity.scad>

radio_borde = 10/2;
radio_pajita = 5.4/2;
altura = 10;


union() {
  difference() {
    varandilla();
    taladro_soporte();
  }
  difference() {
    difference() {
      soporte(altura);
    }
    taladros_pagitas();
    quitar_material();
  }
}

module taladro_soporte(){
  translate([4, 10, 5]) {
    rotate([90, 0, 0]) {
      cylinder(r=radio_pajita, h=altura-5,$fn=100);
    }
  }
}

module soporte(altura) {
  posicion_soporte = [-5, 5, 0];
  hull() {
    translate(posicion_soporte)
    cylinder(r=radio_borde, h=altura);
  }
}

module varandilla() {
  translate([8, 8, 0]) {
    rotate([0, 0, 90]) {
      cube(size=[1.5, 12, 10]);
    }
  }
}

module taladros_pagitas() {
  altura_taladro = 12;
  posicion_taladro = [-6.4, 5.4, -1];

    translate(posicion_taladro)
      cylinder(r=radio_pajita, h=altura_taladro, $fn=100);
}

module quitar_material() {
  translate([-17, -2, 0])
    cube(size=[19, 4, 10]);
  translate([-12, -5, 0])
    cube(size=[5, 10, 10]);
}
