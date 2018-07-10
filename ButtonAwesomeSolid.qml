import QtQuick 2.0
import QtQuick.Controls 2.2

import Dnai.FontAwesome 1.0

import "./" as D

D.Button {
    id: _control
    property alias label: _label
    property alias color: _label.color
    padding: 0
    contentItem: LabelAwesomeSolid {
        id: _label
        text: _control.text
        height: _control.height
        width: _control.width
        horizontalAlignment: "AlignHCenter"
        verticalAlignment: "AlignVCenter"
    }
}
