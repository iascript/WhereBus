import QtQuick 1.0

Item {
    property string mode: "clock"
    property alias active: timer.running
    property date toTime: new Date
    property date now: new Date
    property string nowStr: ""
    property bool shortFormat: true
    property bool showSec: true
    property alias fontPixelSize: clock.font.pixelSize
    property alias color: clock.color
    property alias verticalAlignment: clock.verticalAlignment
    property alias horizontalAlignment: clock.horizontalAlignment

    function msecsToDate(msecs)
    {
        var sub = Math.abs(msecs);
        var dat = new Date(sub + (new Date(sub)).getTimezoneOffset()*60000);
        return dat;
    }

    function toStringWidth(number, swidth)
    {
        var result = number.toString();

        if (swidth)
            while (result.length < swidth)
                result = "0" + result;

        return result;
    }

    function timeChanged()
    {
        now = new Date;

        var clkmode = (mode == "clock");

        //nowStr = now.toLocaleTimeString();

        var sign = "";
        if(!clkmode && toTime < now)
            sign = "-";

        var span = clkmode ? now : msecsToDate(toTime.getTime() - now.getTime());
        var h = span.getHours();
        var m = span.getMinutes();
        var s = span.getSeconds();

        if (shortFormat)
        {
            nowStr = sign + ((h !== 0) ? h.toString() + ":" : "") +
                    toStringWidth(m, h !== 0 ? 2 : 1) + (showSec ? (":" + toStringWidth(s, 2)) : "");
        } else
        {
            nowStr = sign + h.toString() + ":" +
                    toStringWidth(m, 2) + (showSec ? (":" + toStringWidth(s, 2)) : "");
        }

    }

    Text{
        id: clock
        text: nowStr

        font.pixelSize: parent.height / 2
        color: "#555"
        anchors.fill: parent
        verticalAlignment: "AlignVCenter"
        horizontalAlignment: "AlignHCenter"
    }

    Timer{
        id: timer
        interval: 1000
        repeat: true
        onTriggered: { timeChanged(); }
    }
}
