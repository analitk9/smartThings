//
//  JobImageView.swift
//  SmartThings
//
//  Created by Denis Evdokimov on 7/9/23.
//

import SwiftUI

struct JobImageView: View {
    let device: DeviceDTO

    var body: some View {
        if device.type == 1 {
            Image("rocket")
        } else {
            if device.jobStatus == "2" {
                Image(systemName: "exclamationmark.triangle")
            } else {
                Image(systemName: "nosign")
            }
        }
    }
}

struct JobImageView_Previews: PreviewProvider {
    static var previews: some View {
        JobImageView(device: TestData.Devices[1])
    }
}
