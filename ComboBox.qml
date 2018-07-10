import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import QtQuick.Templates 2.3 as T

import Dnai.FontAwesome 1.0
import Dnai.Settings 1.0

T.ComboBox {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             Math.max(contentItem.implicitHeight,
                                      indicator ? indicator.implicitHeight : 0) + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    leftPadding: padding + (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: padding + (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)

    delegate: ItemDelegate {
        width: parent.width
        height: control.height
        contentItem: Label {
            rightPadding: control.spacing
            text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
            font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
            font.pointSize: AppSettings.theme.font.pointSize
            color: control.enabled ? AppSettings.theme.text.color : AppSettings.theme.text.disableColor
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
        background: Rectangle {
            color: control.highlightedIndex === index ? AppSettings.theme.colors.background.color3 : "transparent"
        }
    }

    indicator: LabelAwesomeSolid {
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        color: AppSettings.theme.text.color
        text: "\uf107"
        opacity: enabled ? 1 : 0.3
        height: control.implicitHeight
        width: control.implicitHeight
        verticalAlignment: "AlignVCenter"
        horizontalAlignment: "AlignHCenter"
        font.pointSize: 12
    }

    contentItem: T.TextField {
        leftPadding: !control.mirrored ? 12 : control.editable && activeFocus ? 3 : 1
        rightPadding: control.mirrored ? 12 : control.editable && activeFocus ? 3 : 1
        topPadding: 6 - control.padding
        bottomPadding: 6 - control.padding

        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator

        font.pointSize: AppSettings.theme.font.pointSize
        color: control.editable ? control.palette.text : AppSettings.theme.text.color
        selectionColor: control.palette.highlight
        selectedTextColor: control.palette.highlightedText
        verticalAlignment: Text.AlignVCenter

        background: Rectangle {
            visible: control.enabled && control.editable && !control.flat
            border.width: parent && parent.activeFocus ? 2 : 1
            border.color: parent && parent.activeFocus ? control.palette.highlight : control.palette.button
            color: control.palette.base
        }
    }

    background: Rectangle {
        implicitWidth: 160
        implicitHeight: 26
        radius: 3

        color: control.down ? AppSettings.theme.colors.background.light : AppSettings.theme.colors.background.base
        border.color: AppSettings.theme.border.color
        border.width: !control.editable && control.visualFocus ? 2 : AppSettings.theme.border.width
        visible: !control.flat || control.down
    }

    popup: T.Popup {
        y: control.height - 2
        width: control.width
        height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)
        topMargin: 6
        bottomMargin: 6

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0

            Rectangle {
                z: 10
                width: parent.width
                height: parent.height
                color: "transparent"
                border.color: AppSettings.theme.border.color
            }

            T.ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            border.width: AppSettings.theme.border.width
            border.color: AppSettings.theme.border.color
            color: AppSettings.theme.colors.background.base
        }
    }
}

