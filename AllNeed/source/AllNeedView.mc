import Toybox.Activity;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.AntPlus;
import Toybox.Application;
import ToplineDrawable;


using Toybox.System;


class AllNeedView extends WatchUi.DataField {

    var battery = null;
    hidden var mHeartRate as Numeric;
    //hidden var mBatteryNum as Numeric;
    var mBatteryNum = 0 as AntPlus.BatteryStatusValue;

    var mSystemStats = System.getSystemStats();

    //var mSystemStats as System.Stats or Null;

    hidden var image as BitmapResource or Null;

    hidden var mBlablabla1;
    var myBitmap;
    var mBattery50Icon;



    function initialize() {
        DataField.initialize();
        mHeartRate = 0.0f;
        mBatteryNum = 0;
        mBattery50Icon = new WatchUi.Bitmap({
            :rezId=>Rez.Drawables.battery50,
            :locX=>10,
            :locY=>30
        });
    }

    // Set your layout here. Anytime the size of obscurity of
    // the draw context is changed this will be called.
    function onLayout(dc as Dc) as Void {

/*
        // Top left quadrant so we'll use the top left layout
        var obscurityFlags = DataField.getObscurityFlags();
        if (obscurityFlags == (OBSCURE_TOP | OBSCURE_LEFT)) {
            View.setLayout(Rez.Layouts.TopLeftLayout(dc));

        // Top right quadrant so we'll use the top right layout
        } else if (obscurityFlags == (OBSCURE_TOP | OBSCURE_RIGHT)) {
            View.setLayout(Rez.Layouts.TopRightLayout(dc));

        // Bottom left quadrant so we'll use the bottom left layout
        } else if (obscurityFlags == (OBSCURE_BOTTOM | OBSCURE_LEFT)) {
            View.setLayout(Rez.Layouts.BottomLeftLayout(dc));

        // Bottom right quadrant so we'll use the bottom right layout
        } else if (obscurityFlags == (OBSCURE_BOTTOM | OBSCURE_RIGHT)) {
            View.setLayout(Rez.Layouts.BottomRightLayout(dc));

        // Use the generic, centered layout
        } else {
            View.setLayout(Rez.Layouts.MainLayout(dc));
            var labelView = View.findDrawableById("lable") as Text;
            labelView.locY = labelView.locY - 16;
            var valueView = View.findDrawableById("value") as Text;
            valueView.locY = valueView.locY + 7;
        }
        (View.findDrawableById("lable") as Text).setText(Rez.Strings.label);




*/
/*
        View.setLayout(Rez.Layouts.TopLineLayout(dc));
        var screenWidth = dc.getWidth();
        var screenHeight = dc.getHeight();
        var totalToplineItemNum = 7;

        var directionValue = View.findDrawableById("directionValue") as Text;
        directionValue.locX = 0; 
        (View.findDrawableById("directionValue") as Text).setText(Rez.Strings.directionValue);

        var slopeLabel = View.findDrawableById("slopeLabel") as Text;
        slopeLabel.locX = screenWidth * (0.5/totalToplineItemNum);
        (View.findDrawableById("slopeLabel") as Text).setText(Rez.Strings.slopeLabel);

        var slopeValue = View.findDrawableById("slopeValue") as Text;
        //slopeValue.locX = View.findDrawableById("slopeLabel").width;
        System.print("#0:"); 
        System.print(slopeValue.locX); 
        System.print("#1:"); 
        System.print(View.findDrawableById("slopeLabel").width);
        System.print("#end"); 
        //slopeValue.locX = slopeLabel.locX + View.findDrawableById("slopeLabel").width;
        System.print(dc.getTextWidthInPixels("Slope", Graphics.FONT_TINY));
        //slopeValue.locX = slopeLabel.locX + dc.getTextWidthInPixels("Slope", Graphics.FONT_TINY);
        slopeValue.locX = slopeLabel.locX + 30;
        (View.findDrawableById("slopeValue") as Text).setText(Rez.Strings.slopeValue);

        var celsiusValue= View.findDrawableById("celsiusValue") as Text;
        celsiusValue.locX = screenWidth* 3/totalToplineItemNum;
        (View.findDrawableById("celsiusValue") as Text).setText(Rez.Strings.celsiusValue);

                //dc.drawLine(batteryLabel.locX-2, 0, batteryValue.locX-2, 20);

        var timeValue = View.findDrawableById("timeValue") as Text;
        timeValue.locX = screenWidth * 6/totalToplineItemNum;
        //timeValue.locY = timeValue.locY - 16;
        (View.findDrawableById("timeValue") as Text).setText(Rez.Strings.timeValue);
        */
        battery = new Battery({
	    				:locX => 100,
	    				:locY => 50 
	    		 	}, Graphics.COLOR_DK_BLUE, Graphics.COLOR_WHITE, 0);
        battery.draw(dc);

    }

    // The given info object contains all the current workout information.
    // Calculate a value and save it locally in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info as Activity.Info) as Void {
        // See Activity.Info in the documentation for available information.
        if(info has :currentHeartRate){
            if(info.currentHeartRate != null){
                mHeartRate = info.currentHeartRate as Number;
            } else {
                mHeartRate = 0.0f;
            }
        }

        //get battery 
        System.println("batter:" + mSystemStats.battery);

        
    }

    // Display the value you computed here. This will be called
    // once a second when the data field is visible.
    function onUpdate(dc as Dc) as Void {
        //var banana = WatchUi.loadResource(Rez.Drawables.battery1Icon);
        //dc.drawBitmap(50,100,banana);
        //dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        //dc.fillRectangle(50,0,100,20);
        View.setLayout(Rez.Layouts.TopLineLayout(dc));
        var screenWidth = dc.getWidth();
        var screenHeight = dc.getHeight();
        var totalToplineItemNum = 7;

        var directionValue = View.findDrawableById("directionValue") as Text;
        directionValue.locX = 0; 
        (View.findDrawableById("directionValue") as Text).setText(Rez.Strings.directionValue);

        var slopeLabel = View.findDrawableById("slopeLabel") as Text;
        slopeLabel.locX = screenWidth * (0.5/totalToplineItemNum);
        (View.findDrawableById("slopeLabel") as Text).setText(Rez.Strings.slopeLabel);

        var slopeValue = View.findDrawableById("slopeValue") as Text;
        //slopeValue.locX = View.findDrawableById("slopeLabel").width;
        System.print("#0:"); 
        System.print(slopeValue.locX); 
        System.print("#1:"); 
        System.print(View.findDrawableById("slopeLabel").width);
        System.print("#end"); 
        //slopeValue.locX = slopeLabel.locX + View.findDrawableById("slopeLabel").width;
        System.print(dc.getTextWidthInPixels("Slope", Graphics.FONT_TINY));
        //slopeValue.locX = slopeLabel.locX + dc.getTextWidthInPixels("Slope", Graphics.FONT_TINY);
        slopeValue.locX = slopeLabel.locX + 30;
        (View.findDrawableById("slopeValue") as Text).setText(Rez.Strings.slopeValue);

        var celsiusValue= View.findDrawableById("celsiusValue") as Text;
        celsiusValue.locX = screenWidth* 3/totalToplineItemNum;
        (View.findDrawableById("celsiusValue") as Text).setText(Rez.Strings.celsiusValue);

        var batteryLabel= View.findDrawableById("batteryLabel") as Text;
        batteryLabel.locX = screenWidth* 4/totalToplineItemNum;
        batteryLabel.setColor(0xADFF2F);



        //var banana = WatchUi.loadResource(Rez.Drawables.battery50);
        //batteryLabel.drawBitmap(batteryLabel.locX, batteryLabel.locY, banana);
        //batteryLabel.draw(dc);
        //batteryLabel.drawText(batteryLabel.locX, batteryLabel.locY, Graphics.FONT_TINY, mSystemStats.battery.toLong().toString(), Graphics.TEXT_JUSTIFY_LEFT);
        //batteryLabel.setColor(0xADFF2F);
        //batteryLabel.setText(mSystemStats.battery.toLong().toString());

        //batteryLabel.setBackgroundColor(Graphics.COLOR_GREEN);
        //View.findDrawableById("batteryLabel").setBitmap(0,0,battery50);


        //var batteryValue = View.findDrawableById("batteryValue") as Text;
        //batteryValue.locX = screenWidth* 5/totalToplineItemNum;
        //batteryValue.setText(mSystemStats.battery.toLong().toString() + "%");
        //batteryValue.setColor(Graphics.COLOR_GREEN);

/*
        if (mSystemStats.battery.toLong() >= 75) {
            var batteryValue = View.findDrawableById("Battery") as Text;
            //batteryValue.setBackgroundColor(Graphics.COLOR_GREEN);
            batteryValue.locX=screenWidth* 5/totalToplineItemNum;
            batteryValue.locY=0;
            batteryValue.draw(dc);
        } else if(mSystemStats.battery.toLong()<75 && mSystemStats.battery>=50) {
            var batteryValue = View.findDrawableById("Battery_50_75") as Text;
            batteryValue.locY=0;
            //batteryValue.setBackgroundColor(Graphics.COLOR_GREEN);
            batteryValue.locX=screenWidth* 5/totalToplineItemNum;
            batteryValue.draw(dc);
            //batteryValue.setBackgroundColor(Graphics.COLOR_YELLOW);
        } else if(mSystemStats.battery.toLong()<50 && mSystemStats.battery>=25) {
            var batteryValue = View.findDrawableById("Battery_25_50") as Text;
            //batteryValue.setBackgroundColor(Graphics.COLOR_GREEN);
            batteryValue.locX=screenWidth* 5/totalToplineItemNum;
            batteryValue.locY=0;
            batteryValue.draw(dc);
            //batteryValue.setBackgroundColor(Graphics.COLOR_ORANGE);
        } else if(mSystemStats.battery.toLong()<25) {
            var batteryValue = View.findDrawableById("Battery_0_25") as Text;
            //batteryValue.setBackgroundColor(Graphics.COLOR_GREEN);
            batteryValue.locX=screenWidth* 5/totalToplineItemNum;
            batteryValue.locY=0;
            batteryValue.draw(dc);
            //batteryValue.setBackgroundColor(Graphics.COLOR_RED);
        } 
        */
        

        var clockTime = System.getClockTime();
        var timeString = Lang.format(
            "$1$:$2$",
            [clockTime.hour, clockTime.min.format("%02d")]
        );
        var view = View.findDrawableById("TimeLabel") as Text;
        view.setText(timeString);
        //dc.drawLine(batteryLabel.locX-2, 0, batteryValue.locX-2, 20);

        var timeValue = View.findDrawableById("timeValue") as Text;
        timeValue.locX = screenWidth * 6/totalToplineItemNum;
        //timeValue.locY = timeValue.locY - 16;
        (View.findDrawableById("timeValue") as Text).setText(Rez.Strings.timeValue);


        View.onUpdate(dc);
        //dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
        //dc.fillRectangle(batteryValue.locX,batteryValue.locY/3,15,8);
        /*
        var banana = WatchUi.loadResource(Rez.Drawables.battery50);
        dc.drawBitmap(batteryLabel.locX, batteryLabel.locY, banana);
        dc.drawText(batteryLabel.locX, batteryLabel.locY, Graphics.FONT_TINY, mSystemStats.battery.toLong().toString(), Graphics.TEXT_JUSTIFY_LEFT);
        batteryLabel.setColor(0xADFF2F);
        */
        //mBattery50Icon.draw(dc);
        //batteryValue.setSize(5, 12);
        /*
        if (mSystemStats.battery.toLong() >= 75) {
            var batteryValue = View.findDrawableById("Battery") as Text;
            //batteryValue.setBackgroundColor(Graphics.COLOR_GREEN);
            batteryValue.locX=screenWidth* 5/totalToplineItemNum;
            batteryValue.locY=0;
            batteryValue.draw(dc);
        } else if(mSystemStats.battery.toLong()<75 && mSystemStats.battery>=50) {
            var batteryValue = View.findDrawableById("Battery_50_75") as Text;
            batteryValue.locY=0;
            //batteryValue.setBackgroundColor(Graphics.COLOR_GREEN);
            batteryValue.locX=screenWidth* 5/totalToplineItemNum;
            batteryValue.draw(dc);
            //batteryValue.setBackgroundColor(Graphics.COLOR_YELLOW);
        } else if(mSystemStats.battery.toLong()<50 && mSystemStats.battery>=25) {
            var batteryValue = View.findDrawableById("Battery_25_50") as Text;
            //batteryValue.setBackgroundColor(Graphics.COLOR_GREEN);
            batteryValue.locX=screenWidth* 5/totalToplineItemNum;
            batteryValue.locY=0;
            batteryValue.draw(dc);
            //batteryValue.setBackgroundColor(Graphics.COLOR_ORANGE);
        } else if(mSystemStats.battery.toLong()<25) {
            var batteryValue = View.findDrawableById("Battery_0_25") as Text;
            //batteryValue.setBackgroundColor(Graphics.COLOR_GREEN);
            batteryValue.locX=screenWidth* 5/totalToplineItemNum;
            batteryValue.locY=0;
            batteryValue.draw(dc);
            //batteryValue.setBackgroundColor(Graphics.COLOR_RED);
        } 
        */
        /*
        dc.drawText(
            dc.getWidth() / 2,                      // gets the width of the device and divides by 2
            dc.getHeight() / 2,                     // gets the height of the device and divides by 2
            Graphics.FONT_TINY,                    // sets the font size
            "Hello",                          // the String to display
            Graphics.TEXT_JUSTIFY_LEFT// sets the justification for the text
        );
        */

        /*
        var options = {
            "identifier" => "test",
            "locX" => 2,
            "locY" => 40,
            "width" => 30,
            "height" => 20,
            "visible" => 1
        };
        var toplineDrawable = new ToplineDrawable.BatteryDrawable(options);
        toplineDrawable.setLevel(50);
        toplineDrawable.draw(dc);
        */
        battery.draw(dc);
    }

}
