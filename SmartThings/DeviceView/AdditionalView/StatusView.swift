//
//  StatusView.swift
//  SmartThings
//
//  Created by Denis Evdokimov on 7/9/23.
//

import SwiftUI

struct StatusView: View {
    let device: DeviceDTO
    var statusImageString: String {
        if device.type == 1 {
            return "rocket"
        } else  {
            return "nosign"
        }
    }
    
    var body: some View {
        Label(title: {
            Text("\(device.returnJobStatus())")
        }, icon: {
           JobImageView(device: device) })
            .padding([.leading, .trailing],10)
            .background {
                Color(red: 35/255, green: 33/255, blue: 153/255)
            }
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}



struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(device: TestData.Devices[1])
    }
}
