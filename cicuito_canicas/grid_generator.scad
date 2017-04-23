include <unions.scad>
include <triangle_union.scad>

/**
 * Matrix generator, TODO paametrizer step to diferent pieze
 **/


/*triangle_positions = [0, -50+i*20, 0];
triangle_step = 32;

union_positons = [0, -50+i*10, 0];
union_step = 12;*/

/**
 * grid system generator
 **/

module step(len, mod) {
	for (i = [0:$children-1])
	translate([ len*(i - ($children-1)/2), 0, 0 ]) children((i+mod) % $children);
}

for (i = [1:4]) {
	translate([0, -50+i*10, 0]) step(30, i) {
			triangulo_base(5, 5.4/2, 5.4/2);
			triangulo_base(5, 5.4/2, 5.4/2);
			triangulo_base(5, 5.4/2, 5.4/2);
			triangulo_base(5, 5.4/2, 5.4/2);
      /*cylinder_base();
      cylinder_base();
      cylinder_base();
      cylinder_base();*/
	}
}
