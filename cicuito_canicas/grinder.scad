//TODO Translated into English
//include <relativity.scad>

//setup
radio_borde = 12/2;
radio_pajita = 7.5/2;
altura = 4;

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
  posicion_soporte = [-6, 6, 0];
  hull() {
    translate(posicion_soporte)
    cylinder(r=radio_borde, h=altura);
  }
  translate([-6, -24, 0]) {
    cube(size=[1.5, 25, altura]);
  }
}

module varandilla() {
  translate([-11, 5, 0]) {

    rotate([0, 0, 90]) {
      cube(size=[1.5, 25, altura]);
    }
  }
  translate([-6, 11, 0]) {
    rotate([0, 0, 0]) {
      cube(size=[1.5, 25, altura]);
    }

  }
  translate([-2, 7, 0]) {
    rotate([0, 0, -90]) {
      cube(size=[1.5, 25, altura]);
    }
  }
}

module taladros_pagitas() {
  altura_taladro = 40;
  posicion_taladro = [-6, 6, -1];

  translate(posicion_taladro)
  cylinder(r=radio_pajita, h=altura_taladro, $fn=100);
}

module quitar_material() {

}
