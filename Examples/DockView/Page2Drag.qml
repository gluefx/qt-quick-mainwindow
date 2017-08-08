import QtQuick 2.8

  Item {
      width: 200; height: 200

      Rectangle {
          anchors.centerIn: parent
          width: text.implicitWidth + 20; height: text.implicitHeight + 10
          color: "green"
          radius: 5

          Drag.active: dragArea.drag.active
          Drag.dragType: Drag.Automatic
          Drag.supportedActions: Qt.CopyAction
          Drag.mimeData: {
              "text/plain": "Copied text"
          }

          Text {
              id: text
              anchors.centerIn: parent
              text: "Drag me"
          }

          MouseArea {
              id: dragArea
              anchors.fill: parent

              drag.target: parent
              onPressed: parent.grabToImage(function(result) {
                  parent.Drag.imageSource = result.url
              })
          }
      }
  }
