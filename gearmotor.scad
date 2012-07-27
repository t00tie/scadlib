use <materials.scad>;
use <bom.scad>;
use <fasteners.scad>;
$fn=100;
//DC gearbox motor PGM-37DC12/77
module gearmotor_pgm37dc12_77(bom=true,negative=false,holes=true) translate([0,0,-1]){
    if(bom) bom(1,str("motor-","PGM37DC12-77"));
    bzp() render() difference(){ 
        cylinder(r=6.3, h=15);
        translate([-10,2.2,3]) cube(20);
    }
    translate([0,0,-5]){
        if(negative&&holes) cylinder(r=12.5/2,h=20);
        if(negative) mirror([0,0,1]) cylinder(r=38/2,h=55);
        steel() render(){
            //bulge around shaft
            cylinder(r=12.5/2,h=5);
            //motor body
            translate([7,0,0]) mirror([0,0,1]){
                cylinder(r=36.5/2,h=24);
                translate([0,0,24]) cylinder(r=32.5/2,h=30);
                
            }
        }
        if(negative) cylinder(r=12.5/2,h=10);
        // motor shaft is 7mm above center; lowering the mounting bolts
        if(holes)
        translate([7,0,7]) for(i=[0:5]) rotate(60*i) translate([0,31/2,0]){
            if(negative) translate([0,0,-1]) cylinder(r=3,h=1+13);
            mirror([0,0,1]) bolt(3,10);
        }
    }
}
//2D cut of the shaft
module gearmotor_shaft_pgm37dc12_77(){
    difference(){
        circle(r=6.3/2);
        translate([-10,2.2]) square(20);
    }
}
difference(){
    union(){
        for(i=[true,false]) mirror([0,0,i?0:1])
            linear_extrude(height=i?5:7) circle(r=30);
    }
    gearmotor_pgm37dc12_77(negative=true,bom=false);
}
gearmotor_pgm37dc12_77();
