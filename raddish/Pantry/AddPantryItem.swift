//
//  AddPantryItem.swift
//  raddish
//
//  Created by Mira Mookerjee on 10/24/21.
//

import SwiftUI

import SwiftUI
import UIKit

struct AddPantryItem: View {

  var viewModel: ViewModel
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>

  @State var name: String = ""
  @State var expiration: NSDate?
  @State var date: Date?

  var body: some View {
    VStack {
      HStack {
        Text("name:")
          .fontWeight(.bold)
          .padding(.leading)
        TextField("name", text: $name)
          .padding(.trailing)
      
        Text("date:")
          .fontWeight(.bold)
          .padding(.leading)
        //DatePicker(
            //"Start Date",
            //selection: $expiration ?? Date() as Date?,
            //displayedComponents: [.date]
           //)
      }.padding()
      Spacer()
    }.padding()
    .navigationBarTitle("New Pantry Item")
    .navigationBarItems(trailing:
      Button(action: {
      self.viewModel.savePantryItem(name: self.name, expiration: Date() as NSDate, date: Date())
      self.mode.wrappedValue.dismiss()
      }) {
        Text("Done")
      }
      
    )
  }
}

/*
  // MARK: View Helper Functions
  func buttonText() -> String {
    return image == nil ? "Add Contact Picture" : "Change Contact Picture"
  }
}
 */
