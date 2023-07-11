//
//  LastWorkLabel.swift
//  SmartThings
//
//  Created by Denis Evdokimov on 7/9/23.
//

import SwiftUI

struct LastWorkLabel: View {
    var lastDate: Date = .now
    
    var body: some View {
        Label {
            Text(lastDate, style: .time)
        } icon: {
            Image("clock")
                .resizable()
                .frame(width: 24, height: 24)
        }
        .foregroundColor(.white)

    }
}

struct LastWorkLabel_Previews: PreviewProvider {
    static var previews: some View {
        LastWorkLabel()
            .background {
                Color(.blue)
            }
    }
}
