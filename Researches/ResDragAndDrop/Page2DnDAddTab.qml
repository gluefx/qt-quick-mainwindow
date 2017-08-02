import QtQuick 2.0
//import QtQuick.Controls 2.0

import QtQuick.Controls 1.4

Item {
    Item {
        id: root
        z: 200
//        property string colorKey

        width: 64; height: 64
        x: 100;
        y: 100;

        MouseArea {
            id: mouseArea

            width: 64; height: 64
            anchors.centerIn: parent

            drag.target: tile

            onReleased: {
                if (tile.Drag.target !== null) {
                    parent = tile.Drag.target;

//                    var newObject = Qt.createQmlObject('import QtQuick 2.0; Rectangle {color: "yellow"; width: 20; height: 20}', tabView, "Yellow Tab");
                    var yellowTab = Qt.createComponent("Page2Rect.qml")
                    tabView.addTab("Yellow", yellowTab);
                } else {
                    parent = root;
                }

//                parent = tile.Drag.target !== null ? tile.Drag.target : root;
//                tile.Drag.target.colorKey = 'yellow';


            }

            Rectangle {
                id: tile


                width: 64; height: 64
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

//                color: colorKey
//                color: 'red'
                color: mouseArea.pressed? 'green' : 'red'

//                Drag.keys: [ colorKey ]
                Drag.keys: [ 'mykey' ]
                Drag.active: mouseArea.drag.active
                Drag.hotSpot.x: 32
                Drag.hotSpot.y: 32

                Text {
                    anchors.fill: parent
                    color: "white"
                    font.pixelSize: 12
//                    text: modelData + 1
                    text: 'Drag Me'
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                states: State {
                    when: mouseArea.drag.active
                    ParentChange { target: tile; parent: root }
                    AnchorChanges { target: tile; anchors.verticalCenter: undefined; anchors.horizontalCenter: undefined }
//                    PropertyChanges {
//                        target: tile;
//                        color: 'green';
//                    }
                }

            }
        }
    } // end Drag Item


    DropArea {
        id: dragTarget
        z: 100

        property string colorKey;
//        property alias dropProxy: dragTarget

        width: 300; height: 200
        x: 200; y: 200;

//        keys: [ colorKey ]
        keys: [ 'mykey' ]

//        Rectangle {
//            id: dropRectangle


//            anchors.fill: parent
////            color: colorKey
////            color: colorKey != undefined ? colorKey:'blue'
//            color: 'blue'


//            states: [
//                State {
//                    when: dragTarget.containsDrag
//                    PropertyChanges {
//                        target: dropRectangle
//                        color: "grey"
//                    }
//                }
//            ]
//        }
        TabView {
            id: "tabView"
            Tab {
                title: "Red"
                Rectangle {
                    id: "redRect"
                    width: 300; height: 200
                    color: "red"
                    border.color: "black"
                    border.width: 5
                    states: [
                        State {
                            when: dragTarget.containsDrag
                            PropertyChanges {
                                target: redRect
                                color: "grey"
                            }
                        }
                    ]
                }
            }
            Tab {
                title: "Blue"
                Rectangle {
                    width: 300; height: 200
                    color: "blue"
                }
            }
            Tab {
                title: "Green"
                Rectangle {
                    width: 300; height: 200
                    color: "green"
                }
            }
        }
    } // end DropArea




}
