//TODO Translated into English
//include <relativity.scad>

//setup
radio_borde = 10/2;
radio_pajita = 5.8/2;
altura = 5;

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
  }
  translate([-2, -18, 0]) {
    cube(size=[1.5, 25, 5]);
  }
}

module varandilla() {
  translate([-2.6, 7.8, 0]) {

    rotate([0, 0, 80]) {
      cube(size=[1.5, 25, 5]);
    }

    rotate([0, 0, -10]) {
      cube(size=[1.5, 25, 5]);
    }

    rotate([0, 0, -90]) {
      cube(size=[1.5, 25, 5]);
    }
  }
}

module taladros_pagitas() {
  altura_taladro = 40;
  posicion_taladro = [-6.2, 5.4, -1];

  translate(posicion_taladro)
  cylinder(r=radio_pajita, h=altura_taladro, $fn=100);
}

module quitar_material() {
  translate([-17, -2, 0])
  cube(size=[14.8, 4, 10]);
  translate([-12, -5, 0])
  cube(size=[5, 10, 10]);
}
