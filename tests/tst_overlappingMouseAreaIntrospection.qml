import QtQuick 2.6
import QtQuick.Window 2.2

import QtTest 1.1
import "../app/"

// check integrity of component with introspection

OverlappingMouseAreasWidget {
    id: main

    property string lightblue : "#add8e6"
    property string lightyellow : "#ffffe0"

    // Description : we click on the rectangle, it ignores the click,
    // pass it through to the button underneath and this button with a MA
    // change the color of the bg.
    TestCaseIntrospection {
        id: tc
        name: "SimpleRectClickFallThroughIntrospection"
        when: windowShown

//        property QtObject simpleRect: findChild(main, "simpleRectangle")
//        property QtObject backgroundRect: findChild(main, "bg")
        property QtObject switchColorMA: findChild(main, "switchColorMA")


        function test_initTestCase(){
            var simpleRect = tc.findChild(main, "simpleRectangle")
            var backgroundRect = tc.findChild(main, "bg")

            console.log("backgroundRect: " + backgroundRect.color)
        }

        function test_clickSimpleRectFallThrough(){

//            var simpleRect = findChild(main, "simpleRectangle")
//            var backgroundRect = findChild(main, "bg")
////            var switchColorMA = findChild(main, "switchColorMA")


//            // GIVEN
//            compare(backgroundRect.color, lightblue)

//            // WHEN
//            mouseClick(simpleRect)

//            // THEN
//            compare(switchColorMASpy.count, 1)
//            compare(backgroundRect.color, lightyellow)
        }
        SignalSpy {
            id: switchColorMASpy
//            target: tc.switchColorMA
            signalName: "clicked"
        }
    }
}
