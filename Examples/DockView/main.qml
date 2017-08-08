import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

//import QtQuick 2.2
//import QtQuick.Window 2.1
//import QtQuick.Controls 1.2
//import QtQuick.Controls.Styles 1.2
//import QtQuick.Layouts 1.1
//import QtQuick.Dialogs 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

//    menuBar: MenuBar {
//              Menu { MenuItem {text: "Cut"
//                      shortcut: "Ctrl+X"
//                      onTriggered: {}} }
//              Menu { MenuItem {text: "Cut"
//                      shortcut: "Ctrl+X"
//                      onTriggered: {}} }
//          }

    SwipeView {
        id: swipeView

        visible: false
        anchors.fill: parent
//        currentIndex: tabBar.currentIndex
        currentIndex: 1

//        Page1 {
//        }

        Page {
            Page1Dock {}
        }

        Page {
            Label {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }
        }
    }

    TabView {
        anchors.fill: parent
          Tab {
              title: "Red"
              Page1Dock {}
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

//    footer: TabBar {
//        id: tabBar
//        currentIndex: swipeView.currentIndex
//        TabButton {
//            text: qsTr("First")
//        }
//        TabButton {
//            text: qsTr("Second")
//        }
//    }
}
