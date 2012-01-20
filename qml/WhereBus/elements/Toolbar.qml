import QtQuick 1.0

Item {
    id: toolbar

    property alias backEnabled: toolBack.enabled
    property bool menuEnabled: true
    property bool menuToggled: false
    property bool showClock: true
    property alias searchEnabled: toolSearch.enabled

    signal back
    signal menu
    signal search

    function hideMenu()
    {
        toolMenu.toggled = false;
        menuToggled = false;
    }

    Rectangle
    {
        anchors.fill: toolbar
        color: "#eee"
    }

    ToolButton
    {
        id: toolBack
        anchors.left: toolbar.left
        height: toolbar.height
        width: toolbar.width / 5
        img: "images/back_32x32.png"
        onClicked: { toolbar.back(); }
    }

    ToolButton
    {
        id: toolSearch
        anchors.left: toolBack.right
        height: toolbar.height
        width: toolbar.width / 5
        img: "images/search.png"
        onClicked: { toolbar.search(); }
    }

    ToolButton{
        id: toolMenu
        enabled: menuEnabled
        trigger: true
        anchors.right: toolbar.right
        width: toolbar.width / 5
        height: toolbar.height
        img: "images/options_32x32.png"
        onClicked: {
            toolbar.menuToggled = toolMenu.toggled;
            toolbar.menu();
        }
    }

//    Clock{
//        mode: "clock"
//        visible: showClock
//        active: showClock
//        anchors.left: toolSearch.right
//        anchors.right: toolMenu.left
//        height: toolbar.height
//    }
}
