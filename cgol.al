/*
my AL program
created by me on 30-08-18 13:44
*/

////classes////
set game = object () {
	
	set t = 1000/5;
	set wf = 4;
	set width = algo.getWidth () - 100;  //1080
	
	
	set color = 0;
	set cells = array {};
	
	set init = function () {
		algo.hide ();
		ui.fullScreen();
		
		for (set ro = 0; ro < wf; ro++) {
			for (set co = 0; co < wf; co++) {
				set sX = (ro - wf/2)*cell.d 
+ cell.d/2;
				set sY = (co - wf/2)*cell.d 
+ cell.d/2;
				cells.add (cell.clone (sX, 
sY));
				
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
	
		////temp////
		algo.setColor (6);
		algo.goTo (0,0);
		algo.rect (1000,0);
		///////////
		
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
	set aLv = false;
	set x = 0; set y = 0;
	set d = game.width/game.wf; 
	
	set getALv = function () {
		return this.aLv;
	};
	set rndALv = function () {
		aLv = array{true, false}[math.random(2)]
	};
	set draw = function () {
		set clr = 0;
		if (getALv ()) clr = 14;
		else clr = 3;
		algo.setColor (clr);
		algo.goTo (x, y);
		algo.box (d);
				algo.setColor (7);
				algo.goTo (x,y-10)algo.text 
("x: "..x);
				algo.goTo (x,y+10)algo.text 
("y: "..y);
				
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

