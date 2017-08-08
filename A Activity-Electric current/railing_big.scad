//TODO Translated English

radio_borde = 10/2;
radio_pajita = 5.4/2;
altura = 10;

/***
* Init module
***/
init();
module init(){
  varandilla();
  difference() {
    difference() {
      soporte(altura);
    }
    taladros_pagitas();
    quitar_material();
  }
}

module soporte(altura) {
  posicion_soporte = [-5, 5, 0];
  hull() {
    translate(posicion_soporte)
    cylinder(r=radio_borde, h=altura);

    mirror([0, 1, 0])
    translate(posicion_soporte)
    cylinder(r=radio_borde, h=altura);

  }
}

module varandilla() {
  translate([-1.5, 6, 0]) {
    rotate([0, 0, 65]) {
      cube(size=[1.5, 20, 10]);
    }
  }
  mirror([0, 1, 0]) {
    translate([-1.5, 6, 0]) {
      rotate([0, 0, 65]) {
        cube(size=[1.5, 20, 10]);
      }
    }
  }

}

module taladros_pagitas() {
  altura_taladro = 12;
  posicion_taladro = [-6.4, 5.4, -1];

  translate(posicion_taladro)
  cylinder(r=radio_pajita, h=altura_taladro, $fn=100);

  mirror([0, 1, 0])
  translate(posicion_taladro)
  cylinder(r=radio_pajita, h=altura_taladro, $fn=100);
}

module quitar_material() {
  translate([-17, -2, 0])
  cube(size=[15, 4, 10]);
  translate([-12, -5, 0])
  cube(size=[5, 10, 10]);
}
