import QtQuick 1.0

Item {
    id: menuButton
    property string text: "button"
    property bool enabled: true
    signal clicked

    Rectangle{
        id: back
        anchors.fill: menuButton
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
        border.width: 1;
        smooth: true
    }

    Text {
        id: title
        text: parent.text
        font.pixelSize: 25
        color: "#2F3E46"
        wrapMode: "WordWrap"
        anchors.fill: parent
        verticalAlignment: "AlignVCenter"
        horizontalAlignment: "AlignLeft"
        style: "Raised"
        styleColor: "#ffffff"
        anchors.leftMargin: 10
    }

    MouseArea
    {
        id: clickArea
        anchors.fill: menuButton
        onClicked: { menuButton.clicked(); }
        enabled: menuButton.enabled
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
}
