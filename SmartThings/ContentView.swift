

import SwiftUI

struct ContentView: View {
    @StateObject var devicesModel = DevicesDataModel()
    var body: some View {
        VStack{
            switch devicesModel.modelState{
            case .wrong:
                WrongView(model: devicesModel)
            case .isLoad:
                DevicesView(dataModel: devicesModel)
            case .loaded:
                DevicesView(dataModel: devicesModel)
            }
        }.onAppear{
           devicesModel.asyncAfterFetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
