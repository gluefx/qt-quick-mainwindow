/*
    拖动一个元素到Tab，新建Tab页。
    存在问题：
        1. addTab 只能通过Component，所以肯定是一个新的窗口，如果想要保存、恢复之前的窗口状态，就需要开发自己的机制。考虑实现自己的 TabView
        2. DnD 各种事件还需要在深入了解一下
*/

import QtQuick 2.0
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
                    console.log(tile.Drag.target);
                    var dTarget = tile.Drag.target;


                    console.log('--- children of drag target');
                    for(var i = 0; i < dTarget.children.length; ++i) {
                        console.log(i + ', ' + dTarget.children[i]);
                        console.log(i + ', ' + dTarget.children[i].type);
                        console.log(i + ', ' + dTarget.children[i].id);
                    }
                    console.log('--- end children of drag target');

                    var foundTavView = dTarget.children[0]; // tabView

                    // 这个返回 Object，不是Component
//                    var newObject = Qt.createQmlObject('import QtQuick 2.0; Rectangle {color: "yellow"; width: 20; height: 20}', tabView, "Yellow Tab");

                    var yellowTab = Qt.createComponent("Page2Rect.qml")
                    foundTavView.addTab("Yellow", yellowTab);
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

        width: 400; height: 200
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

        onEntered: {
            console.log('<<< onEntered');
            console.log(drag);
            console.log(drag.source);
        }

        TabView {
            id: "tabView"
            anchors.fill: parent

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
