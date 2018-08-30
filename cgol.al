/*
my AL program
created by me on 30-08-18 13:44
*/

////classes////
set game = object () {
	
	set t = 1000/5;
	set d = 5;
	set width = algo.getWidth ();  //1080
	
	
	set color = 0;
	set cells = array {};
	
	set init = function () {
		algo.hide ();
		
		for (set i = -350; i < d*50; i+=50) {
			for (set j = -350; j < d*50; j+=50) 
{
				cells.add (cell.clone (i, 
j));
			}
		}
		
		cells.each (function (c){c.draw ();})
	};
	
	////
	////set a = array {1, 2, 3, 4}.each(function (item) 
{util.log (item);});
	////
	
	set draw = function () {
		algo.setBgColor (15)
		cells.each (function (c){
			algo.setColor (0);
			algo.goTo (c.x, c.y)
			algo.square (c.d);
			c.draw ();
		})
	};
	
	set run =function () {
		draw ();
		cells.each (function (c){
			c.rndALv ();
		})
	};
	
	set main = function () {
		init ();
		util.pulse (run, t);
	};
}

set cell =object () {
	set gm = new game;
	set aLv = false;
	set x = 0; set y = 0;
	set d = algo.getWidth ()/gm.d;
	
	set getALv = function () {
		return this.aLv;
	};
	set rndALv = function () {
		aLv = array{true, false}[ math.random(2) ]
	};
	set draw = function () {
		set clr = 0;
		if (getALv ()) clr = 14;
		else clr = 3;
		algo.setColor (clr);
		algo.goTo (x, y);
		algo.box (d-4);
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
new game.main ();

