/**
* my AL program
* created by me on 30-08-18 13:44
* .............................
* @author EugenD
* @version 1.0
* @since 2018-08-30 13:00
*/

////classes////
set game = object () {
	
	set t = 3000/5;
	set wf = 9; //max:9
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
				sY, ro, co));
				
			}
		}
		cells.each (function (c){c.draw ();})
	};
	
	////
	////set a = array {1, 2, 3, 4}.each(function (item) {util.log (item);});
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
			c.nextGen (); //здесь должен быть пересчет поколения
		
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
	set ro = 0; set co = 0;
	set d = game.width/game.wf; 
	set numOfNb = 0;
	
	set getALv = function () {
		return this.aLv;
	};
	set rndALv = function () {
		aLv = array{true, false}[math.random(2)]
	};
	set countNb = function (cells) {
		// ...
		//пробежаться по всем ячейкам и записать в них кол-во соседей
		for (set ir = 0; ir < cells; i++) {
			
		}
	}
	set nextGen = function () {
		/////////simul_count_Nb
		numOfNb = math.random (8);
		
		//в зависимости от кол-ва соседей
		// - состояние клетки
		if (aLv){
			if (numOfNb == 2 || numOfNb == 3) 
			aLv = true;
			elseif (numOfNb<2 || numOfNb>3) aLv
			= false;
		}else {
			if (numOfNb == 3) aLv = true;
		}
	};
	set draw = function () {
		set clr = 0;
		if (getALv ()) clr = 14;
		else clr = 3;
		algo.setColor (clr);
		algo.goTo (x, y);
		algo.box (d-10);
		algo.setColor (9);
		algo.goTo (x,y-10)algo.text 
		("ro: "..ro);
		algo.goTo (x,y+10)algo.text ("n: 
		"..numOfNb);
		
	};
	set clone = function (px, py, ro, co) {
		set o = new this;
		o.x=px; 
		o.y=py;
		o.ro=ro;
		o.co=co;
		o.rndALv ();
		o.draw ();
		return o;
	};
	
}

////main////
new game.main ();

