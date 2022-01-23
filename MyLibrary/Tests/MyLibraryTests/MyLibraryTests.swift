import XCTest
import MyLibrary

final class MyLibraryTests: XCTestCase {

    func testIsLuckyBecauseWeAlreadyHaveLuckyNumber() throws {
        // Given
        let mockWeatherService = MockWeatherService(
            shouldSucceed: true,
            shouldReturnTemperatureWithAnEight: false
        )

        let myLibrary = MyLibrary(weatherService: mockWeatherService)
        let number = 0
        let expectation = XCTestExpectation(description: "We asked about the number \(number) and heard back 🎄")
        var isLuckyNumber: Bool?

        print("1")

        // When
        myLibrary.isLucky(number, completion: { lucky in
            print("2")
            isLuckyNumber = lucky
            expectation.fulfill()
        })

        print("3")
        wait(for: [expectation], timeout: 5)

        print("4")

        // Then (number of 0 and temperature of 39 --> expect false)
        XCTAssertNotNil(isLuckyNumber)
        XCTAssert(isLuckyNumber == false)
    }

    func testIntegrationLocalhostWeatherService() throws {
        /*
         Narrow integration test that connects to mock weather service running on localhost
         */
        // Given
        // use the WeatherServiceImpl class (instead of mocked class) which calls a server to query mock data
        let myLibrary = MyLibrary()
        let number = 0
        let expectation = XCTestExpectation(description: "We asked about the number \(number) and heard back 🎄")
        var isLuckyNumber: Bool?
        print("1")

        // When
        myLibrary.isLucky(number, completion: { lucky in
            print("2")
            isLuckyNumber = lucky
            expectation.fulfill()
        })

        print("3")
        wait(for: [expectation], timeout: 5)

        print("4")

        // Then
        XCTAssertNotNil(isLuckyNumber)
        XCTAssert(isLuckyNumber == false)
    }

/*
    func testIsLuckyBecauseWeatherHasAnEight() throws {
        // Given
        let mockWeatherService = MockWeatherService(
            shouldSucceed: true,
            shouldReturnTemperatureWithAnEight: true
        )

        let myLibrary = MyLibrary(weatherService: mockWeatherService)
        let number = 0
        let expectation = XCTestExpectation(description: "We asked about the number 8 and heard back 🎄")
        var isLuckyNumber: Bool?

        // When
        myLibrary.isLucky(number, completion: { lucky in
            isLuckyNumber = lucky
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 5)

        // Then
        XCTAssertNotNil(isLuckyNumber)
        XCTAssert(isLuckyNumber == true)
    }

    func testIsNotLucky() throws {
        // Given
        let mockWeatherService = MockWeatherService(
            shouldSucceed: true,
            shouldReturnTemperatureWithAnEight: false
        )

        let myLibrary = MyLibrary(weatherService: mockWeatherService)
        let number = 7
        let expectation = XCTestExpectation(description: "We asked about the number 7 and heard back 🌲")
        var isLuckyNumber: Bool?

        // When
        myLibrary.isLucky(number, completion: { lucky in
            isLuckyNumber = lucky
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 5)

        // Then
        XCTAssertNotNil(isLuckyNumber)
        XCTAssert(isLuckyNumber == false)
    }

    func testIsNotLuckyBecauseServiceCallFails() throws {
        // Given
        let mockWeatherService = MockWeatherService(
            shouldSucceed: false,
            shouldReturnTemperatureWithAnEight: false
        )

        let myLibrary = MyLibrary(weatherService: mockWeatherService)
        let number = 7
        let expectation = XCTestExpectation(description: "We asked about the number 7 but the service call failed 🤖💩")
        var isLuckyNumber: Bool?

        // When
        myLibrary.isLucky(number, completion: { lucky in
            isLuckyNumber = lucky
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 5)

        // Then
        XCTAssertNil(isLuckyNumber)
    }
*/
}
