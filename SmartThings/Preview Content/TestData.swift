

import Foundation

struct TestData {
	static var Devices: [DeviceDTO] = {
		let url = Bundle.main.url(forResource: "Devices", withExtension: "json")!
		let data = try! Data(contentsOf: url)
		let wrapper = try! JSONDecoder().decode(Wrapper<DeviceDTO>.self, from: data)
        return wrapper.data
	}()
}
