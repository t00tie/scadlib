// PRUSA Mendel  
// GNU GPL v2
// Z leadscrew constraint with nut traps and hall-O holder

hall=true; //add hall-O holder

include <configuration.scad>;

outer_diameter = m8_diameter/2+3.3;
shaft_separation = 30;
bearing_od = 22.6;
bearing_id = m8_diameter;
bearing_height = 7;
bearing_rodhole_d = m8_nut_diameter+3;  //bearing_id + 3;
bottom=1;
height=bearing_height+bottom;

module origclamp(){
  difference(){
    union(){
      
      translate([outer_diameter, outer_diameter, 0]){
		cylinder(h=height, r = outer_diameter, $fn = 20);
if(hall)	cube([5,32.5,height]);
	}
      translate([outer_diameter, 0, 0])cube([17.5,outer_diameter*2,height]);

    }

if(hall)	translate([outer_diameter,outer_diameter+10,height/2]){
		rotate([0,90,0]){
#			cylinder(r=m3_diameter/2,$fn=10,h=20,center=true);
			cylinder(r=3,$fn=6,h=6,center=true);
		}
		translate([0,17,0]) rotate([0,90,0]){
#			cylinder(r=m3_diameter/2,$fn=10,h=20,center=true);
			cylinder(r=3,$fn=6,h=6,center=true);
		}
	}
    translate([9, outer_diameter/2+1, 0])cube([18,05,height]);
    translate([outer_diameter, outer_diameter, 0]) cylinder(h =height, r = m8_diameter/2, $fn = 18);
    translate([17, 15.5, height/2]) rotate([90, 0, 0]){
		#cylinder(h =20, r = m3_diameter/2, $fn = 10);
		cylinder(r=3,$fn=6,h=6,center=true);
	}
  }
}


difference()
{

  union()
  {
    translate([-outer_diameter,-outer_diameter,0]) origclamp();
    translate([-shaft_separation,0,0]) {
      cylinder(r=(bearing_od/2) + 3, h=height);
      translate([-m8_diameter/2,-2.5,0]) cube([30,5,height]);
    }
  }

  translate([-shaft_separation, 0,0]) {
    translate([0,0,bottom]) cylinder(r=bearing_od/2, h=height);
    translate([0,0,-1]) cylinder(r=bearing_rodhole_d/2, h=height);
  }
}


