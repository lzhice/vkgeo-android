import QtQuick 2.12

import "../../Util.js" as UtilScript

Rectangle {
    id:      toast
    color:   backgroundColor
    radius:  UtilScript.dp(UIHelper.screenDpi, 8)
    visible: false

    property string text:           ""

    property color textColor:       "white"
    property color backgroundColor: "steelblue"

    onVisibleChanged: {
        if (visible) {
            toastAnimation.start();
        }
    }

    Text {
        anchors.fill:        parent
        anchors.margins:     UtilScript.dp(UIHelper.screenDpi, 2)
        text:                toast.text
        color:               toast.textColor
        font.pixelSize:      UtilScript.dp(UIHelper.screenDpi, 16)
        font.family:         "Helvetica"
        font.bold:           true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment:   Text.AlignVCenter
        wrapMode:            Text.Wrap
        fontSizeMode:        Text.Fit
        minimumPixelSize:    UtilScript.dp(UIHelper.screenDpi, 8)
    }

    MultiPointTouchArea {
        anchors.fill: parent
    }

    SequentialAnimation {
        id: toastAnimation

        NumberAnimation {
            target:   toast
            property: "opacity"
            from:     0.0
            to:       1.0
            duration: 250
        }

        PauseAnimation {
            duration: 1000
        }

        NumberAnimation {
            target:   toast
            property: "opacity"
            from:     1.0
            to:       0.0
            duration: 250
        }

        ScriptAction {
            script: {
                toast.visible = false;
            }
        }
    }
}
