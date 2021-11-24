//
//  RecipesDetailsView.swift
//  raddish
//
//  Created by Mira Mookerjee on 11/2/21.
//

import SwiftUI

// https://www.hackingwithswift.com/forums/swiftui/coloured-menu-items/7929

struct AddToMealPlanMenuStyle : MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .background(Color.green)
            .cornerRadius(15)
            .foregroundColor(.black)
    }
}

struct RecipeDetailsView: View {
    var recipe: Recipe
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    
  
    var body: some View {
      ScrollView {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: recipe.strMealThumb)!,
                     placeholder: { Text("Loading...") })
              .frame(width: 107, height: 115)
              .cornerRadius(15)
              .padding(.leading)
            Menu("Add to Meal Plan") {
                Button("Sunday", action: {addToMealPlan("Sunday")})
                Button("Monday", action: {addToMealPlan("Monday")})
                Button("Tuesday", action: {addToMealPlan("Tuesday")})
                Button("Wednesday", action: {addToMealPlan("Wednesday")})
                Button("Thursday", action: {addToMealPlan("Thursday")})
                Button("Friday", action: {addToMealPlan("Friday")})
                Button("Saturday", action: {addToMealPlan("Saturday")})
              }
            .padding()
            .menuStyle(AddToMealPlanMenuStyle())
          Text("Ingredients:")
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
          Group {
            IngredientRow(ingredient: recipe.strIngredient1 ?? "", measure: recipe.strMeasure1 ?? "")
            IngredientRow(ingredient: recipe.strIngredient2 ?? "", measure: recipe.strMeasure2 ?? "")
            IngredientRow(ingredient: recipe.strIngredient3 ?? "", measure: recipe.strMeasure3 ?? "")
            IngredientRow(ingredient: recipe.strIngredient4 ?? "", measure: recipe.strMeasure4 ?? "")
            IngredientRow(ingredient: recipe.strIngredient5 ?? "", measure: recipe.strMeasure5 ?? "")
            IngredientRow(ingredient: recipe.strIngredient6 ?? "", measure: recipe.strMeasure6 ?? "")
          }
          Group {
            IngredientRow(ingredient: recipe.strIngredient7 ?? "", measure: recipe.strMeasure7 ?? "")
            IngredientRow(ingredient: recipe.strIngredient8 ?? "", measure: recipe.strMeasure8 ?? "")
            IngredientRow(ingredient: recipe.strIngredient9 ?? "", measure: recipe.strMeasure9 ?? "")
            IngredientRow(ingredient: recipe.strIngredient10 ?? "", measure: recipe.strMeasure10 ?? "")
            IngredientRow(ingredient: recipe.strIngredient11 ?? "", measure: recipe.strMeasure11 ?? "")
            IngredientRow(ingredient: recipe.strIngredient12 ?? "", measure: recipe.strMeasure12 ?? "")
          }
          Group {
            IngredientRow(ingredient: recipe.strIngredient13 ?? "", measure: recipe.strMeasure13 ?? "")
            IngredientRow(ingredient: recipe.strIngredient14 ?? "", measure: recipe.strMeasure14 ?? "")
            IngredientRow(ingredient: recipe.strIngredient15 ?? "", measure: recipe.strMeasure15 ?? "")
            IngredientRow(ingredient: recipe.strIngredient16 ?? "", measure: recipe.strMeasure16 ?? "")
            IngredientRow(ingredient: recipe.strIngredient17 ?? "", measure: recipe.strMeasure17 ?? "")
            IngredientRow(ingredient: recipe.strIngredient18 ?? "", measure: recipe.strMeasure18 ?? "")
          }
          Group {

            IngredientRow(ingredient: recipe.strIngredient19 ?? "", measure: recipe.strMeasure19 ?? "")
            IngredientRow(ingredient: recipe.strIngredient20 ?? "", measure: recipe.strMeasure20 ?? "")
          }
          Text("Instructions:")
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
          Text(recipe.strInstructions)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.leading)
            .padding(.trailing)
          }
      }
      .navigationBarTitle(recipe.strMeal)
    }
  
  private func addToMealPlan(_ dayOfWeek: String) {
    self.viewModel.saveMealItem(day_of_week: dayOfWeek, name: recipe.strMeal, imageURL: recipe.strMealThumb)
    self.mode.wrappedValue.dismiss()
    //UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
    //RecipesView.mode.wrappedValue.dismiss()
  }
}

