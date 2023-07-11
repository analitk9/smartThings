

import Foundation
import SwiftUI

enum ModelState {
    case isLoad
    case loaded
    case wrong
    
}

class DevicesDataModel: ObservableObject {
    @Published var devices: [DeviceDTO] = []
    @Published var modelState: ModelState = .loaded
    let emptyDevices: [UIImage] = {
        return [0...9].map { _ in
            UIImage(named: "listPlaceholder")!
        }
    }()
    
    private var request: APIRequest<DevicesResource>?
    
    func fetchDevices() {    
        let resource = DevicesResource()
        let request = APIRequest(resource: resource)
        self.request = request
        request.execute { [weak self] devices in
            guard let strongSelf = self else { return }
            guard let devices = devices, !devices.isEmpty else {
                strongSelf.devices = []
                strongSelf.modelState = .wrong
                return
            }
            strongSelf.devices = devices
            strongSelf.modelState = .loaded
        }
    }
    
    func asyncAfterFetch() {
        self.modelState = .isLoad
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: { [weak self] in
           
            self?.fetchDevices()
        })
    }
}
