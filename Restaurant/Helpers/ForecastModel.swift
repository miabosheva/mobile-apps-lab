import Foundation

struct WeatherResponse: Codable {
    let latitude: Double
    let longitude: Double
    let queryCost: Int
    let tzoffset: Int
    let address: String
    let timezone: String
    let resolvedAddress: String
    let days: [WeatherDay]
    let currentConditions: CurrentConditions
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude, queryCost, tzoffset, address, timezone, resolvedAddress, days
        case currentConditions = "currentConditions"
    }
}

struct WeatherDay: Codable {
    let humidity: Double
    let precip: Double
    let temp: Double
}

struct CurrentConditions: Codable {
    let humidity: Double
    let precip: Double
    let temp: Double
}

class ForecastModel {

    static func getForecastForCoordinates(city: String) async throws -> CurrentConditions {
        
        guard let url = URL(string: "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(city)/today?unitGroup=metric&elements=temp%2Chumidity%2Cprecip&include=current&key=U6UJ4EK46R89GFMMEN2DER4FA&contentType=json") else {
            throw URLError(.badURL)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.unknown)
            }
            
            let decoder = JSONDecoder()
            let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
            return weatherResponse.currentConditions
        } catch {
            print(error)
            throw URLError(.unknown)
        }
    }
}
