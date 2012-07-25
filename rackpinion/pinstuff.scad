use <../lib/materials.scad>;
include <globals.scad>;
use <rackpinion.scad>;
sheet_thickness=4;
module unsheet(color=true,center=false){
    if(color) color([0.64,0.36,0.11]) linear_extrude(height=sheet_thickness,center=center) child(0);
    else linear_extrude(height=sheet_thickness,center=center) child(0);
}
module pinwheel(){
    steel() linear_extrude(height=sheet_thickness*3,center=true) pins();
    mirror([0,0,1]) translate([0,0,sheet_thickness/2]) unsheet() pinholder();
    translate([0,0,sheet_thickness/2+0.01]) unsheet() pinholder();
    unsheet(center=true) pinholder_center();
}
n=pins;
translate([pitch_circumference/-2,0]){
    aluminium() for(i=[0:n-1]) translate([8*1.5*i,0,0]) unsheet(color=false,center=true) tooth(center=true);
    translate([0,pitch_diam/2+pin_diam]) translate([pitch_circumference*$t,0]) rotate([0,0,-360*$t]) pinwheel();
}

echo(pitch_diam+pin_diam);
