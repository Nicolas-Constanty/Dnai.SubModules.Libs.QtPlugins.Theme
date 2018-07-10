import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3

import Dnai.FontAwesome 1.0
import Dnai.Settings 1.0

import "./" as D

T.CheckBox {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             Math.max(contentItem.implicitHeight,
                                      indicator ? indicator.implicitHeight : 0) + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

//    padding: 6
    spacing: 10

    // keep in sync with CheckDelegate.qml (shared CheckIndicator.qml was removed for performance reasons)
    indicator: Rectangle {
        implicitWidth: 18
        implicitHeight: 18
        radius: 2

        x: text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        color: control.down || control.checked ? AppSettings.theme.colors.accent.green : AppSettings.theme.colors.background.base
        border.width: control.checked ? 0 : control.visualFocus ? 3 : 2
        border.color: control.visualFocus ? control.palette.highlight : control.palette.mid

        LabelAwesomeSolid {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            color: AppSettings.theme.colors.background.base
            font.pointSize: parent.implicitWidth / 2
            visible: control.checkState === Qt.Checked
            text: "\uf00c"
            anchors.centerIn: parent
        }

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 16
            height: 3
            color: control.palette.text
            visible: control.checkState === Qt.PartiallyChecked
        }
    }

    contentItem: D.Label {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
//        font: control.font
        font.pointSize: AppSettings.theme.font.pointSize
        color: AppSettings.theme.text.color
    }
}
