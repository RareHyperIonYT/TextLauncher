import QtQuick
import QtQuick.Layouts
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.kirigami as Kirigami
import org.kde.plasma.plasma5support as Plasma5Support

PlasmoidItem {
    id: root

    property string appCommand: plasmoid.configuration.appCommand
    property string buttonText: plasmoid.configuration.buttonText
    property string fontFamily: plasmoid.configuration.fontFamily
    property int fontSize: plasmoid.configuration.fontSize
    property bool fontBold: plasmoid.configuration.fontBold
    property bool fontItalic: plasmoid.configuration.fontItalic
    property color textColor: plasmoid.configuration.textColor
    property color backgroundColor: plasmoid.configuration.backgroundColor

    Plasmoid.backgroundHints: PlasmaCore.Types.DefaultBackground | PlasmaCore.Types.ConfigurableBackground

    preferredRepresentation: fullRepresentation

    Plasma5Support.DataSource {
        id: executable
        engine: "executable"
        connectedSources: []
        onNewData: disconnectSource(sourceName)
    }

    fullRepresentation: Item {
        Layout.preferredWidth: buttonText.length > 0 ? textMetrics.width + 32 : 100
        Layout.preferredHeight: fontSize + 24
        Layout.minimumWidth: 50
        Layout.minimumHeight: 30

        TextMetrics {
            id: textMetrics
            font.family: fontFamily
            font.pixelSize: fontSize
            font.bold: fontBold
            font.italic: fontItalic
            text: buttonText
        }

        Rectangle {
            anchors.fill: parent
            color: backgroundColor
            radius: 4
            border.color: mouseArea.containsMouse ? Kirigami.Theme.highlightColor : Qt.darker(backgroundColor, 1.2)
            border.width: 2

            Behavior on border.color {
                ColorAnimation { duration: 150 }
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    if (appCommand.length > 0) {
                        executable.connectSource(appCommand)
                    }
                }

                Rectangle {
                    anchors.fill: parent
                    color: Kirigami.Theme.highlightColor
                    opacity: parent.pressed ? 0.3 : parent.containsMouse ? 0.1 : 0
                    radius: 4

                    Behavior on opacity {
                        NumberAnimation { duration: 150 }
                    }
                }
            }

            Text {
                anchors.centerIn: parent
                text: buttonText.length > 0 ? buttonText : "Click to Configure"
                font.family: fontFamily
                font.pixelSize: fontSize
                font.bold: fontBold
                font.italic: fontItalic
                color: buttonText.length > 0 ? textColor : Kirigami.Theme.disabledTextColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
