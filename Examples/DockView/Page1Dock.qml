import QtQuick 2.0
//import "qrc:/Src"

Item {
    Loader {
        x: 100;
        y: 100;
//        width: 60;
//        height: 60;
        z: 2;
        source: "qrc:/Src/DockView.qml";
//        onLoaded: item.color = "red";
    }

    Loader {
        x: 350;
        y: 100;
//        width: 60;
//        height: 60;
        z: 2;
        source: "qrc:/Src/DockView.qml";
//        onLoaded: item.color = "red";
    }

}
