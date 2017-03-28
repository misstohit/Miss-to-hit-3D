include <relativity.scad>

radio_borde = 10/2;
radio_pajita = 5.4/2;
altura = 20;
difference() {
  base();
  taladro();
}

module taladro(diametro) {
  cylinder(r=radio_pajita, h=altura, $fn=100);
}

module base(altura) {
  union() {
    box([25,25,2])
    align(top)
    box([15,15,3])
    align(top)
    box([10, 10, 4]);
  }
}
