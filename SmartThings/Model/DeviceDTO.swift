
import Foundation


// MARK: - Device
struct DeviceDTO: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let iconURL: String
    let isOnline: Bool
    let type: Int
    let jobStatus: String
    let lastWorkTime: Int
    var fullImageURL: String = ""
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case iconURL = "icon"
        case isOnline = "isOnline"
        case type = "type"
        case jobStatus = "status"
        case lastWorkTime = "lastWorkTime"
    }
    
    func returnlastWorkTimeDate() -> Date {
        Date(timeIntervalSince1970: TimeInterval(lastWorkTime))
    }
    
    func returnJobStatus() -> String {
        switch type {
        case 1:
           return jobStatus
        case 2:
            if jobStatus == "1" {
              return "Газ не обнаружен"
            }else if jobStatus == "2" {
               return "Обнаружен газ!"
            } else {
              return jobStatus
            }
        default:
            return jobStatus
        }
    }
    
}



// MARK: - Wrapper
struct Wrapper<T: Decodable>: Decodable {
    let data: [T]
}

