//
//  WeatherManager.swift
//  Clima
//
//  Created by mac on 25/6/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
  
    let weatherURL =  "https://api.openweathermap.org/data/2.5/weather?appid=6391de9c053c1e8e3c021b6fa0d859fa&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    
    func  fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchLongAndLat(lat: Double, lon: Double) {
        let coordinateString =  "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(with: coordinateString)
    }
    
    func performRequest(with urlString: String) {
        
        //Create a URL
        if let url = URL(string: urlString) {
            
            //Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJson(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
                
            }
            
            //Start the task
            
            task.resume()
        }
    }
    
    func parseJson(_ weatherData: Data) -> WeatherModel? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            // Must add ".self" to reference data type and not the object
            let id = (decodedData.weather[0].id)
            let temp = decodedData.main.temp
            let name =  decodedData.name
            
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp )
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
