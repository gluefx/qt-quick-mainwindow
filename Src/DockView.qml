import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    width: 200
    height: 150

    property string backgroundColor : "#262626";
    property string borderColor : "#399aca";
    Rectangle {
        id: titleBar

        anchors.top: parent.top
        anchors.left: parent.left
//        anchors.right: parent.right

        width: 100
        height: 25

        z: 200

        color: backgroundColor
        border.width: 2
//        border.color: "#399aca"
        border.color: borderColor

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
