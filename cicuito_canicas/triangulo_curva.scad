  intersection()
{
    rotate_extrude()
    {
        translate([30,0,0]) triangle(3.8);
    }
    hull()
    {
        rotate(0) cube([0.1,700,700]);
        rotate(170) cube([0.1,700,700]);
    }
}

translate([0, 0, 0]) {
  intersection()
  {
    rotate_extrude()
    {
        translate([20,0,0]) triangle(3.8);
    }
    hull()
    {
      rotate(0) cube([0.1,700,700]);
      rotate(170) cube([0.1,700,700]);
    }
  }
}


module triangle(radius)
{
  o=radius/2;
  a=radius*sqrt(3)/2;
  polygon(points=[[-a,-o],[0,radius],[a,-o]],paths=[[0,1,2]]);
}
