import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    id: root

    anchors.fill: parent

    property string backgroundColor : "#262626";
    property string borderColor : "#399aca";
    property string titleBarBackgroundColor :"#1A191A"

    Drag.imageSource: ":/images/cursor.png"

    DropArea {
        id: dropArea

//        property bool name: value
        property string dragPosition: ""


        anchors.fill: parent
        z: 400

        onEntered: {
//            drag.accepted = true;
            console.log("<<< onEntered");
            console.log("onEntered, source - ", drag.source);
            console.log("onEntered, source - ", drag.source);
            console.log("onEntered, formats - ", drag.formats, " action - ", drag.action);
            console.log("onEntered, name - ", drag.getDataAsString("name"));

            console.log("size: " + root.width + ", " + root.height);

        }

        onPositionChanged: {
//            console.log("onPositionChanged: " + drag.x + ", " + drag.y);

            var dragX = drag.x;
            var dragY = drag.y;
            var rootWidth = root.width;
            var rootHeight = root.height;

            if (dragX > rootWidth / 3.0 && dragX < rootWidth * 2.0 / 3.0 &
                dragY > rootHeight / 3.0 && dragY < rootHeight * 2.0 / 3.0    ) {
                console.log("center");
            }
        }

        onDropped: {
            console.log(">>> onDropped");
        }

        onExited: {
            console.log(">>> onExited");
        }

        Rectangle {
            z: 500
            anchors.fill: parent


            color: Qt.rgba(1, 1, 1, 0.2)
            visible: parent.containsDrag
//            visible: false
        }

        Canvas {
              id: mycanvas
              z: 600
              width: 20
              height: 20
              onPaint: {
                  var ctx = getContext("2d");
                  ctx.fillStyle = Qt.rgba(1, 0, 0, 0.1);
                  ctx.fillRect(0, 0, width, height);
              }
          }
    }

    Rectangle {
        id: titleBar

        anchors.top: parent.top
        anchors.left: parent.left
//        anchors.right: parent.right

        width: 80
        height: 25

        z: 300

        color: backgroundColor
        border.width: 2
//        border.color: "#399aca"
        border.color: borderColor

//        Drag.imageSource: ":/images/cursor.png"
        Drag.active: dragArea.drag.active
        Drag.dragType: Drag.Automatic
        Drag.supportedActions: Qt.CopyAction
        Drag.mimeData: {
            "text/plain": "Copied text",
            "name": "Test View"
        }

        MouseArea {
            id: dragArea
            anchors.fill: parent

            drag.target: parent
            onPressed: parent.grabToImage(function(result) {
              parent.Drag.imageSource = result.url
            })
        }

        Text {
            text: "My Panel"
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            color: "#dcdcdc"

            font.family: "Arial"
            font.pointSize: 10
            font.bold: true
        }

        Rectangle {
            id: titleBarBorderMask

            color: backgroundColor
            anchors.top: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            anchors.topMargin: -2
            anchors.leftMargin: 2
            anchors.rightMargin: 2

            height: 2
        }
    }

    Rectangle {
        id: titleBarBackground

        z: 50
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        height: 25

        color: titleBarBackgroundColor
    }

    Rectangle {
        id: content

        anchors.top: titleBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.topMargin: -2

        z: 100

        color: backgroundColor
        border.width: 2
        border.color: borderColor
    }

//    SplitView {
//        id: splitView
//          anchors.fill: parent
//          orientation: Qt.Horizontal

//          Rectangle {
//              width: 200
////              Layout.maximumWidth: 400
//              color: "lightblue"
//              Text {
//                  text: "View 1"
//                  anchors.centerIn: parent
//              }
//          }
//          Rectangle {
//              id: centerItem
////              Layout.minimumWidth: 50
////              Layout.fillWidth: true
//              color: "lightgray"
//              Text {
//                  text: "View 2"
//                  anchors.centerIn: parent
//              }
//          }
//          Rectangle {
//              width: 200
//              color: "lightgreen"
//              Text {
//                  text: "View 3"
//                  anchors.centerIn: parent
//              }
//          }
//      }

    Component.onCompleted: {
//        console.log("---- splitview ----");
//        console.log(splitView);
    }
}
