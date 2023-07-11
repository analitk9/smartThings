
import SwiftUI

struct CommonListView: View {
    @ObservedObject  var dataModel: DevicesDataModel
    @Binding var isDelete: Bool
    @Binding var deleteIndex: IndexSet?
    var body: some View {
        List(dataModel.devices) { dev in
            Section {
                    DeviceView(device: dev)
            }
            .listRowInsets(EdgeInsets())
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                Button {
                    let indx = dataModel.devices.firstIndex(of: dev)!
                    setDeletindex(IndexSet(integer: indx))
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }.tint(.red)
        }
        .scrollContentBackground(.hidden)
        .listRowSeparator(.hidden)
    }
    
   private func setDeletindex(_ index: IndexSet) {
        isDelete.toggle()
        deleteIndex = index
    }
}

//struct commonListView_Previews: PreviewProvider {
//    static var previews: some View {
//        commonListView()
//    }
//}
