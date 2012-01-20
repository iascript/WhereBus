import QtQuick 1.0
import ListProxy 1.0
//import Location 1.0
import QtMobility.location 1.1
import "../elements"


Item {

    property string filter: ""

    property real platitude
    property real plongtitude
    signal locationUpdated()

    function update()
    {
//        location.getMyPosition();
    }

//    Coordinate
//    {
//        id: coord
//        a
//    }

//    LocationService
//    {
//        id: location
//        onPositionUpdated: { platitude = latitude; plongtitude = longtitude; locationUpdated(); }
//    }

    ListProxyModel{
        id: proxy
    }

//    ListModel
//    {
//        id: listModel

//        ListElement{
//            name: "Академическая"
//            dist: 340
//        }

//        ListElement{
//            name: "Якуба Колоса"
//            dist: 823
//        }

//        ListElement{
//            name: "ст.м.Уручье"
//            dist: 3280
//        }

//        ListElement{
//            name: "Пашино"
//            dist: 5080
//        }

//        ListElement{
//            name: "Какашино"
//            dist: 7980
//        }

//        ListElement{
//            name: "Старые пипирки"
//            dist: 10239
//        }

//        ListElement{
//            name: "Пашино"
//            dist: 5080
//        }

//        ListElement{
//            name: "Какашино"
//            dist: 7980
//        }

//        ListElement{
//            name: "Старые пипирки"
//            dist: 10239
//        }
//    }

    Component
    {
        id: stopDelegate

        Item {
            width: listView.width
            height: visible ? 85 : 0
            visible: filter == "" || name.indexOf(filter) !== -1

            SingleStop
            {
                title: name
                distance: dist
                anchors.fill: parent
                anchors.bottomMargin: 0
            }
        }
    }

    ListView{
        id: listView
        model: proxy
        delegate: stopDelegate
        anchors.margins: 0
        anchors.fill: parent

        VerticalScrollBar {list: listView; thickness: 6}
    }

    Text {
        id: name
        text: "Получение координат"
        anchors.centerIn: parent
        visible: false;

//        states: [
//            State {
//                when: false//location.updating
//                PropertyChanges {
//                    target: name
//                    visible: true
//                }
//            }
//        ]
    }

}
