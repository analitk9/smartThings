//
//  OnlineView.swift
//  SmartThings
//
//  Created by Denis Evdokimov on 7/9/23.
//

import SwiftUI

struct OnlineView: View {
    let statusText: StatusDevice
    var body: some View {
        Label(title: {Text(statusText.rawValue)}) {
            Circle().foregroundColor( statusText == StatusDevice.offline ? .red : .green)
        }
        .foregroundColor(.white)
        .font(.subheadline)
      //  .frame(width: 90, height: 14)
    }
}

struct OnlineView_Previews: PreviewProvider {
    static let status =  StatusDevice.offline
    static var previews: some View {
        OnlineView(statusText: status)
            .background(Color(.blue))
    }
}
