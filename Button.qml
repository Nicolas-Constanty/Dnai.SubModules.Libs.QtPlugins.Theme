import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import QtQuick.Templates 2.3 as T

import Dnai.Settings 1.0
import Dnai.FontAwesome 1.0

import "./" as D


T.Button {
    id: control
    property alias awesomeIcon: _awesomeIcon

    AwesomeIcon {
        id: _awesomeIcon
        color: "white"
        size: 10
        text: ""
    }

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 6
    leftPadding: padding + 2
    rightPadding: padding + 2
//    spacing: 6

    contentItem: Item {
        clip: true
        LayoutMirroring.enabled: true
        width: Math.max(childrenRect.width, ico.text && !_label.text ? ico.width : control.implicitWidth - control.leftPadding - control.rightPadding)
        height: Math.max(childrenRect.height, control.implicitHeight, ico.text && !_label.text ? ico.height : control.implicitHeight - control.topPadding - control.bottomPadding)

        LabelAwesomeSolid {
            id: ico
            padding: 0
            text: awesomeIcon.text
            color: awesomeIcon.color
            font.pointSize: awesomeIcon.size
            verticalAlignment: "AlignVCenter"
            Component.onCompleted: {
                if (_label.height > height)
                {
                    height = _label.height
                    y = _label.y
                }
            }

            x: (control.mirrored ? _label.text && control.text ? Math.max(_label.width + ico.width + control.leftPadding + control.rightPadding, ico.text && !_label.text ? ico.width : control.implicitWidth - control.leftPadding - control.rightPadding) / 2 + _label.width :  - (ico.width / 2 + control.leftPadding) : 0)
        }
        D.Label {
            padding: 0
            x: (!control.mirrored ? ico.text && control.text ? Math.max(_label.width + ico.width + control.leftPadding + control.rightPadding, !_label.text ? ico.width : control.implicitWidth - control.leftPadding - control.rightPadding) / 2 - (_label.width / 2 + control.leftPadding) + ico.width : control.width / 2 - (_label.width / 2 + control.leftPadding) : 0)
            id: _label
            text: control.text
            color: control.checked || control.highlighted ? control.palette.brightText :
                   control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : AppSettings.theme.text.color
            y: control.height / 2 - height / 2 - control.baselineOffset
        }
        onHeightChanged: {
            if (ico.text)
                control.height = height + control.topPadding + control.bottomPadding
        }
        onWidthChanged: {
            if (ico.text)
                control.width = width + control.leftPadding + control.rightPadding
        }
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 26
        radius: 2
        visible: !control.flat || control.down || control.checked || control.highlighted
        color: Color.blend(control.checked || control.highlighted ? AppSettings.theme.colors.background.dark : AppSettings.theme.colors.background.base,
                                                                    AppSettings.theme.colors.background.light, control.down ? 0.5 : 0.0)
        border.color: AppSettings.theme.border.color
        border.width: control.visualFocus ? 2 : 1
    }
}
