//include <relativity.scad>

radio_borde = 10/2;
radio_pajita = 5.8/2;
altura = 5;


varandilla();
difference() {
  difference() {
    soporte(altura);
  }
  taladros_pagitas();
  quitar_material();
}


module soporte(altura) {
  posicion_soporte = [-5, 5, 0];
  hull() {
    translate(posicion_soporte)
    cylinder(r=radio_borde, h=altura);
  }
}

module varandilla() {
  translate([-1.5, 6, 0]) {
    rotate([0, 0, 65]) {
      cube(size=[1.5, 20, 5]);
    }
  }
}

module taladros_pagitas() {
  altura_taladro = 40;
  posicion_taladro = [-6.4, 5.2, -1];

    translate(posicion_taladro)
      cylinder(r=radio_pajita, h=altura_taladro, $fn=100);
}

module quitar_material() {
  translate([-17, -2, 0])
    cube(size=[17, 4, 10]);
  translate([-12, -4, 0])
    cube(size=[5, 10, 10]);
}
