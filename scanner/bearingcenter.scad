include <stuff.scad>;
//$fa=0.1;
balldiam=6+0.25;

inner_id=3/4*25.4;	//82/2;
inner_wall=5;
inner_topwall=2;
inner_bottomwall=2; //10;

ballgroove_fn=7;

inner_height=inner_bottomwall+balldiam+inner_topwall;
inner_od=inner_id+inner_wall*2;

tubediam=7.5;//23;
tubeholder=false;
outer_topwall=3;
outer_sidewall=10;

module bearinginner(){
	difference(){
		cylinder(r=inner_od/2,h=inner_height);
		union(){
			cylinder(r=inner_id/2,h=bignumber,center=true);
			translate([0,0,inner_bottomwall+balldiam/2])
			rotate_extrude(convexity=10) translate([inner_od/2+balldiam/4,0])
				circle(r=balldiam/2,$fn=ballgroove_fn);
		}
	}
}
module half(which=0,rot=0){
	intersection(){
		child(0);
		rotate([0,0,rot])
		mirror([which,0,0]) translate([bignumber/2,0]) cube([1,1,1]*bignumber,center=true);
	}
}
module bearingouter(){
	difference(){
		union(){
			cylinder(r=inner_od/2+outer_sidewall,h=tubediam+outer_topwall);
*			translate([3/-2,inner_od/2]) cube([3,20,tubediam+outer_topwall]);
			if(tubeholder)
			translate([inner_od/2,(tubediam+outer_topwall)/-2])
				cube([tubediam+outer_topwall+outer_sidewall,tubediam+outer_topwall,tubediam+outer_topwall]);
		}
		union(){
			cylinder(r=inner_od/2+balldiam/2,h=bignumber,center=true);
			translate([0,0,inner_bottomwall+balldiam/2])
			rotate_extrude(convexity=10) translate([inner_od/2+balldiam/4,0])
				circle(r=balldiam/2,$fn=ballgroove_fn);
			if(tubeholder){
				translate([inner_od/2+outer_sidewall,0,(tubediam+outer_topwall)/2]) rotate([0,90]) cylinder(r=tubediam/2,h=bignumber);
				translate([inner_od/2+outer_sidewall+(tubediam+outer_topwall)/2,0,(tubediam+outer_topwall)/2]) rotate([90,0]) cylinder(r=3/2,h=bignumber,center=true);
			}
		}
	}
}

//for(i=[0,1]) rotate([0,0,i*180]) translate([5,0]/2) semibearinginner();
//translate([inner_od/2+balldiam/4,0,inner_bottomwall+balldiam/2]) sphere(r=6/2);
for(i=[false,true]) translate([i?1:-1,0,0])
half(i?0:1) bearinginner();
bearingouter();
