intersection()
{
    rotate_extrude()
    {
        translate([25,0,0]) triangle(4.3);
    }
    hull()
    {
        rotate(0) cube([0.1,100,100]);
        rotate(140) cube([0.1,100,100]);
    }
}



module triangle(radius)
{
  o=radius/2;
  a=radius*sqrt(3)/2;
  polygon(points=[[-a,-o],[0,radius],[a,-o]],paths=[[0,1,2]]);
}
