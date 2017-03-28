include <relativity.scad>

radio_borde = 10/2;
radio_pajita = 5.4/2;
altura = 20;
difference() {
  base();
  taladro();
}

difference() {
  base_larga();
  base_extension_recorte();
}

module taladro(diametro) {
  cylinder(r=radio_pajita, h=altura, $fn=100);
}

module base(altura) {
    union() {
      box([25,20,2]);
      align(top)
      box([15,15,3])
      align(top)
      box([10, 10, 4]);
    }
}

module base_larga() {
  box([25,50,2]);
}

module base_extension_recorte(){
    translated(16*y, class="hole")
      box([20,15,2], $class="hole");
    translated(-16*y, class="hole2")
      box([20,15,2], $class="hole2");
}
