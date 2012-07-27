//Magical thing that makes threads from a bunch of stacked cylinders, intended for printing threads.
//Pitch depth calculation is based on metric, I have no clue if it's any different for imperial.
//d is minimum diameter (r is accepted too), pitch is thread pitch, h is height
//seg is segment height (1/layer height)
//nathan zadoks's thingy. WTFPL, attribution if you feel like it.

module thread(d=8,r=false,pitch=1.25,pitchdepth=false,h=1,seg=1/0.4,center=false){
	r=(r!=false?r:d/2);
	pitchdepth=(pitchdepth!=false?pitchdepth:0.54126*pitch);
	segments=seg*h;
	translate([0,0,center==false?0:(-h/2)])
	for(i=[0:segments-1])
		rotate([0,0,360/seg*i/pitch]) translate([pitchdepth,0,1/seg*i]) render()
			difference(){
			cylinder(r=r,h=1/seg);
			cylinder(r=r-pitchdepth,h=20,center=true);
		}
}
