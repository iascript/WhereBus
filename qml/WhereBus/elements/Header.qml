import QtQuick 1.0

Item {
    property string text: "title"
    width: parent.width

    Rectangle {
        color: "#06004f"
        anchors.fill: parent
        gradient: Gradient{
            GradientStop{
                color: "#9AD945"
                position: 0
            }

            GradientStop{
                color: "#7EB238"
                position: 1
            }
        }
    }

    Text {
        id: title
        color: "#ffffff"
        text: parent.text
        elide: "ElideRight"
        font.pixelSize: height / 2;
        style: "Raised"
        styleColor: "#000"
        smooth: true
        anchors.fill: parent
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
    }
}
