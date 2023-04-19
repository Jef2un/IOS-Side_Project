//6c25bdde7076153f554f8f552e45e3f7

import Foundation
class WeatherManager:ObservableObject   {
    
    @Published var id:Int = 800
    @Published var temp: Double = 0.0
    @Published var cityName:String = "Taiwan"

    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=6c25bdde7076153f554f8f552e45e3f7&units=metric"
    
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        fetchData(urlString: urlString)
    }
    
    func fetchWeather(latitude: String, longitude: String) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        fetchData(urlString: urlString)
    }
    
    func fetchData(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.id = results.weather[0].id
                                self.temp = results.main.feels_like
                                self.cityName = results.name
                            }

                        }catch{
                            print(error)
                        }

                    }
                }
            }
            task.resume()
        }
    }
}
