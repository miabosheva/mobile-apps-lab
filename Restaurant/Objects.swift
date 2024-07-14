import Foundation

struct Drink {
    var title: String
    var description: String
    var type: DrinkType
    var image: String?
    var reviews: [Review]?
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
    var reviews: [Review]?
}

struct Review {
    var username: String
    var review: String
    var userImage: String?
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
        
        let reviewsMock = [
            Review(username: "anonymous", review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti.", userImage: nil),
            Review(username: "miabosheva", review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti.", userImage: nil),
            Review(username: "someName", review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti.", userImage: nil),
            Review(username: "AnotherUser", review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti.", userImage: nil)
        ]
        
        self.drinks = [
            Drink(title: "Mojito", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: DrinkType.Alcoholic, image: "mojito", reviews: reviewsMock),
            Drink(title: "Gin Tonic", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: DrinkType.Alcoholic, image: "gin-tonic", reviews: reviewsMock),
            Drink(title: "Wine", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: DrinkType.Alcoholic, image: "wine", reviews: reviewsMock),
            Drink(title: "Orange Juice", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: DrinkType.NonAlcoholic, image: "orange-juice")
        ]
        
        self.foods = [
            Food(title: "Lasagna", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: FoodType.Dinner, image: "lasagna", reviews: reviewsMock),
            Food(title: "Eggs", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: FoodType.Breakfast, image: "eggs", reviews: reviewsMock),
            Food(title: "Toast", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: FoodType.Breakfast, image: "toast", reviews: reviewsMock),
            Food(title: "Candy", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: FoodType.Lunch, image: "candy", reviews: reviewsMock),
            Food(title: "Ceasar Salad", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nulla neque, laoreet quis laoreet eget, finibus eleifend orci. Suspendisse potenti. Praesent accumsan ex tellus, ac consectetur augue malesuada sed. Proin accumsan lacinia volutpat. Nulla mi tellus, aliquet in mauris vitae, elementum vehicula urna. Nulla facilisi. Nullam ac ante eget magna tristique semper. Etiam vestibulum euismod arcu, at ornare nisi porttitor rhoncus. Nunc sit amet mattis mi.", type: FoodType.Lunch, image: "ceasar-salad")
        ]
    }
}
