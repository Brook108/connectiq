import Toybox.Activity;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.AntPlus;
import Toybox.Application;

using Toybox.System;


class AllNeedView extends WatchUi.DataField {

    hidden var mHeartRate as Numeric;
    hidden var mBatteryNum as Numeric;
    //var mSystemStats = System.getSystemStats();

    var mSystemStats as System.Stats or Null;

    var image as BitmapResource or Null;


    function initialize() {
        DataField.initialize();
        mHeartRate = 0.0f;
        mBatteryNum = 0;

    }

    // Set your layout here. Anytime the size of obscurity of
    // the draw context is changed this will be called.
    function onLayout(dc as Dc) as Void {
        dc.drawBitmap(20, 80, image);

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

        //View.findDrawableById("batteryLabel").setIcon(icon);
        var batteryLabel = View.findDrawableById("batteryLabel") as Text;
        batteryLabel.locX = screenWidth * 4/totalToplineItemNum;
        (View.findDrawableById("batteryLabel") as Text).setText(Rez.Strings.batteryLabel);

        var batteryValue= View.findDrawableById("batteryValue") as Text;
        batteryValue.locX = screenWidth * 5/totalToplineItemNum;
        (View.findDrawableById("batteryValue") as Text).setText(Rez.Strings.batteryValue);






        var timeValue = View.findDrawableById("timeValue") as Text;
        timeValue.locX = screenWidth * 6/totalToplineItemNum;
        //timeValue.locY = timeValue.locY - 16;
        (View.findDrawableById("timeValue") as Text).setText(Rez.Strings.timeValue);


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
        //System.print(AntPlus.BatteryStatus.batteryInDays);
        
    }

    // Display the value you computed here. This will be called
    // once a second when the data field is visible.
    function onUpdate(dc as Dc) as Void {
        // Set the background color
        (View.findDrawableById("Background") as Text).setColor(getBackgroundColor());

        // Set the foreground color and value
        var hRateVal = View.findDrawableById("hRateValue") as Text;
        if (getBackgroundColor() == Graphics.COLOR_BLACK) {
            hRateVal.setColor(Graphics.COLOR_WHITE);
        } else {
            hRateVal.setColor(Graphics.COLOR_BLACK);
        }
        hRateVal.setText(mHeartRate.format("%.2f"));

        //Set battery color and value
        mSystemStats = System.getSystemStats();
        System.println(mSystemStats.battery);

        var batteryValue = View.findDrawableById("batteryValue") as Text;
        if (getBackgroundColor() == Graphics.COLOR_BLACK) {
            batteryValue.setColor(Graphics.COLOR_WHITE);
        } else {
            batteryValue.setColor(Graphics.COLOR_BLACK);
        }
        batteryValue.setText(mSystemStats.battery.format("%.d")+"%");

        var icon = Rez.Drawables.battery1Icon;
        View.findDrawableById("batteryValue").setText("icon");

        // Call parent's onUpdate(dc) to redraw the layout
        View.onUpdate(dc);
    }

}
