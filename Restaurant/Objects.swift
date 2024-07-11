import Foundation

struct Drink {
    var title: String
    var description: String
    var type: DrinkType
    var image: String?
}

enum DrinkType {
    case Alcoholic
    case NonAlcoholic
}

struct Food {
    var title: String
    var description: String
    var type: FoodType
    var image: String?
}

enum FoodType {
    case Breakfast
    case Lunch
    case Dinner
}

class ModelObjects: ObservableObject {
    
    @Published var drinks: [Drink]
    @Published var foods: [Food]
    
    init() {
        self.drinks = [
            Drink(title: "Mojito", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: DrinkType.Alcoholic, image: "mojito"),
            Drink(title: "Gin Tonic", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: DrinkType.Alcoholic, image: "gin-tonic"),
            Drink(title: "Wine", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: DrinkType.Alcoholic, image: "wine"),
            Drink(title: "Orange Juice", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: DrinkType.NonAlcoholic, image: "orange-juice")
        ]
        
        self.foods = [
            Food(title: "Lasagna", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: FoodType.Dinner, image: "lasagna"),
            Food(title: "Eggs", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: FoodType.Breakfast, image: "eggs"),
            Food(title: "Toast", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: FoodType.Breakfast, image: "toast"),
            Food(title: "Candy", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: FoodType.Lunch, image: "candy"),
            Food(title: "Ceasar Salad", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: FoodType.Lunch, image: "ceasar-salad")
        ]
    }
}
