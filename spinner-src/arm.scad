use <parametric_involute_gear_v5.0.scad>

module arm(){
	difference(){
	  linear_extrude(file="arm.dxf",height=10);
	  for(i=[0:9]) translate([15+i*120/10,5,-1])cylinder(r=1.5,h=15);
	  for(i=[0:9]) translate([15+i*120/10,125,-1])cylinder(r=1.5,h=15);
	  translate([178,65-13,5])cylinder(r=2.5,h=20,center=true);
	  translate([178,65+13,5])cylinder(r=2.5,h=20,center=true);
	  translate([175,65-7,-10])cube([7.5,14,30]);
	  translate([178,65,5])rotate([0,90,0])cylinder(r=4.4,h=20,center=true);
	
	}
}

module armbase(){
	difference(){
		union(){
		  translate([0,0,34])cylinder(r=12,h=68,center=true,$fn=60);
		  translate([0,0,1.5])cylinder(r=14,h=3,center=true);
		  translate([0,0,15.5])cylinder(r=14,h=3,center=true);
		  translate([0,0,60])scale([1.2,1,1.2])rotate([0,90,0])cylinder(r=20,h=15,center=true);
		}
		translate([1.3,0,10])rotate([0,20,0])translate([0,0,20])cylinder(r=8.75,h=75,center=true);
		translate([0,0,63.5])cube([11,60,30],center=true);
		translate([-22,-7,56])cube([30,14,8]);
		translate([0,0,76.5])cube([40,40,17],center=true);
		translate([0,13,60])rotate([0,90,0])cylinder(r=2.5,h=20,center=true);
		translate([0,-13,60])rotate([0,90,0])cylinder(r=2.5,h=20,center=true);
	}
}

module semiaxle(){
rotate([90,0,90])difference(){
cylinder(r=17,h=140,center=true);
cylinder(r=8,h=141,center=true,$fn=6);
translate([0,-9,0])cube([34,18,141],center=true);
translate([0,13.5,60])cylinder(r=2.5,h=30,center=true);
translate([0,14,60])scale([1,1.5,1.2])rotate([0,0,90])cylinder(r=4.6,h=5,center=true,$fn=6);
translate([0,13.5,-60])cylinder(r=2.5,h=30,center=true);
translate([0,14,-60])scale([1,1.5,1.2])rotate([0,0,90])cylinder(r=4.6,h=5,center=true,$fn=6);
%translate([0,0,70])cylinder(r=11,h=30,center=true);

}
}

module spindleend(){
difference(){
rotate_extrude(file="spindle.dxf");
translate([0,13.5,10])cylinder(r=2.5,h=30,center=true);
translate([0,-13.5,10])cylinder(r=2.5,h=30,center=true);
}
}

module lgear(){
	//Large WADE's Gear - Double Helix

	circles=5;
	teeth=24;
	pitch=262.5;
	twist=200;
	height=11;
	pressure_angle=30;

	difference(){
		union(){
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness =0,// height/2*0.5,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2,
			hub_diameter = 25,
			bore_diameter = 5/2,
			circles=circles,
			twist = twist/teeth);
		mirror([0,0,1])
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness = height/2,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2,
			hub_diameter=25,
			bore_diameter=8,
			circles=circles,
			twist=twist/teeth);
		}
		translate([0,0,3])rotate([180,0,0])cylinder(r=5/2,h=20,center=true);
	}
}


module spindlegear(){
difference(){
union(){
rotate_extrude(file="spindle.dxf");
translate([0,0,8])cylinder(r=11.5,h=8,center=true);
translate([0,0,20]) lgear();
translate([0,0,12.51])cylinder(r1=16,r2=17.5,h=4,center=true);
}
translate([0,13.5,10])cylinder(r=2.5,h=50,center=true);
translate([0,-13.5,10])cylinder(r=2.5,h=50,center=true);
translate([0,0,10])cylinder(r=8,h=50,center=true);
translate([0,0,22])cylinder(r=11.5,h=8,center=true);

}
}

module smallgear(){
mirror([1,0,0])translate([0,0,5.5])difference(){union(){
lgear();
translate([0,0,-5.5])cylinder(r=25/2,h=20);
}
translate([0,0,-10])cylinder(r=2.8,h=30);
for(i=[0:2]) rotate([0,0,120*i]){
translate([0,0,10])rotate([0,90,0])cylinder(r=4.5/2,h=30);
translate([6,0,8])cube([3.5,7.5,14],center=true);
}
}

}

module rearbrac(){

difference(){
union(){
translate([0,0,68/2])cube([10,50,68],center=true);
translate([-5,27,5/2])cube([20,10,5],center=true);
translate([0,28,5/2])cube([10,20,5],center=true);
translate([-5,-27,7/2])cube([20,10,7],center=true);
translate([0,-28,7/2])cube([10,20,7],center=true);

}
translate([0,-33,7/2])cylinder(r=4.5/2,h=10,center=true);
translate([-10,-27,7/2])cylinder(r=4.5/2,h=10,center=true);
translate([0,33,7/2])cylinder(r=4.5/2,h=10,center=true);
translate([-10,27,7/2])cylinder(r=4.5/2,h=10,center=true);

translate([-6,0,43/2])cube([10,43,43],center=true);
translate([0,0,43/2])rotate([90,0,-90])cylinder(r=24.5/2,h=11,center=true);
translate([-3,0,55])rotate([90,0,-90])cylinder(r=22.5/2,h=8,center=true);
translate([3,0,55])rotate([90,0,-90])cylinder(r=14/2,h=8,center=true);
translate([0,34,78])scale([1,1,1.5])rotate([90,0,-90])cylinder(r=44/2,h=12,center=true);
translate([0,-34,78])scale([1,1,1.5])rotate([90,0,-90])cylinder(r=44/2,h=12,center=true);
translate([0,0,21])rotate(a=[0,90,0]){rotate ([0,0,45]) translate([20,0,0]) cube(size = [10,3.5,25], center = true);
rotate ([0,0,-45]) translate([20,0,0]) cube(size = [10,3.5,25], center = true);
rotate ([0,0,135]) translate([20,0,0]) cube(size = [10,3.5,25], center = true);
rotate ([0,0,-135]) translate([20,0,0]) cube(size = [10,3.5,25], center = true);
}
}
}

module fbrac(){
difference(){
union(){
translate([0,0,40/2])cube([9,50-6,40],center=true);
translate([0,0,40])scale([1,1,0.7])rotate([90,0,-90])cylinder(r=25-3,h=9,center=true);
translate([-5,27-3,5/2])cube([20,10,5],center=true);
translate([0,28-3,5/2])cube([10,20,5],center=true);
translate([-5,-27+3,7/2])cube([20,10,7],center=true);
translate([0,-28+3,7/2])cube([10,20,7],center=true);

}
translate([0,-33+3,7/2])cylinder(r=4.5/2,h=10,center=true);
translate([-10,-27+3,7/2])cylinder(r=4.5/2,h=10,center=true);
translate([0,33-3,7/2])cylinder(r=4.5/2,h=10,center=true);
translate([-10,27-3,7/2])cylinder(r=4.5/2,h=10,center=true);

translate([0,0,55])rotate([90,0,-90])cylinder(r=12.5,h=12,center=true);
translate([0,-10,25])rotate([90,0,0])cylinder(r=2.25,h=25,center=true);
translate([0,-15,25])rotate([0,0,0])cube([11,4,7.5],center=true);

}
}



module plate1(){
*translate([-97,-50]) arm();
*translate([35,52,0])armbase();
translate([-10,32,0])rotate([0,0,-18])semiaxle();
translate([-17,-70,0])semiaxle();
*mirror([0,0,1])translate([-90,-1,-5])rotate([0,-90,180])rearbrac();
*translate([10,-15,0])smallgear();
}
module plate2(){
translate([-97,-50]) spindleend();

}
module assembly(){
translate([0,0,51+24]){
translate([0,0,])rotate([0,0,0]){translate([-97,-50,-5]) arm();
translate([141,15,0])rotate([180,-90,180])armbase();
}
translate([40,15,5]) rotate([90,0,90])spindleend();
translate([-100,15,5]) rotate([90,0,-90])spindlegear();
translate([-114.5,15,-30]) rotate([90,7,-90])smallgear();
translate([-140.5,15,-51]) rearbrac();
translate([132.5,15,-51]) fbrac();

translate([-30,15,5])semiaxle();
*translate([-30,15,5])mirror([0,0,1])semiaxle();

translate([-40,15,5])rotate([90,0,90])color([128,0,0])cylinder(h=250,r=4,center=true);
}
}
smallgear();
*spindlegear();
*mirror([0,0,1])translate([-30,-1,-5])rotate([0,-90,180])rearbrac();
*fbrac();
*spindleend();
*translate([-20,0,0])rotate([0,0,45])semiaxle();
*translate([20,0,0])rotate([0,0,90])semiaxle();

*translate([-30,-50])plate1();
*assembly();
%cube([193,193,0.01],center=true);