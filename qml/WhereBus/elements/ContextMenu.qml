import QtQuick 1.0

Item {
    id: context
    property int count: 5
    signal exitClicked
    signal settingsClicked
    signal aboutClicked

    MenuButton{
        id: settings

        text: "Настройки"

        height: context.height / context.count
        width: context.width
        anchors.bottom: about.top
        anchors.bottomMargin: -1
        onClicked: { context.settingsClicked(); }
    }

    MenuButton{
        id: about

        text: "О программе.."

        height: context.height / context.count
        width: context.width
        anchors.bottom: exit.top
        anchors.bottomMargin: -1
        onClicked: { context.aboutClicked(); }
    }

    MenuButton{
        id: exit

        text: "Выход"

        height: context.height / context.count
        width: context.width
        anchors.bottom: context.bottom
        onClicked: { context.exitClicked(); }
    }
}
