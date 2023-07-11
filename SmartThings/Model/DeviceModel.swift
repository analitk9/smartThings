

import Foundation



struct DeviceModel: Identifiable {
    let id: Int
    let name: String
    let iconURL: String
    let isOnline: StatusDevice
    let type: DeviceType
    let jobStatus: String
    let lastWorkTime: Date
    
    init(dto: DeviceDTO) {
        id = dto.id
        name = dto.name
        iconURL = dto.iconURL
        isOnline = dto.isOnline == true ? .online : .offline
        type = .init(rawValue: dto.type) ?? .unknownType
        lastWorkTime = Date(timeIntervalSince1970: TimeInterval(dto.lastWorkTime))
        switch type {
        case .unknownType:
            jobStatus = dto.jobStatus
        case .robotVacuum:
            jobStatus = dto.jobStatus
        case .gasВetector:
            if dto.jobStatus == "1" {
                jobStatus = "ГАЗ НЕ ОБНАРУЖЕН"
            }else if dto.jobStatus == "2" {
                jobStatus = "ОБНАРУЖЕНА УТЕЧКА"
            }else {
                jobStatus = dto.jobStatus
            }
        }
        
     
    }
    

}
