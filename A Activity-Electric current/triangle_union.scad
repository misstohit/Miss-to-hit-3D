


module triangulo_base(height, radio, wall) {
  //const
  triangle_height = height;
  triangle_radio = radio;
  triangle_wall = wall;

  /*triangle_height = 25;
  triangle_radio = 5.4/2;
  triangle_wall = 5.4/2;*/
	//Rotate triangle To lean on the bed of the printer
  rotate([0, 90, 0]) {
    rotate(-30){
      triangle_tube(triangle_height, triangle_radio, triangle_wall);
    }
  }
}

//triangle_tube(20, 5, 5);
module triangle_tube(height,radius,wall)
{
   tubify(radius,wall) triangle_prism(height,radius);
}

//Tubifies any regular prism
module tubify(radius,wall)
{
  difference()
  {
    children(0);
    translate([0, 0, -0.1]) scale([(radius-wall)/radius, (radius-wall)/radius, 2]) children(0);
  }
}

module triangle_prism(height,radius)
{
  linear_extrude(height=height) triangle(radius);
}

module triangle(radius)
{
  o=radius/2;		//equivalent to radius*sin(30)
  a=radius*sqrt(3)/2;	//equivalent to radius*cos(30)
  polygon(points=[[-a,-o],[0,radius],[a,-o]],paths=[[0,1,2]]);
}
