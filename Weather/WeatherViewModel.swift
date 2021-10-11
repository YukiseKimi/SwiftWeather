//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Manny Chau on 2021-10-11.
//

import Foundation

private let defaultIcon = "⁇"

private let iconMap = [
    "Drizzle" : "☔️",
    "Rain" : "🌧",
    "Thunderstorm" : "⛈",
    "Snow" : "🌨",
    "Clear" : "☀️",
    "Clouds" : "⛅️",
]

public class WeatherViewModel: ObservableObject {
    @Published var cityname: String = "city name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService: WeatherService

    public init(weatherService: WeatherService){
        self.weatherService = weatherService
    }
    
    public func  refresh() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityname = weather.city
                self.temperature = "\(weather.temperature)°C"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}
