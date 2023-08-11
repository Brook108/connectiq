using Toybox.Graphics;
using Toybox.System;
using Toybox.WatchUi;

module ToplineDrawable {
  class Battery extends WatchUi.Drawable {

	var fg = null;
	var bg = null;
	var font = null;
	
	function initialize(params, fgColor, bgColor, fnt) {
		WatchUi.Drawable.initialize(params);
		fg = fgColor;
		bg = bgColor;
		font = fnt;
	}
	
	function draw(dc) {
		var state = System.getSystemStats().battery;
		var y = locY;
    	if (state - state.toNumber() >= 0.5) {
    		state++;
    	}
		var remainingBattery = state / 100;
		state = state.toNumber().toString() + "%";
    	var textWidth = dc.getTextWidthInPixels(state.toString(), font);
    	var totalWidth = textWidth + 25;
    	var startX = (dc.getWidth() - totalWidth) / 2;
    	var x = startX + textWidth + 3;
    	var points = new [8];
    	dc.setColor(fg, bg);
    	var statusWidth = 18.toFloat()*remainingBattery;
    	var statusWidthInt = statusWidth.toNumber();
    	if (statusWidth - statusWidthInt >= 0.5) {
    		statusWidthInt++;
    	}
    	points[0]=[x,y];
    	points[1]=[x+20,y];
    	points[2]=[x+20,y+3];
    	points[3]=[x+22,y+3];
    	points[4]=[x+22,y+7];
    	points[5]=[x+20,y+7];
    	points[6]=[x+20,y+10];
    	points[7]=[x,y+10];
    	dc.fillPolygon(points);
    	dc.setColor(bg, bg); 
    	dc.fillRectangle(x+1, y+1, 18, 8); 	
    	dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT); 
    	if (remainingBattery > 0.05) {
	    	dc.fillRectangle(x+1, y+1, statusWidthInt, 8);
    	}
    	dc.drawText(x, y-2, Graphics.FONT_XTINY, state, Graphics.TEXT_JUSTIFY_LEFT);
	}
	
}
}