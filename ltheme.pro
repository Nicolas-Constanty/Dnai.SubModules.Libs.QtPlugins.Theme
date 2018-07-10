TEMPLATE = lib
CONFIG += plugin
QT += qml
QT += quick
CONFIG += c++11

TARGET  = dnaithemeplugin

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

pluginfiles.files += \
    ComboBox.qml \
    Button.qml \
    TextField.qml \
    Label.qml \
    AwesomeIcon.qml \
    CheckBox.qml

isEmpty(PROJECT_ROOT_DIRECTORY){
  PROJECT_ROOT_DIRECTORY = $$[QT_INSTALL_QML]
}

# message($${PROJECT_ROOT_DIRECTORY})

target.path += $${PROJECT_ROOT_DIRECTORY}/Dnai/Theme
pluginfiles.path += $${PROJECT_ROOT_DIRECTORY}/Dnai/Theme

qmldirsrc.path =  $${PROJECT_ROOT_DIRECTORY}/Dnai/Theme
qmldirsrc.files += \
    qmldir \
    plugins.qmltypes


INSTALLS += target pluginfiles qmldirsrc

CONFIG += install_ok

DISTFILES += \
    ComboBox.qml \
    qmldir \
    CheckBox.qml \
    Button.qml \
    TextField.qml \
    Label.qml \
    AwesomeIcon.qml

HEADERS += \
    dnaitheme_plugin.h

SOURCES += \
    dnaitheme_plugin.cpp
