import Toybox.Activity;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.AntPlus;
import Toybox.Application;


using Toybox.System;


class AllNeedView extends WatchUi.DataField {

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
        batteryLabel.draw(dc);
        //batteryLabel.drawText(batteryLabel.locX, batteryLabel.locY, Graphics.FONT_TINY, mSystemStats.battery.toLong().toString(), Graphics.TEXT_JUSTIFY_LEFT);
        //batteryLabel.setColor(0xADFF2F);
        //batteryLabel.setText(mSystemStats.battery.toLong().toString());

        //batteryLabel.setBackgroundColor(Graphics.COLOR_GREEN);
        //View.findDrawableById("batteryLabel").setBitmap(0,0,battery50);

        var batteryValue = View.findDrawableById("batteryValue") as Text;
        batteryValue.locX = screenWidth* 5/totalToplineItemNum;
        batteryValue.setText(mSystemStats.battery.toLong().toString() + "%");
        batteryValue.setColor(Graphics.COLOR_BLACK);
        if (mSystemStats.battery > 80) {
            batteryValue.setBackgroundColor(Graphics.COLOR_GREEN);
        } else if(mSystemStats.battery<=80 && mSystemStats.battery>60) {
            batteryValue.setBackgroundColor(Graphics.COLOR_BLUE);
        } else if(mSystemStats.battery<=60 && mSystemStats.battery>40) {
            batteryValue.setBackgroundColor(0x001000);
        }

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
        mBattery50Icon.draw(dc);
    }

}
