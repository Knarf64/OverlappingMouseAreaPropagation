import QtQuick 2.6
import QtQuick.Window 2.2

import QtTest 1.1
import "../app/"

OverlappingMouseAreasWidget {
    id: main
    property string lightblue : "#add8e6"
    property string lightyellow : "#ffffe0"

    // Description : we click on the rectangle, it ignores the click,
    // pass it through to the button underneath and this button with a MA
    // change the color of the bg.
    TestCase {
        name: "SimpleRectClickFallThrough"
        when: windowShown

        function test_clickSimpleRectFallThrough(){
//            // GIVEN
//            compare(main.bgRect.color, lightblue)

//            // WHEN
//            mouseClick(main.simpleRect)

//            // THEN
//            compare(switchColorMASpy.count, 1)
//            compare(main.bgRect.color, lightyellow)
        }
        SignalSpy {
            id: switchColorMASpy
//            target: main.switchColorMA
            signalName: "clicked"
        }
    }
}
