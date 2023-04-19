import Foundation

struct Results:Decodable{
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Weather:Decodable{
    let id: Int
    
}
struct Main:Decodable{
    let temp: Double
    let feels_like: Double
    
}
