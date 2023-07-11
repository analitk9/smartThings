
import SwiftUI

struct EmptyListView: View {
    var emptyArr: [Int] = [1, 3, 5, 7, 9, 11, 13, 15]
    
    var body: some View {
        List(emptyArr, id: \.self) { indx in
            Section {
                Image("listPlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(1.05)
                    .listRowInsets(EdgeInsets())
                    .cornerRadius(10)
            }
            .scrollContentBackground(.hidden)
            .listRowSeparator(.hidden)
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
