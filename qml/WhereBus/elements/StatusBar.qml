import QtQuick 1.0
import QtMobility.systeminfo 1.2

Item {
    id: statusBar
    property bool active: true

    Rectangle
    {
        anchors.fill: parent
        color: "#000"
    }

    BatteryInfo
    {
        onBatteryStatusChanged: { console.log("bat stat") }
    }

    Clock
    {
        id: clock
        active: statusBar.active
        mode: "clock"
        showSec: false
        shortFormat: true
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 40
        fontPixelSize: 15
        color: "#fff"
        horizontalAlignment: Text.AlignRight
    }

    Image {
        id: battery
        source: "images/status/battery_med.png"
        anchors.right: clock.left
        anchors.verticalCenter: parent.verticalCenter
    }
}
