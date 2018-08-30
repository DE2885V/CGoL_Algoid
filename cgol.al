/*
my AL program
created by me on 30-08-18 13:44
*/
set t = 1000/5;
set color = 0;
set c1; set c2
set cells = array {};

set init = function () {
	algo.hide ();
	cells.add(cell.clone (-100, -100));
	cells.add(cell.clone (-100, 100));
	cells.add(cell.clone (100, -100));
	cells.add(cell.clone (100, 100));
	cells.add(cell.clone (-100, -300));
	cells.add(cell.clone (-100, 300));
	cells.add(cell.clone (100, -300));
	cells.add(cell.clone (100, 300));
	
	cells.each (function (c){c.draw ();})
	
}

////
////set a = array {1, 2, 3, 4}.each(function (item) 
{util.log (item);});
////

set draw = function () {
	cells.each (function (c){
		algo.setColor (15);
		algo.goTo (c.x, c.y)
		algo.rect (100, 100);
		c.draw ();
	})
}

set run =function () {
	draw ();
	cells.each (function (c){
		c.rndALv ();
	})
}

set main = function () {
	init ();
	util.pulse (run, t);
}

////classes////
set cell =object () {
	set aLv = false;
	set x = 0; set y = 0;
	set d = 95;
	
	set getALv = function () {
		return this.aLv;
	};
	set rndALv = function () {
		aLv = array{true, false}[ math.random(2) ]
	};
	set draw = function () {
		set clr = 0;
		if (getALv ()) clr = 14;
		else clr = 0;
		algo.setColor (clr);
		algo.goTo (x, y);
		algo.box (d);
	};
	set clone = function (px, py) {
		set o = new this;
		o.x=px; 
		o.y=py;
		o.rndALv ();
		o.draw ();
		return o;
	};
	
}

////main////
main ();

