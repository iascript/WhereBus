import QtQuick 1.0
import "../elements"

Item {
    signal auto
    signal byway
    signal byname

    Button
    {
        id: buttonAuto
        text: "Автоматически"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 1.2
        height: 70
        onClicked: { auto(); }
    }

    Button
    {
        id: buttonByWay
        text: "По маршруту"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: buttonAuto.bottom
        anchors.topMargin: 10
        width: parent.width / 1.2
        height: 70
        onClicked: { byway(); }
    }

    Button
    {
        id: buttonByName
        text: "По названию"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: buttonByWay.bottom
        anchors.topMargin: 10
        width: parent.width / 1.2
        height: 70
        onClicked: { byname(); }
    }
}
