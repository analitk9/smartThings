

import SwiftUI

struct DeviceView: View {
   
    let gradient =  LinearGradient(colors: [ Color(red: 164/255, green: 104/255, blue: 253/255),
                                             Color(red: 75/255, green: 74/255, blue: 234/255)], startPoint: .top, endPoint: .bottom)
    let device: DeviceDTO
    var body: some View {

            VStack{
                HStack{
                    VStack(alignment: .leading){
                        OnlineView(statusText: device.isOnline ? .online : .offline)
                            .frame(height: 20)
                            .padding(.top, 5)
                        VStack{
                            HStack {
                                Text(device.name)
                                    .lineLimit(2)
                                    .layoutPriority(0)
                                Spacer()
                                    .layoutPriority(0)
                                Image("cleaner")
                            }
                            Spacer()
                            HStack {
                                StatusView(device: device)
                                Spacer()
                                if device.type == 1 { LastWorkLabel(lastDate: device.returnlastWorkTimeDate()) }
                               
                            }.padding(.bottom, 5)
                               
                        }
                    }.padding([.top, .leading, .trailing], 5)
                }
               
            }
            .background {
               gradient
            }
            .cornerRadius(8)
      
    }
}

struct DeviceView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceView(device: TestData.Devices[0])
            .frame(width: 300, height: 200)
    }
}
