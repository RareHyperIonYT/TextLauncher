import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import QtQuick.Dialogs
import org.kde.kirigami as Kirigami
import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    property alias cfg_fontFamily: fontComboBox.currentText
    property alias cfg_fontSize: fontSizeSpinBox.value
    property alias cfg_fontBold: boldCheckBox.checked
    property alias cfg_fontItalic: italicCheckBox.checked
    property string cfg_textColor
    property string cfg_backgroundColor

    Kirigami.FormLayout {
        QQC2.ComboBox {
            id: fontComboBox
            Kirigami.FormData.label: "Font Family:"
            model: Qt.fontFamilies()
            editable: true

            Component.onCompleted: {
                currentIndex = find(cfg_fontFamily)
            }
        }

        Item {
            Kirigami.FormData.isSection: true
        }

        RowLayout {
            Kirigami.FormData.label: "Text Color:"

            Rectangle {
                Layout.fillWidth: true
                height: 25
                color: cfg_textColor
                border.color: Kirigami.Theme.textColor
                border.width: 1
                radius: 3

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: textColorDialog.open()
                }
            }
        }

        Item {
            Kirigami.FormData.isSection: true
        }

        RowLayout {
            Kirigami.FormData.label: "Background Color:"

            Rectangle {
                Layout.fillWidth: true
                height: 25
                color: cfg_backgroundColor
                border.color: Kirigami.Theme.textColor
                border.width: 1
                radius: 3

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: bgColorDialog.open()
                }
            }
        }

        Item {
            Kirigami.FormData.isSection: true
        }

        RowLayout {
            Kirigami.FormData.label: "Font Style:"

            QQC2.SpinBox {
                id: fontSizeSpinBox
                Kirigami.FormData.label: "Font Size:"
                from: 8
                to: 72
                value: 14
            }

            QQC2.CheckBox {
                id: boldCheckBox
                text: "Bold"
            }

            QQC2.CheckBox {
                id: italicCheckBox
                text: "Italic"
            }
        }

    }

    ColorDialog {
        id: textColorDialog
        title: "Choose Text Color"
        onAccepted: cfg_textColor = selectedColor
    }

    ColorDialog {
        id: bgColorDialog
        title: "Choose Background Color"
        options: ColorDialog.ShowAlphaChannel
        onAccepted: cfg_backgroundColor = selectedColor
    }
}
