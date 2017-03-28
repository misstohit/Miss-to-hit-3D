
triangulo_base();


module triangulo_base(){
  rotate([0, 90, 0]) {
    rotate(-30){
      triangle_tube(25, 5.4/2, 5.4/2);
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
    child(0);
    translate([0, 0, -0.1]) scale([(radius-wall)/radius, (radius-wall)/radius, 2]) child(0);
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
