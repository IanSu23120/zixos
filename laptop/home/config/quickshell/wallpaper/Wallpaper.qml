import Quickshell
import QtQuick

Item {
    z: 1
PanelWindow {
    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    aboveWindows: false
    focusable: false
    exclusionMode: ExclusionMode.Ignore

    Rectangle {
        anchors.fill: parent

        Image {
            anchors.fill: parent
            source: "file:///home/iansu/zixos/wallpapers/lucy.jpg"
            fillMode: Image.PreserveAspectCrop
        }
    }
}
}
