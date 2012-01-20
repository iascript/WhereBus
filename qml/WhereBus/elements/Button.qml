import QtQuick 1.0

Item {
    id: btn
    property string text: "button"
    property bool enabled: true
    signal clicked

    Rectangle{
        id: back
        anchors.fill: btn
        gradient: Gradient {
            GradientStop{
                id: gr1
                position: 0
                color: "#fdfdfd"
            }

            GradientStop{
                id: gr2
                position: 1
                color: "#eee"
            }
        }

        border.color: "#ccc"
        border.width: 2;
        smooth: true
        radius: 10

    }

    Text {
        id: title
        text: parent.text
        font.pixelSize: 25
        color: "#2F3E46"
        wrapMode: "WordWrap"
        anchors.fill: parent
        verticalAlignment: "AlignVCenter"
        horizontalAlignment: "AlignHCenter"
        style: "Raised"
        styleColor: "#ffffff"
    }

    MouseArea
    {
        id: clickArea
        anchors.fill: btn
        onClicked: { btn.clicked(); }
        enabled: btn.enabled
    }

    states: [
        State {
            name: "pressed"
            when: clickArea.pressed == true
            PropertyChanges {
                target: back
                border.color: "#808080"
            }
            PropertyChanges {
                target: gr1
                color: "#eee"
            }
            PropertyChanges {
                target: gr2
                color: "#fdfdfd"
            }
        },
        State{
            name: "disabled"
            when: !enabled
            PropertyChanges {
                target: back
                border.color: "#eee"
            }
            PropertyChanges {
                target: title
                color: "#bbb"
            }
            PropertyChanges {
                target: gr1
                color: "#f5f5f5"
            }
            PropertyChanges {
                target: gr2
                color: "#f5f5f5"
            }
        }
    ]

//    transitions: Transition {
//        from: "pressed"
//        PropertyAnimation{
//            targets: [gr1,gr2]
//            duration: 300
//            properties: "color"
//        }
//    }
}
