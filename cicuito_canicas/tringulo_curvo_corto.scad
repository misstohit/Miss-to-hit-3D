intersection()
{
    rotate_extrude()
    {
        translate([10,0,0]) triangle(4);
    }
    hull()
    {
        rotate(0) cube([0.1,50,50]);
        rotate(90) cube([0.1,50,50]);
    }
}



module triangle(radius)
{
  o=radius/2;
  a=radius*sqrt(3)/2;
  polygon(points=[[-a,-o],[0,radius],[a,-o]],paths=[[0,1,2]]);
}
