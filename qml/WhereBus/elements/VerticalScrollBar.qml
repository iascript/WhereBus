import QtQuick 1.0

Item {
    property ListView list: undefined
    property alias thickness: scrollRect.width

    id: scrollBar

    anchors.fill: parent

    Rectangle
    {
        id: scrollRect
        color: "#000"
        opacity: 0
        width: 4
        radius: width / 2
        height: list.visibleArea.heightRatio * list.height - 2
        anchors.right: scrollBar.right
        anchors.rightMargin: 1
        anchors.top: scrollBar.top
        anchors.topMargin: list.visibleArea.yPosition * list.height + 1

        states: State{
            name: "VISIBLE"
            when: list.moving && list.visibleArea.heightRatio < 1.0
            PropertyChanges {
                target: scrollRect
                opacity: 0.5
            }
        }

        transitions: [
            Transition {
                from: "VISIBLE"
                NumberAnimation{
                    properties: "opacity"; duration: 1000; easing.type: "InCirc";
                }
            }
        ]
    }
}
