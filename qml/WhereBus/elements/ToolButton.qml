import QtQuick 1.0

Item {
    id: toolbutton
    property string img: ""
    property bool enabled: true
    property bool toggled: false
    property bool trigger: false

    signal clicked

    Rectangle{
        id: back
        visible: false
        color: "#aaa"
        anchors.fill: parent
        anchors.margins: 5
        radius: back.height/2
        states: [
            State {
                name: "PRESSED"
                when: clickArea.pressed || (toolbutton.trigger && toolbutton.toggled)
                PropertyChanges {
                    target: back
                    visible: true
                }
            }
        ]
    }

    Image{
        id: icon
        source: toolbutton.img
        anchors.centerIn: toolbutton
        opacity: 1
        states: [
            State {
                name: "DISABLED"
                when: !toolbutton.enabled
                PropertyChanges {
                    target: icon
                    opacity: 0.3
                }
            }
        ]
    }

    MouseArea{
        id: clickArea
        enabled: toolbutton.enabled
        anchors.fill: toolbutton

        onClicked: {
            if (toolbutton.trigger)
                toolbutton.toggled = !toolbutton.toggled;
            toolbutton.clicked();
        }
    }
}
