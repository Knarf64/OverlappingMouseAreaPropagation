import QtQuick 2.6
import QtQuick.Window 2.2

Item {
    id: root
    visible: true
    width: 640
    height: 480

    // testing purpuse
//    property Rectangle bgRect: bg
//    property Rectangle simpleRect: simpleRectangle
//    property MouseArea switchColorMA: switchColorMA

    property int buttonWidth: 150
    property int buttonHeight: 60

    property int colorIndex: 0
    property var colorTab: ["lightblue", "lightyellow"]

    Rectangle {
        id: bg
        anchors.fill: parent
        color: "lightblue"

        Column {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            height: childrenRect.height
            spacing: 10

            Rectangle {
                id: switchColorRectangle
                color: "gray"
                anchors.left: parent.left
                anchors.right: parent.right
                height: buttonHeight * 5
                anchors.margins: 10

                Text  {
                    id: switchColorText
                    text: "Switch color Button"
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 20
                }
                MouseArea {
                    id: switchColorMA
                    anchors.fill: parent
                    onClicked: {
                        root.colorIndex = (root.colorIndex + 1) %2
                        bg.color = root.colorTab[root.colorIndex]
                    }
                    onPressed: switchColorText.font.bold = !switchColorText.font.bold
                }
            }
            Rectangle {
                id: popupButton
                color: "gray"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                height: buttonHeight
                visible: !popup.visible

                Text  {
                    text: "open popup"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: popup.visible = true
                }
            }
        }

        Rectangle {
            id: popup
            visible: false
            opacity: 0.6
            anchors.fill: parent
            anchors.margins: 20
            property int colorIndex: 0
            property var colorTab: ["red", "blue"]

            Text {
                id: popupTitle
                text: "Popup"
                font.pixelSize: 32
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row {
                id: firstRow
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.height/4

                Rectangle {
                    id: simpleRectangle
                    width: buttonWidth*0.6
                    height: buttonHeight
                    color: "orange"
                    Text {
                        id: simpleRectangleText
                        text: "Simple \n Rectangle"
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    width: buttonWidth*0.6
                    height: buttonHeight
                    color: "orange"
                    Text {
                        id: emptyMA
                        text: "MouseArea \n Empty"
                        anchors.centerIn: parent
                    }
                    MouseArea { anchors.fill: parent }
                }



            } // end of row

            Row {
                id: secondRow
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: firstRow.bottom
                anchors.topMargin: 20

                Rectangle {
                    width: buttonWidth*0.6
                    height: buttonHeight
                    color: "orange"
                    Text {
                        id: colorChanger
                        text: "MA Click \n ChgColor"
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        property int colorIndex: 0
                        property var colorTab: ["orange", "yellow"]
                        anchors.fill: parent
                        onClicked: {
                            colorIndex = (colorIndex + 1) % 2
                            parent.color = colorTab[colorIndex]
                        }
                    }
                }

                Rectangle {
                    width: buttonWidth*0.6
                    height: buttonHeight
                    color: "orange"
                    Text {
                        id: maPressedColor
                        text: "MA Pressed \n ChgColor"
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        property int colorIndex: 0
                        property var colorTab: ["orange", "yellow"]
                        onPressed: {
                            colorIndex = (colorIndex + 1) % 2
                            parent.color = colorTab[colorIndex]
                        }
                    }
                }
            }
            Row {
                id: thirdRow
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: secondRow.bottom
                anchors.topMargin: 20

                Rectangle {
                    width: buttonWidth*0.6
                    height: buttonHeight
                    color: "orange"
                    Text {
                        text: "MA press \n through"
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            mouse.accepted = false //pressed should go through
                        }
                        // what about click ?
                        // answer : go through as well since Pressed (first step of click is going through)
                    }
                }

                Rectangle {
                    width: buttonWidth*0.6
                    height: buttonHeight
                    color: "orange"
                    Text {
                        text: "MA click \n through"
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        propagateComposedEvents: true // mandatory to let the click go through
                        onClicked: {
                            mouse.accepted = false
                        }
                    }
                }
            }
            Rectangle {
                id: popupColorWitness
                width: buttonWidth
                height: buttonHeight
                color: "green"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                Text {
                    anchors.centerIn: parent
                    text: "Close Popup"

                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: popup.visible = false
                }
            }
        }
    }
}
