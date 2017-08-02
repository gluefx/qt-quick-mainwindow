import QtQuick 2.0

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
                parent = tile.Drag.target !== null ? tile.Drag.target : root;
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

        width: 100; height: 100
        x: 200; y: 200;

//        keys: [ colorKey ]
        keys: [ 'mykey' ]

        Rectangle {
            id: dropRectangle


            anchors.fill: parent
//            color: colorKey
//            color: colorKey != undefined ? colorKey:'blue'
            color: 'blue'


            states: [
                State {
                    when: dragTarget.containsDrag
                    PropertyChanges {
                        target: dropRectangle
                        color: "grey"
                    }
                }
            ]
        }
    }
}
