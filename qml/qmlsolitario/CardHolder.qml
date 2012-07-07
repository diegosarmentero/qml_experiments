// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: cardHolder
    width: 70
    height: 100

    Rectangle {
        id: border
        color: "transparent"
        border.color: "white"
        anchors.fill: parent
    }

    Rectangle {
        id: glow
        border.color: "white"
        anchors.fill: parent

        anchors.margins: 5
        opacity: 0
        radius: 5
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#00000000"
            }

            GradientStop {
                position: 1
                color: "#80ffffff"
            }
        }

        MouseArea {
            id: mousearea
            hoverEnabled: true
            anchors.fill: parent
            onEntered: {
                glow.state = 'down'
            }
            onExited: {
                glow.state = ''
            }
        }

        states: State {
            name: "down"; //when: mousearea
            PropertyChanges { target: glow; y: 160; rotation: 180; color: "red" }
        }

        transitions: Transition {
            from: ""; to: "down"; reversible: true
            ParallelAnimation {
                NumberAnimation { properties: "y,rotation"; duration: 500; easing.type: Easing.InOutQuad }
                ColorAnimation { duration: 500 }
            }
        }


        /*transformOrigin: Item.Center
        ParallelAnimation {
            id: glowAnimation
            PropertyAnimation {
                target: glow
                property: "scale"
                from: 1
                to: 1.2
                duration: 120
            }
            PropertyAnimation {
                target: glow
                property: "opacity"
                from: 0.5
                to: 1
                duration: 120
            }
        }*/
    }

}
