public class MyLibrary {
    private let weatherService: WeatherService

    /// The class's initializer.
    ///
    /// Whenever we call the `MyLibrary()` constructor to instantiate a `MyLibrary` instance,
    /// the runtime then calls this initializer.  The constructor returns after the initializer returns.
    public init(weatherService: WeatherService? = nil) {
        self.weatherService = weatherService ?? WeatherServiceImpl()
    }

    public func isLucky(_ number: Int, completion: @escaping (Bool?) -> Void) {
        // Check the simple case first: 3, 5 and 8 are automatically lucky.
        print("Enter isLucky")
        if number == 3 || number == 5 || number == 8 {
            print("Pre-Completion-1")
            completion(true)
            print("Post-Completion-1")
            return
        }

        // Fetch the current weather from the backend.
        // If the current temperature, in Farenheit, contains an 8, then that's lucky.
        weatherService.getTemperature { response in
            print("Response ", response)
            switch response {
            case let .failure(error):
                print("Error")
                print(error)
                completion(nil)

            case let .success(temperature):
                print("Success")
                if self.contains(temperature, "8") {
                    completion(true)
                    print("Post-Completion-2")
                } else {
                    let isLuckyNumber = self.contains(temperature, "8")
                    completion(isLuckyNumber)
                    print("Post-Completion-3")
                }
            }
        }

        print("End isLucky")
    }

    /// Sample usage:
    ///   `contains(558, "8")` would return `true` because 588 contains 8.
    ///   `contains(557, "8")` would return `false` because 577 does not contain 8.
    private func contains(_ lhs: Int, _ rhs: Character) -> Bool {
        return String(lhs).contains(rhs)
    }
}
