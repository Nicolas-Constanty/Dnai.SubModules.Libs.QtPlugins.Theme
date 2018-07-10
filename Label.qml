import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import QtQuick.Templates 2.3 as T

import Dnai.Settings 1.0

T.Label {
    id: control

    linkColor:  AppSettings.theme.colors.accent.blue

    color: AppSettings.theme["text"]["color"]
    font.family: AppSettings.theme["font"]["family"]
    font.pointSize: AppSettings.theme.font.pointSize
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    clip: true
}
