//
//  WeatherApp.swift
//  Weather
//
//  Created by Manny Chau on 2021-10-10.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
        }
    }
}
