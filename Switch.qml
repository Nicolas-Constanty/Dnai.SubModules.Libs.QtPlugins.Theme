import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3

import Dnai.Settings 1.0

T.Switch {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             Math.max(contentItem.implicitHeight,
                                      indicator ? indicator.implicitHeight : 0) + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 6
    spacing: 6

    indicator: Rectangle {
        implicitWidth: 60
        implicitHeight: 26

        x: text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        radius: 13
        color: control.checked ? AppSettings.theme.colors.background.color1 : AppSettings.theme.colors.background.color2
        border.color: AppSettings.theme.colors.background.color1
        border.width: control.visualFocus ? 2 : 1

        Rectangle {
            x: control.checked ? parent.width - width : 0
            width: 26
            height: 26
            radius: 13
            color: AppSettings.theme.colors.background.color2
            border.width: control.visualFocus ? 2 : 1
            border.color: AppSettings.theme.colors.background.color1

            Behavior on x {
                enabled: !control.down
                SmoothedAnimation { velocity: 200 }
            }

        }
        Behavior on color {
            enabled: !control.down
            ColorAnimation { duration: 200 }
        }
    }

    contentItem: CheckLabel {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: control.palette.windowText
    }
}
