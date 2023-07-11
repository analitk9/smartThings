

import SwiftUI

struct ReloadTapView: View {
    @ObservedObject  var dataModel: DevicesDataModel
    @State var isLoad: Bool = false
    @State var progressFinish: CGFloat = 0
    @State var progressStart: CGFloat = 0
    @State var widthButton: CGFloat = .infinity
    @State var textButton = "ОБНОВИТЬ"
    
    var body: some View {
        ZStack{
            Text(textButton)
                .padding()
                .background {
                    Color(.white)
                }
                .foregroundColor(isLoad ? .white : .black )
                .cornerRadius(25)
                .onTapGesture {
                    dataModel.asyncAfterFetch()
                         isLoad.toggle()
                }
            
            if dataModel.modelState == .isLoad {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
            }
        }
    }
}

struct ReloadTapView_Previews: PreviewProvider {
    static var dataModel = DevicesDataModel()
    static var previews: some View {
        ReloadTapView(dataModel: dataModel)
           
    }
}
