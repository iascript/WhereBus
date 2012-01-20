import QtQuick 1.0

Item {
    id: textBox

    property alias showButton: buttonImg.visible
    property alias showImage: leftImg.visible
    property alias buttonImageSrc: buttonImg.source
    property alias imageSrc: leftImg.source
    property alias placeholderText: placeholder.text

    property alias text: input.text
    signal changed
    signal buttonClicked

    Rectangle
    {
        id: background
        color: "white"
        border.color: "#ccc"
        border.width: 2
        smooth: true
        radius: textBox.height / 2

        anchors.fill: textBox

        states: State{
            name: "ACTIVE"
            when: input.activeFocus
            PropertyChanges {
                target: background
                border.color: "#0F7FDC"
            }
        }

        transitions: Transition{
            ColorAnimation{
                target: background
                property: "border.color"
                duration: 200
                easing.type: "InCirc"
            }
        }
    }

    Image {
        id: leftImg
        anchors.left: background.left
        anchors.verticalCenter: background.verticalCenter
        anchors.leftMargin: background.radius - sourceSize.width/2
        opacity: 0.3
    }

    Image {
        id: buttonImg
        anchors.right: background.right
        anchors.verticalCenter: background.verticalCenter
        anchors.rightMargin: background.radius - sourceSize.width/2
        opacity: 0.3
        states: State{
            name: "PRESSED"
            when: buttonArea.pressed
            PropertyChanges {
                target: buttonImg
                opacity: 0.6
            }
        }

    }

    Text{
        id:placeholder
        text:placeholderText
        color: "#ccc"
        font.pixelSize: input.font.pixelSize
        anchors.fill: input
        visible: input.text == "" && !input.activeFocus
    }

    TextInput{
        id: input
        anchors.verticalCenter: background.verticalCenter
        font.pixelSize: background.height * 0.6
        //anchors.verticalCenterOffset: -font.pixelSize * 0.10
        anchors.left: background.left
        anchors.right: background.right
        anchors.leftMargin: 10
        anchors.rightMargin: ( buttonImg.visible && buttonImg.source !== "" ) ?  background.radius * 2 : 10

        states: [
            State {
                when:  leftImg.visible && leftImg.source !== ""
                PropertyChanges {
                    target: input
                    anchors.leftMargin: background.radius * 2
                }
            }
        ]

        onTextChanged: { textBox.changed(); }
    }

    MouseArea
    {
        id: buttonArea
        enabled: showButton
        anchors.fill: buttonImg
        onClicked: { textBox.buttonClicked(); }
    }

}
