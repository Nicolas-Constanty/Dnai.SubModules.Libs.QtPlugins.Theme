pragma Singleton

import QtQuick 2.0

import Dnai.Settings 1.0

Item {
    property AppSettings settings: AppSettings
    SettingParameters {
        id: _settingsParameters
        themePaths: [
            ":/default.json",
        ]
    }

    Component.onCompleted: {
        AppSettings.parameters = _settingsParameters
        //Load theme 1
        AppSettings.currentTheme = AppSettings.themeNames[0]
    }
}
