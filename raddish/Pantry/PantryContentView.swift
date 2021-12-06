//
//  PantryContentView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/16/21.
//

import SwiftUI
import MobileCoreServices


struct PantryContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    var items: FetchedResults<Item>
    @State private var showingScanSheet = false
    @State var showImagePicker: Bool = false
    @State var image: UIImage? = nil
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Snap/Upload Image"),
                    message: nil,
                    buttons: [
                        .default(Text("Take Photo"), action: {
                            showImagePicker.toggle()
                                  PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
//                            ProgressView()
//                            //self.activityIndicator.startAnimating()
//                            // 2
//                            let imagePicker = UIImagePickerController()
//                            // 3
//                            imagePicker.delegate = self
//                            // 4
//                            imagePicker.sourceType = .camera
//                            // 5
//                            imagePicker.mediaTypes = [kUTTypeImage as String]
//                            // 6
//                            //self.present(imagePicker, animated: true, completion: {
//                              // 7
//                            //self.activityIndicator.stopAnimating()
//                            //})
                        }),
                        .default(Text("Upload Photo"), action: {
                            
                        }),
                        .cancel(Text("Cancel"), action: {
                            
                        })
                    ]
        )
    }

  
    var body: some View {
      List {
        Section(header: Text("Expiring Soon")) {
          ForEach(viewModel.fetchItemsExpiringSoon()) { pantryItem in
            NavigationLink(destination: PantryItemDetail(pantryItem: pantryItem)) {
              PantryItemRow(pantryItem: pantryItem)
            }
          }
          .onDelete(perform: delete)
        }
        
        Section(header: Text("All")) {
          ForEach(viewModel.pantry.sorted(by: { $0.expiration! < $1.expiration! })) { pantryItem in
            NavigationLink(destination: PantryItemDetail(pantryItem: pantryItem)) {
              PantryItemRow(pantryItem: pantryItem)
            }
          }
          .onDelete(perform: delete)
        }
      }
      .listStyle(GroupedListStyle())
      .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
              EditButton()
          }
          ToolbarItem {
            NavigationLink(destination: AddPantryItem(viewModel: viewModel)) {
                              Label("Add Item", systemImage: "plus")
                          }
          }
        //Open the sheet here
        ToolbarItem(placement: .navigationBarLeading) {
            Button("Scan Receipt") {
                self.showImagePicker = true
            }
            .sheet(isPresented: $showImagePicker) {
                PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
                //viewModel.processPhoto(self.$image as? UIImage)
            }
        }
      }
      .navigationBarTitle("Pantry")
    }
    
  private func addItem() {
    withAnimation {
        let newItem = Item(context: viewContext)
        newItem.expiration = Date()

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
  }
    
//    private func processPhoto() {
//        guard let selectedPhoto =
//          image as? UIImage else {
//            dismiss(animated: true)
//            return
//        }
//        // 2
//        activityIndicator.startAnimating()
//        // 3
//        dismiss(animated: true) {
//          self.performImageRecognition(selectedPhoto)
//        }
//
//    }

  private func deleteItems(offsets: IndexSet) {
    withAnimation {
        offsets.map { items[$0] }.forEach(viewContext.delete)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
  }

  func delete(at offsets: IndexSet) {
    viewModel.deletePantryItem(atOffsets: offsets)
  }
  
  private let itemFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      formatter.timeStyle = .medium
      return formatter
  }()
}
