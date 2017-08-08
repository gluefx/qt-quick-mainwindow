import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
        }
    }

    TextEdit {
        id: textEdit
        text: qsTr("Enter some text...")
        verticalAlignment: Text.AlignVCenter
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        Rectangle {
            anchors.fill: parent
            anchors.margins: -10
            color: "transparent"
            border.width: 1
        }
    }

    FxSplitView {
        visible: true
          anchors.fill: parent
          anchors.topMargin: 100
          orientation: Qt.Horizontal

          Rectangle {
              width: 200
              Layout.maximumWidth: 400
              color: "lightblue"
              Text {
                  text: "View 1"
                  anchors.centerIn: parent
              }
          }
          Rectangle {
              id: centerItem
              Layout.minimumWidth: 50
              Layout.fillWidth: true
              color: "lightgray"
              Text {
                  text: "View 2"
                  anchors.centerIn: parent
              }
          }
          Rectangle {
              width: 200
              color: "lightgreen"
              Text {
                  text: "View 3"
                  anchors.centerIn: parent
              }
          }
      }

    FxTabView {
        visible: false
          Tab {
              title: "Red"
              Rectangle { color: "red" }
          }
          Tab {
              title: "Blue"
              Rectangle { color: "blue" }
          }
          Tab {
              title: "Green"
              Rectangle { color: "green" }
          }
      }
}
