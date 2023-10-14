//
//  LasagnaMaster.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 12/10/23.
//

import XCTest

//In this exercise you're going to write some more code to help you cook your brilliant lasagna from your favorite cooking book.
//
//You have five tasks, all related to the time spent cooking the lasagna.

class LasagnaMaster {
    //Task 1
    //You want to write an improved remainingMinutesInOven function that takes the number of elapsed minutes the lasagna has been in the oven as a parameter and returns how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task. Previously, you had relied on a constant value, expectedMinutesInOven that came from outside the remainingMinutesInOven function. That was both a bit too cluttered for your taste and not flexible enough, as it doesn't allow you to change the expected time in the oven.

    //To clean things up, define the remainingMinutesInOven function that takes the number of elapsed minutes the lasagna has been in the oven as a parameter, as well as an expectedMinutesInOven parameter that has a default value of 40. Your function should return how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task.
    // TODO: define the 'remainingMinutesInOven' function
    func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
        expectedMinutesInOven - elapsedMinutes
    }

    //Task 2
    //You had previously written a preparationTimeInMinutes function that takes the number of layers you added to the lasagna as a parameter and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare. However, you are not particularly happy with this function, as you have to count the number of layers in your lasagna yourself before you can call this function, and who has time for all that?

    //To make things easier for yourself, write a function, preparationTimeInMinutes that takes a variadic String parameter, layers, where you list the different layers in your lasagna. The function will then count the number of layers in your lasagna, and return the amount of preparation time required.
    // TODO: define the 'preparationTimeInMinutes' function
    func preparationTimeInMinutes(layers: String...) -> Int {
        var numberLayers = 0
        for _ in layers {
            numberLayers += 1
        }
        return numberLayers * 2
    }

    //Task 3
    //Before you start to assemble your lasagna, you want to make sure you have enough sauce and noodles to build the lasagna of your dreams. For each noodle layer in your lasagna, you will need 3 noodles. For each sauce layer in your lasagna, you will need 0.2 liters of sauce.

   // Define the function quantities that takes a variadic String parameter, layers, where you list the different layers in your lasagna. The function will then determine the quantity of noodles and sauce needed to make your meal. The result should be returned in a tuple of type (noodles: Int, sauce: Double).
    // TODO: define the 'quantities' function
    func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
        var noodlesVar = 0
        var sauceVar = 0.0
        for layer in layers {
            if layer == "noodles" {
                noodlesVar += 1
            } else if layer == "sauce" {
                sauceVar += 1
            }
        }
        noodlesVar *= 3
        sauceVar *= 0.2

        return (noodles: noodlesVar, sauce: sauceVar)
    }

    //Task 4
    //Unfortunately, the sauce you have on hand has the volume is listed in fluid ounces instead of liters. To help let you know if you have enough sauce on hand, write a function, toOz, that takes an in-out tuple parameter, (noodles: Int, sauce: Double), and converts the quantity of sauce to fluid ounces. Note that there are 33.814 fluid ounces per liter.
    // TODO: define the 'toOz' function

    //Task 5
    //Finally, you want to know what kind of wine to serve with your lasagna. You've heard that you should serve white wine if there is more mozzarella, ricotta, and béchamel in the lasagna than there is meat and sauce, and red wine otherwise. Write a function redWine that takes a variadic String parameter, layers, where you list the different layers in your lasagna. The function will use five nested functions to determine the number of layers of mozzarella, ricotta, béchamel, sauce, and meat in the lasagna, and compare the numbers of layers to determine if red wine should be served, returning true if so and false if not.
    // TODO: define the 'redWine' function

}

class LasagnaMasterTest: XCTestCase {
    let lasagnaMasterClass = LasagnaMaster()
    //Task 1 Tests
    func testRemainingMinutesInOvenDefaultMinutes() {
        let input = 30
        let outputExpected = 10
        let output = lasagnaMasterClass.remainingMinutesInOven(elapsedMinutes: input)
        XCTAssertEqual(output, outputExpected)
    }

    func testRemainingMinutesInOvenUsingOtherParameter() {
        let inputElapse = 30
        let inputExpected = 75
        let outputExpected = 45
        let output = lasagnaMasterClass.remainingMinutesInOven(elapsedMinutes: inputElapse, expectedMinutesInOven: inputExpected)
        XCTAssertEqual(output, outputExpected)
    }
    func testRemainingMinutesInOvenOtherParameterZero() {
        let inputElapse = 30
        let inputExpected = 0
        let outputExpected = -30
        let output = lasagnaMasterClass.remainingMinutesInOven(elapsedMinutes: inputElapse, expectedMinutesInOven: inputExpected)
        XCTAssertEqual(output, outputExpected)
    }
    func testRemainingMinutesInOvenFirstParameterZero() {
        let inputElapse = 0
        let inputExpected = 50
        let outputExpected = 50
        let output = lasagnaMasterClass.remainingMinutesInOven(elapsedMinutes: inputElapse, expectedMinutesInOven: inputExpected)
        XCTAssertEqual(output, outputExpected)
    }

    //Task 2 Tests
    func testPreparationTimeInMinutes() {
        XCTAssertEqual(lasagnaMasterClass.preparationTimeInMinutes(layers: "sauce", "noodles"), 4)
    }
    func testPreparationTimeInMinutesALotOfLayers() {
        XCTAssertEqual(lasagnaMasterClass.preparationTimeInMinutes(layers: "sauce", "noodles", "sauce", "meat", "mozzarella", "noodles", "sauce", "eggplant", "béchamel", "noodles", "sauce", "mozzarella"), 24)
    }

    //Task 3 Tests
    func testQuantitiesAFewIngredients() {
        let output = lasagnaMasterClass.quantities(layers: "sauce", "noodles")
        let outputExpected = (noodles: 3, sauce: 0.2)
        XCTAssertTrue(output.noodles == outputExpected.noodles && output.sauce == outputExpected.sauce)
    }
    func testQuantitiesMoreIngredientes() {
        let output = lasagnaMasterClass.quantities(layers: "sauce", "noodles", "sauce", "meat", "mozzarella", "noodles", "sauce", "eggplant", "béchamel", "noodles", "sauce", "mozzarella")
        let outputExpected = (noodles: 9, sauce: 0.8)
        XCTAssertTrue(output.noodles == outputExpected.noodles && output.sauce == outputExpected.sauce)
    }

    //Task 4 Tests

    //Task 5 Tests

}
