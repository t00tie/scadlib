//difference(){
//	hub(5,0);
//	for ( i = [0 : 1] ){
//		rotate(a=[0,0,180*i]) { translate(v = [-4.75,0,12]) { cylinder(h = 30, r=1, $fn=20); } }
//	}
//}
module hub(bore, shape=0){
	difference(){
        // Hub core
		difference(){
			cylinder(h = 17, r=6, $fn=70);
			translate(v = [0,0,-1]) { cylinder(h = 19, r=bore/2, $fn=30); }
		}
       // Bore screws
		for ( i = [0 : 1] ){
			rotate(a=[0,0,45+(i*90)]){ translate( v = [0,-5,2.5] ){ rotate(a=[90,0,0]){ cylinder(h=12, r=1.25,$fn=30, center=true); } } }
		}
		// Attaches
		for ( i = [0 : 1] ){
			rotate(a=[0,0,45+(180*i)]) { translate(v = [6,-0.5,5]) { rotate(a=[0,0,45]){ cube(size = [15,15,15], center = false); } } }
		}
		rotate(a=[0,0,90]) {  translate(v = [-5,-3.5,5]) { cube(size = [10,7,15], center = false); } } }
	
}
