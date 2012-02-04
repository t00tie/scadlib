//An extruder inspired by Greg's Hinged Extruder.
//Deisgned to be 

include <stuff.scad>;

membrane=0.1;

taphole=true;
mountinghole_distance=25;

hinge_bolt=3;

filament_diameter=3;
filament_diameter_hole=4;

big_gear_pitch_radius=80*0.25;
small_gear_pitch_radius=14*0.25;

drive_pitch_radius=8/2;
drive_diameter=12;
drive_offset=0;
drive_length=5;
drive_shaft_diameter=4;
drive_spacing=13-5;

z_offset=big_gear_pitch_radius+0; //

bearing_diameter=16.75;
bearing_thickness=5;
bearing_sidewall=2;
bearing_topwall=2;
bearing_thickness_total=bearing_thickness+bearing_topwall;

idler_bearing_diameter=22;
idler_bearing_clearance=5;
idler_bearing_thickness=9;

base_thickness=7;
base_length=70;
base_leadout=25;
base_cubelength=base_length-(base_thickness*2);

drivestack_length=bearing_thickness_total+drive_offset+drive_length+drive_spacing+bearing_thickness;
filament_position=bearing_thickness_total+drive_offset+(drive_length/2);
base_width=filament_position*2;

module base(){
	difference(){
		union(){
			translate([0,-base_cubelength/2,0])
				cube([base_thickness,base_cubelength,base_width]);
			for(i=[-1,1]) translate([base_thickness/2,i*base_cubelength/2,0])
				cylinder(r=base_thickness/2,h=base_width);
		}
		for(i=[-1,1]) translate([base_thickness/2,i*mountinghole_distance,filament_position]) rotate([0,90,0]){
			if(taphole){
				hole(d=m4_taphole_diameter,h=bignumber,center=true);
			}
			else{
				cylinder(r=m4_nut_diameter/2,h=base_thickness,$fn=6);
				hole(d=4,h=bignumber,center=true);
			}
		}
	}
}

module body(){
	translate([z_offset,drive_pitch_radius+filament_diameter/2,0])
	difference(){
		union(){
			translate([-z_offset,-bearing_diameter/2-bearing_sidewall,0]) //main block
				cube([z_offset+bearing_diameter/2+bearing_sidewall,
					bearing_diameter+2*bearing_sidewall,
					drivestack_length]);
			//hinge
			translate([-z_offset+hinge_bolt,
				-bearing_diameter/2-bearing_sidewall-hinge_bolt,
				filament_position
			]) difference(){
				union(){
					translate([-hinge_bolt/2,0,0])
						cube([hinge_bolt,hinge_bolt*2,drivestack_length],center=true);
					translate([0,hinge_bolt/2,0])
						cube([hinge_bolt*2,hinge_bolt,drivestack_length],center=true);
					hole(r=hinge_bolt,h=drivestack_length,center=true);
				}
				polyhole(d=hinge_bolt,h=drivestack_length*3,center=true);
			}
		}
		union(){
			polyhole(d=bearing_diameter,h=bearing_thickness*2,center=true); // bearing no 1
			translate([0,0,bearing_thickness_total]){
				translate([-drive_pitch_radius,drive_pitch_radius,0]) mirror([0,1,0])
					cube([bearing_diameter,bearing_diameter,bignumber]);
				translate([0,0,-bearing_topwall+membrane])
					polyhole(d=drive_diameter,h=bignumber);
				translate([0,0,drive_length+drive_offset+drive_spacing])
					polyhole(d=bearing_diameter,h=bignumber); // bearing no 2
			}
			// idler bearing space
			translate([0,-idler_bearing_diameter/2-drive_pitch_radius,bearing_thickness_total])
				hole(d=idler_bearing_diameter+idler_bearing_clearance,h=bignumber);
			%union(){
				translate([0,0,drive_offset+bearing_thickness_total])
					hole(r=drive_pitch_radius,h=drive_length);
				hole(d=drive_shaft_diameter,h=bignumber);
			}
		}
	}
}

difference(){
	union(){
		translate([-base_thickness,0,0]) base();
		body();
	}
#	translate([0,0,filament_position]) rotate([0,90,0]) polyhole(d=filament_diameter_hole,h=bignumber,center=true);
}