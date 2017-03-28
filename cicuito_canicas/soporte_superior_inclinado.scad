radio_borde = 10/2;
radio_pajita = 5.4/2;
altura = 10;


difference() {
  difference() {
    soporte(altura);
    hueco_soporte();
  }
  aplanr_taladros();
  taladros_pagitas();
  quitar_material();
}




module soporte(altura) {
  posicion_soporte = [-5, 5, 0];
  hull() {
    translate(posicion_soporte)
    cylinder(r=radio_borde, h=altura);

    mirror([0, 1, 0])
      translate(posicion_soporte)
      cylinder(r=radio_borde, h=altura);

    translate([5, -5, 0])
      cube(size=[10, 10, altura]);
  }
}

module hueco_soporte() {
  profundidad_hueco_soporte = 15;
  rotate([0, 90, 0])
    translate([-5, 0, 5])
      cylinder(r=radio_pajita, h=profundidad_hueco_soporte, $fn=100);
}


module taladros_pagitas() {
  altura_taladro = 12;
  posicion_taladro = [-6.2, 5.4, -1];
    translate(posicion_taladro)
      rotate([0, 15, 0]) {
        cylinder(r=radio_pajita, h=altura_taladro, $fn=100);
      }

      mirror([0, 1, 0])
        translate(posicion_taladro)
          rotate([0, 15, 0]) {
            cylinder(r=radio_pajita, h=altura_taladro, $fn=100);
          }

}

module aplanr_taladros() {
  posicion_taladro = [-6.2, 5.4, -1];
    translate(posicion_taladro)
      translate([-7.4, -16, 1])
        color("blue") {
          rotate([0, 15, 0]) {
            cube(size=[5, 22, 14]);
          }
        }
}

module quitar_material() {
  translate([-17, -2, 0])
    cube(size=[20, 4, 10]);
  translate([-12, -5, 0])
    cube(size=[7, 10, 12]);
}
