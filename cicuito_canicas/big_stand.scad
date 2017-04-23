include <utils/relativity.scad>


//const
straw_radio = 5.4/2; //straw diamentre (pajita)
height = 20;
base_large = true; //create suppor large o sort 


/**
* Init module
**/
main(base_large);
module main(bolean){
    difference() {
      base();
      drill();
    }
  if(base_large){
    difference() {
      base_larga();
      base_extension_recorte();
    }
  }
}


/**
* Drill hole insert straw (pakita)
**/
module drill(diametro) {
  cylinder(r=straw_radio, h=height, $fn=100);
}

/**
* base hierarchical relativity module simplify creation
**/
module base(height) {
  union() {
    box([25,20,2]);
    align(top)
    box([15,15,3])
    align(top)
    box([10, 10, 4]);
  }
}


/**
* base support
**/
module base_larga() {
  box([25,50,2]);
}


/**
* bese suport cuts
**/
module base_extension_recorte(){
  translated(16*y, class="hole")
  box([20,15,2], $class="hole");
  translated(-16*y, class="hole2")
  box([20,15,2], $class="hole2");
}
