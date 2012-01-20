import QtQuick 1.0

Item {
    id: busStop
    property string title: "Bus stop"
    property bool enabled: true
    property int distance: 0

    signal clicked

    function distanceToStr(dist)
    {
        if (dist < 1000)
            return dist.toString() + "м";
        else
            return (dist/1000).toFixed(1) + "км";
    }

//    Rectangle{
//        id: back
//        anchors.fill: parent
//        gradient: Gradient {
//            GradientStop{
//                id: gr1
//                position: 0
//                color: "#fdfdfd"
//            }

//            GradientStop{
//                id: gr2
//                position: 1
//                color: "#eee"
//            }
//        }

//        border.color: "#ccc"
//        border.width: 2;
//        smooth: true
//        radius: 10

//    }

    Rectangle
    {
        id: back
        anchors.fill: parent
        color: "#fff"
        border.color: "#ccc"
    }

    Image
    {
        id: icon
        source: "images/flag.png"
        anchors.top: parent.top
        anchors.topMargin: 7
        anchors.left: parent.left
        anchors.leftMargin: 7
    }

    Text {
        id: name
        text: parent.title
        font.pixelSize: 25
        color: "#2F3E46"
        wrapMode: "NoWrap"
        style: "Raised"
        styleColor: "#ffffff"
        elide: "ElideRight"

        anchors.top: parent.top
        anchors.topMargin: 7
        anchors.left: icon.right
        anchors.leftMargin: 5
        anchors.right: dist.left
    }

    Text {
        id: dist
        text: distanceToStr(parent.distance)
        font.pixelSize: 18
        color: "#1137a2"
        style: "Raised"
        styleColor: "#ffffff"

        anchors.top: parent.top
        anchors.topMargin: 7
        anchors.right: parent.right
        anchors.rightMargin: 5
    }

//    MouseArea
//    {
//        id: clickArea
//        anchors.fill: btn
//        onClicked: { btn.clicked(); }
//        enabled: btn.enabled
//    }

//    states: [
//        State {
//            name: "pressed"
//            when: clickArea.pressed == true
//            PropertyChanges {
//                target: back
//                border.color: "#808080"
//            }
//            PropertyChanges {
//                target: gr1
//                color: "#eee"
//            }
//            PropertyChanges {
//                target: gr2
//                color: "#fdfdfd"
//            }
//        },
//        State{
//            name: "disabled"
//            when: !enabled
//            PropertyChanges {
//                target: back
//                border.color: "#eee"
//            }
//            PropertyChanges {
//                target: title
//                color: "#bbb"
//            }
//            PropertyChanges {
//                target: gr1
//                color: "#f5f5f5"
//            }
//            PropertyChanges {
//                target: gr2
//                color: "#f5f5f5"
//            }
//        }
//    ]
}
