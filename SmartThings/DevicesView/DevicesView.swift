

import SwiftUI

struct DevicesView: View {
    @ObservedObject  var dataModel: DevicesDataModel //= DevicesDataModel()
    @State var isDelete: Bool = false
    @State var deleteIndex: IndexSet?
    func deleteItem() {
        if let indx = deleteIndex  {
            dataModel.devices.remove(atOffsets: indx)
        }
        deleteIndex = nil
    }

    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Умные")
                        Text("вещи")
                    }
                        .font(.largeTitle)
                        .foregroundColor(dataModel.modelState == .loaded ? .specialViolet : .specialGrey)
                    Spacer()
                }.padding(.leading)
                if dataModel.modelState == .loaded {
                    CommonListView(dataModel: dataModel, isDelete: $isDelete, deleteIndex: $deleteIndex)
                        .background(Color(.backgroundMain ?? .black))
                } else {
                   EmptyListView()
                        .scrollContentBackground(.hidden)
                        .background(Color(.backgroundMain ?? .black))
                }
                   
            }
            .background(Color(.backgroundMain ?? .black))
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ReloadTapView(dataModel: dataModel)
                }
            }
            .alert(isPresented: $isDelete) {
                Alert(title: Text(""),
                      message: Text("Вы действительно хотите удалить \(TestData.Devices[1].name)"),
                      primaryButton: .destructive(Text("Удалить"), action: {
                    deleteItem()
                    isDelete.toggle()
                }), secondaryButton: .cancel(Text("Отмена"), action: {
                    deleteIndex = nil
                    isDelete.toggle()
                }))
            }
        }
      
        
    }
}

struct DevicesView_Previews: PreviewProvider {
    static var dataModel = DevicesDataModel()
    static var previews: some View {
        DevicesView(dataModel: dataModel)
    }
}


