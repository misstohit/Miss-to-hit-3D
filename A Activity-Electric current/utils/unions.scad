straw_radio = 5.4/2;
straw_radio_medio = 4.9/2;
straw_radio_thickness = 1.5;
height = 18;


%cylinder_base();
module cylinder_base() {
	difference() {
		cylinder(r=straw_radio*straw_radio_thickness, h=height, $fn=100);
		%cone(straw_radio, straw_radio_medio, height);
	}
}
module cone(base, medio, height_cono) {
	translate([0, 0, height_cono/2]) {
		cylinder(r=medio, r2=base, h=height_cono/2, $fn=100);
	}
	cylinder(r=base, r2=medio, h=height_cono/2, $fn=100);
}
