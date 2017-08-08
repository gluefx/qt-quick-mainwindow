import QtQuick 2.0
//import "qrc:/Src"

Item {
    Loader {
        x: 100;
        y: 100;
        width: 200;
        height: 150;
        z: 2;
        source: "qrc:/Src/FxDockView.qml";
//        onLoaded: item.color = "red";
    }

    Loader {
        x: 350;
        y: 100;
        width: 200;
        height: 150;
        z: 2;
        source: "qrc:/Src/FxDockView.qml";
//        onLoaded: item.color = "red";
    }

}
