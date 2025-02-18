//
//  Recipe.swift
//  raddish
//
//  Created by Mira Mookerjee on 10/28/21.
// Help from https://developer.apple.com/tutorials/swiftui/composing-complex-interfaces

import Foundation
import SwiftUI

struct Recipe: Hashable, Codable {
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
  /*
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
  
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
        case thursday = "Thursday"
        case friday = "Friday"
        case saturday = "Saturday"
        case sunday = "Sunday"
    }

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
   */
  
  enum CodingKeys : String, CodingKey {
    
    case strMeal
    case strInstructions
    case strMealThumb
    /*
    case strIngredient1
    case strIngredient2
    case strIngredient3
    case strIngredient4
    case strIngredient5
    case strIngredient6
    case strIngredient7
    case strIngredient8
    case strIngredient9
    case strIngredient10
    case strIngredient11
    case strIngredient12
    case strIngredient13
    case strIngredient14
    case strIngredient15
    case strIngredient16
    case strIngredient17
    case strIngredient18
    case strIngredient19
    case strIngredient20
    case strMeasure1
    case strMeasure2
    case strMeasure3
    case strMeasure4
    case strMeasure5
    case strMeasure6
    case strMeasure7
    case strMeasure8
    case strMeasure9
    case strMeasure10
    case strMeasure11
    case strMeasure12
    case strMeasure13
    case strMeasure14
    case strMeasure15
    case strMeasure16
    case strMeasure17
    case strMeasure18
    case strMeasure19
    case strMeasure20
    case category
    case imageName
     */
  }
  
}

struct Result: Decodable {
  var meals: [Recipe]
  
  
  enum CodingKeys : String, CodingKey {
    case meals
    
  }
  
}
