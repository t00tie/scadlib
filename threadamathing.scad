pitch=1.75;
height=20;
m=12;
threadheight=m-9.6;
difference(){
	cylinder(r=25,$fn=6,h=10,center=true);
	linear_extrude(twist=180*height/pitch,height=height,center=true) translate([threadheight,0,0]) difference()
		circle(r=m+threadheight);
}