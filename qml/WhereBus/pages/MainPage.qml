import QtQuick 1.0
import "../elements"

Item {
    id: page
    signal waitClicked
    signal goClicked

    Button
    {
        id: buttonWait
        y: 10
        text: "Жду на остановке"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 1.2
        height: 100
        onClicked: { page.waitClicked(); }
    }

    Button
    {
        id: buttonGo
        y: buttonWait.height + 20
        text: "Не успеваю!"
        enabled: false
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 1.2
        height: 70
        onClicked: { page.goClicked(); }
    }

//    Timer
//    {
//        interval: 1000
//        repeat: true
//        running: true
//        onTriggered: {
//            header.text = (new Date).toLocaleTimeString();
//        }
//    }
}
