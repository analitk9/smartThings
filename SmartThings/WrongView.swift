
import SwiftUI

struct WrongView: View {
    @ObservedObject var model: DevicesDataModel
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                Text("Что то пошло не так, ошибка 123")
                    .fontWeight(.heavy)
                    .padding(.bottom, 30)
                    .foregroundColor(.white)
                Button( "ПОВТОРИТЬ") {
                    model.modelState = .wrong
                    model.asyncAfterFetch()
                }.foregroundColor(.white)
                    .padding()
                    .background {
                        Color(.blue)
                    }
                    .cornerRadius(25)
            }
        }
        .ignoresSafeArea()
        
        
    }
}

struct WrongView_Previews: PreviewProvider {
    static var model = DevicesDataModel()
    static var previews: some View {
        WrongView(model: model)
    }
}
