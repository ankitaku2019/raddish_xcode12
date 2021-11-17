//
//  RecipesDetailsView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/2/21.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe: Recipe
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    
  
    var body: some View {
      NavigationView {
        ScrollView {
        VStack{
              AsyncImage(url: URL(string: recipe.strMealThumb)!,
                       placeholder: { Text("Loading...") })
              .frame(width: 107, height: 115)
              .cornerRadius(15)
                Menu("Add to Meal Plan") {
                  Button("Saturday", action: {addToMealPlan("Saturday")})
                  Button("Friday", action: {addToMealPlan("Friday")})
                  Button("Thursday", action: {addToMealPlan("Thursday")})
                  Button("Wednesday", action: {addToMealPlan("Wednesday")})
                  Button("Tuesday", action: {addToMealPlan("Tuesday")})
                  Button("Monday", action: {addToMealPlan("Monday")})
                  Button("Sunday", action: {addToMealPlan("Sunday")})
                }
            Text("Instructions:")
              .bold()
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding()
            Text(recipe.strInstructions)
              .fixedSize(horizontal: false, vertical: true)
              .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                  Button("Back") {
                      mode.wrappedValue.dismiss()
                  }
                }
            }
        }
        .navigationBarTitle(recipe.strMeal)
      }
    }
  
  private func addToMealPlan(_ dayOfWeek: String) {
    self.viewModel.saveMealItem(day_of_week: dayOfWeek, name: recipe.strMeal, imageURL: recipe.strMealThumb)
    self.viewModel.updateMealItems()
    //self.mode.wrappedValue.dismiss()
    //UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
    //RecipesView.mode.wrappedValue.dismiss()
    self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
  }
}

