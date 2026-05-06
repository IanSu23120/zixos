import Quickshell
import Quickshell.Io
import QtQuick

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 25

    Text {
        id: clock
        anchors.centerIn: parent

        Process {
            command: ["date"]
            running: true
            stdout: StdioCollector {
                onStreamFinished: clock.text = this.text
            }
        }
    }
}