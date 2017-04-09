radio_pajita = 5.4/2;
radio_pajita_medio = 4.9/2;
radio_pajita_grosor = 1.5;
altura = 18;


module step(len, mod)
{
	for (i = [0:$children-1])
		translate([ len*(i - ($children-1)/2), 0, 0 ]) children((i+mod) % $children);
}

for (i = [1:1])
{
	translate([0, -50+i*10, 0]) step(12, i)
	{
    cilindro();
    /*cilindro();
    cilindro();
    cilindro();*/
	}
}

module cilindro() {
  difference() {
		cylinder(r=radio_pajita*radio_pajita_grosor, h=altura, $fn=100);
		cono(radio_pajita, radio_pajita_medio, altura);
  }
	//curva();
}

module curva() {
  union() {
    translate([-0.5, 0, 12.8]) {
      rotate([0, 40, 0]) {
        difference() {
      	   cylinder(r=radio_pajita*radio_pajita_grosor, h=altura-5, $fn=100);
      	   cylinder(r=radio_pajita, h=altura-5, $fn=100);
        }
      }
    }
  }
}


module cono(base, medio, altura_cono) {
	translate([0, 0, altura_cono/2]) {
  	cylinder(r=medio, r2=base, h=altura_cono/2, $fn=100);
	}
  cylinder(r=base, r2=medio, h=altura_cono/2, $fn=100);
}
