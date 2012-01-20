import QtQuick 1.0
import "elements"
import "pages"

Rectangle {
    id: view
    width: 360
    height: 360
    property string listStates

    function pushState(s)
    {
        var list = listStates.split(";");
        list.push(s);
        listStates = list.join(";");
    }

    function popState()
    {
        var list = listStates.split(";");
        var result = list.pop();
        listStates = list.join(";");
        return result;
    }

    function goHome()
    {
        listStates = "";
        return "HOME";
    }

//    Keys.onBacktabPressed: { if (state !== "HOME") pages.state = popState(); }

    Item
    {
        id: pages
        width: parent.width
        anchors.top: header.bottom
        anchors.bottom: toolbar.top

        MainPage
        {
            id: mainPage
            width: pages.width
            height: pages.height
            onWaitClicked: { pages.state = "STOPLOC"; pushState("HOME"); }
        }

        ChooseStopModePage
        {
            id: chooseStopPage
            width: pages.width
            height: pages.height
            x: pages.width
            onAuto: { nearStopsPage.update(); pages.state = "NEARSTOPS"; pushState("STOPLOC"); }
        }

        NearStopsPage
        {
            id: nearStopsPage
            width: pages.width
            height: pages.height
            x: pages.width
            onLocationUpdated: { header.text = nearStopsPage.platitude.toString() + "; " + nearStopsPage.plongtitude.toString(); }
        }

        state: "HOME"

        states: [
            State {
                name: "HOME"
                PropertyChanges {target: mainPage; x: 0}
                PropertyChanges {target: chooseStopPage; x: pages.width}
                PropertyChanges {target: nearStopsPage; x: pages.width}
                PropertyChanges {target: header; text: "Добро пожаловать"}
                PropertyChanges {target: toolbar; backEnabled: false; searchEnabled: false;}
                PropertyChanges {target: searchBox; hidden: true;}
            },
            State {
                name: "STOPLOC"
                PropertyChanges {target: mainPage;x: -pages.width}
                PropertyChanges {target: chooseStopPage;x: 0}
                PropertyChanges {target: nearStopsPage; x: pages.width}
                PropertyChanges {target: header;text: "Выбор остановки"}
                PropertyChanges {target: toolbar;backEnabled: true; searchEnabled: false;}
                PropertyChanges {target: searchBox; hidden: true;}
            }
            ,
            State {
                name: "NEARSTOPS"
                PropertyChanges {target: mainPage;x: -pages.width}
                PropertyChanges {target: chooseStopPage;x: -pages.width}
                PropertyChanges {target: nearStopsPage; x: 0}
                PropertyChanges {target: header; text: "Ближайшие остановки"}
                PropertyChanges {target: toolbar; backEnabled: true; searchEnabled: true;}
            }
        ]

        transitions: [
            Transition {
                NumberAnimation { properties: "x"; duration: 350; easing.type: Easing.OutExpo }
            }
        ]
    }

    StatusBar
    {
        id: statusBar
        anchors.top: view.top
        anchors.left: view.left
        anchors.right: view.right
        height: 20
        width: parent.width
    }

    Header
    {
        id: header
        height: parent.height * 0.08
        text: "Добро пожаловать"
        anchors.top: statusBar.bottom
    }

    //search box
    Rectangle
    {
        property bool hidden: true
        id: searchBox
        height: 55
        width: view.width
        color: "#eee"

        anchors.top: toolbar.top
        anchors.bottom: undefined

        TextBox
        {
            id: searchInput
            anchors.fill: parent
            width: view.width
            anchors.margins: 5
            enabled: !searchBox.hidden
            imageSrc: "elements/images/search.png"
            showImage: true
            buttonImageSrc: "elements/images/clear.png"
            showButton: searchInput.text !== ""
            placeholderText: "Поиск"
            onButtonClicked: { searchInput.text = ""; }
            onChanged: { if (pages.state == "NEARSTOPS") nearStopsPage.filter = text; }
        }

        states: [
            State{
                name: "VISIBLE"
                when: !searchBox.hidden
                AnchorChanges{
                    target: searchBox
                    anchors.bottom: toolbar.top
                    anchors.top: undefined
                }

            }
        ]

        transitions: [
            Transition {
                AnchorAnimation { targets: searchBox; duration: 300; easing.type: Easing.OutExpo }
            }
        ]
    }

    Toolbar
    {
        id: toolbar
        width: view.width
        height: 50
        anchors.bottom: parent.bottom
        onBack: { pages.state = popState(); }
        onSearch: { searchBox.hidden = !searchBox.hidden }
    }


    Item {
        id: menuBack
        Rectangle
        {
            id: blackRect
            color: "#000"
            opacity: 0.1
            anchors.fill: parent
        }
        anchors.fill: view

        MouseArea
        {
            anchors.fill: parent
            onClicked: toolbar.hideMenu()
        }

        visible: toolbar.menuToggled
    }

    ContextMenu
    {
        id: contextMenu
        anchors.bottom: toolbar.top
        anchors.right: view.right
        width: view.width * 0.7
        height: view.height * 0.5
        visible: toolbar.menuToggled
        onExitClicked: {Qt.quit();}
    }


}
