import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

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
                id: action
                color: "gray"
                anchors.left: parent.left
                anchors.right: parent.right
                height: buttonHeight * 5
                anchors.margins: 10
                Text  {
                    text: "Switch color Button"
                    anchors.top: parent.top
                    anchors.topMargin: parent.height / 4
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 20
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:  {
                        root.colorIndex = (root.colorIndex + 1) %2
                        bg.color = root.colorTab[root.colorIndex]
                    }
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
                anchors.centerIn: parent

                Rectangle {
                    width: buttonWidth*0.6
                    height: buttonHeight
                    color: "orange"
                    Text {
                        id: simpleRectangle
                        text: "Simple \n Rectangle"
                        anchors.centerIn: parent
                    }
                }

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
                        anchors.fill: parent
                        onClicked: {
                            popup.colorIndex = (popup.colorIndex + 1) % 2
                            popupColorWitness.color = popup.colorTab[popup.colorIndex]
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
                        onPressed: {
                            popup.colorIndex = (popup.colorIndex + 1) % 2
                            popupColorWitness.color = popup.colorTab[popup.colorIndex]
                        }
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
                        onPressed: {
                            mouse.accepted = false
                        }
                    }
                }

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
                            mouse.accepted = false
                        }
                    }
                }
            } // end of row

            Item {
                anchors.top: firstRow.bottom
                anchors.topMargin: 6
                anchors.horizontalCenter: parent.horizontalCenter
                width: buttonWidth*3
                height: buttonHeight*1.8

                Rectangle {
                    anchors.centerIn: parent
                    width: buttonWidth*1.2
                    height: buttonHeight
                    color: "purple"
                    Text { text: "MA Click Blue"; anchors.centerIn: parent }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: popupColorWitness.color = "blue"
                    }
                }

                Rectangle {
                    width: buttonWidth*1.2
                    height: buttonHeight*1.3
                    anchors.left: parent.left
                    color: "lightgreen"
                    Text { text: "MA Click Red \n propagate true"; anchors.centerIn: parent }
                    MouseArea {
                        propagateComposedEvents: true
                        anchors.fill: parent
                        onClicked:{
                            popupColorWitness.color = "red"
                            mouse.accepted = false
                        }
                    }
                }

                Rectangle {
                    width: buttonWidth*1.2
                    height: buttonHeight*1.3
                    anchors.right: parent.right
                    color: "lightgreen"
                    Text { text: "MA Click Red \n propagate false"; anchors.centerIn: parent }
                    MouseArea {
                        propagateComposedEvents: false
                        anchors.fill: parent
                        onClicked:{
                            popupColorWitness.color = "red"
                            mouse.accepted = false
                        }
                    }
                }
            }
            Rectangle {
                id: popupColorWitness
                width: buttonWidth
                height: buttonHeight
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                Text {
                    anchors.centerIn: parent
                    text: "Close Popup"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: popup.visible = false
                    }
                }
            }
        }
    }
}
