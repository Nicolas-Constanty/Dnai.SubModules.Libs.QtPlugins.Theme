import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import QtQuick.Templates 2.3 as T

import Dnai.Settings 1.0

T.TextField {
    id: control

    property string selectColor: AppSettings.theme["editableText"]["color"]["border"]["select"]
    property string deselectColor: AppSettings.theme["editableText"]["color"]["border"]["deselect"]
    property string selectColorBackground: AppSettings.theme["editableText"]["color"]["background"]["select"]
    property string deselectColorBackground: AppSettings.theme["editableText"]["color"]["background"]["deselect"]
    property string errorText: ""
    property bool enableBar: true

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            placeholderText ? placeholder.implicitWidth + leftPadding + rightPadding : 0)
                            || contentWidth + leftPadding + rightPadding
    implicitHeight: Math.max(contentHeight + topPadding + bottomPadding,
                             background ? background.implicitHeight : 0,
                             placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 6

    selectionColor: control.palette.highlight
    selectedTextColor: control.palette.highlightedText

    font.family: AppSettings.theme["font"]["family"]
    font.pointSize: AppSettings.theme["font"]["pointSize"]
    horizontalAlignment: Qt.AlignHCenter
    verticalAlignment: Qt.AlignVCenter
    color: AppSettings.theme["text"]["color"]
    selectByMouse: true
//    clip: true
    leftPadding: 5
    rightPadding: 5


    onFocusChanged: {
        if (!focus && errorId.text) {
            errorText = ""
        }
    }

    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font.italic: true
        opacity: 0.5
        color: AppSettings.theme.text.disableColor
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 26
        color: control.focus == true ? selectColorBackground : deselectColorBackground
        Rectangle {
            id: editableRectId
            anchors.top: parent.bottom
            anchors.topMargin: -3
            anchors.left: parent.left
            anchors.right: parent.right
            height: 3
            visible: enableBar
            color:  (errorId.text) ? AppSettings.theme["text"]["errorColor"] : control.focus == true ? selectColor : deselectColor
        }
    }

    Label {
        id: errorId
        text: errorText
        font.pointSize: 8
        anchors.top: parent.bottom
        anchors.topMargin: 2
        anchors.rightMargin: 5
        anchors.right: parent.right
        color: AppSettings.theme["text"]["errorColor"]
        z: parent.z + 1
    }
}
