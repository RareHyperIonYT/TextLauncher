import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    property alias cfg_appCommand: appCommandField.text
    property alias cfg_buttonText: buttonTextField.text

    Kirigami.FormLayout {
        QQC2.TextField {
            id: buttonTextField
            Kirigami.FormData.label: "Button Text:"
            placeholderText: "Enter display text"
        }

        QQC2.TextField {
            id: appCommandField
            Kirigami.FormData.label: "Application Command:"
            placeholderText: "e.g., firefox, kate, dolphin"
        }
    }
}
