import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    TabView {
          id: frame
          anchors.fill: parent
          anchors.margins: 4
          Tab { title: "Tab 1"; Text{text:"Tab 1"} }
          Tab { title: "Tab 2 fdasfasdfasdfaswdf"; Text{text:"Tab 2"} }
          Tab { title: "Tab 3"; Text{text:"Tab 3"} }

          style: TabViewStyle {
              frameOverlap: 1
              tab: Rectangle {
                  color: styleData.selected ? "steelblue" :"lightsteelblue"
                  border.color:  "red"  //"steelblue"
                  implicitWidth: Math.max(text.width + 4, 80)
                  implicitHeight: 20
                  radius: 2
                  Text {
                      id: text
                      anchors.centerIn: parent
                      text: styleData.title
                      color: styleData.selected ? "white" : "black"
                  }
                  Rectangle {
                      id: closeButton
                      visible: styleData.hovered
                      anchors.top: parent.top
                      anchors.right: parent.right
                      anchors.bottom: parent.bottom

                      anchors.topMargin: 2
                      anchors.rightMargin: 2
                      anchors.bottomMargin: 2
                      width: 16
                      color: "red"
                      Text {
                          text: "X"
                          anchors.centerIn: parent
                          color: "white"
                      }

                      MouseArea {
                          anchors.fill: parent
                          onClicked: {
                              console.log("close: " + styleData.index);
                              control.removeTab(styleData.index);
                          }
                      }
                  }
              }
              tabBar: Rectangle {
                  color: "gray"
                  Component {
                      id: newTabContent
                      Text {
                          text: "xxx"
                      }
                  }

                  MouseArea {
                      anchors.fill: parent
                      onDoubleClicked: {
                          console.log("tabBar::onDoubleClicked");
                          control.addTab("Tab xx", newTabContent);
                          control.currentIndex = control.count - 1;
                      }
                  }
              }

              frame: Rectangle { color: "steelblue" }

              tabsMovable: true
          }
      }

//    SwipeView {
//        id: swipeView
//        anchors.fill: parent
//        currentIndex: tabBar.currentIndex

//        Page1 {
//        }

//        Page {
//            Label {
//                text: qsTr("Second page")
//                anchors.centerIn: parent
//            }
//        }
//    }

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
