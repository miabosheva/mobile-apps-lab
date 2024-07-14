import Foundation

class UserDefaultsHelperMethods {
    
    // MARK: - Store Data
    
    static func storeDrinksInUserDefaults(_ drinks: [Drink]) {
        let defaults = UserDefaults.standard
        if let encoded = try? JSONEncoder().encode(drinks) {
            defaults.set(encoded, forKey: "drinks")
        }
    }
    
    static func storeFoodsInUserDefaults(_ foods: [Food]) {
        let defaults = UserDefaults.standard
        if let encoded = try? JSONEncoder().encode(foods) {
            defaults.set(encoded, forKey: "foods")
        }
    }
    
    // MARK: - Retrieve Data
    
    static func loadDrinksFromUserDefaults() -> [Drink]? {
        let defaults = UserDefaults.standard
        if let savedDrinksData = defaults.data(forKey: "drinks") {
            if let savedDrinks = try? JSONDecoder().decode([Drink].self, from: savedDrinksData) {
                return savedDrinks
            }
        }
        return nil
    }

    static func loadFoodsFromUserDefaults() -> [Food]? {
        let defaults = UserDefaults.standard
        if let savedFoodsData = defaults.data(forKey: "foods") {
            if let savedFoods = try? JSONDecoder().decode([Food].self, from: savedFoodsData) {
                return savedFoods
            }
        }
        return nil
    }
    
    // MARK: - Fetch comments
    
    static func loadDrink(_ drinkTitle: String) -> Drink? {
        if let savedDrinks = loadDrinksFromUserDefaults() {
            return savedDrinks.first(where: { $0.title == drinkTitle })
        }
        return nil
    }
    
    static func loadFood(_ foodTitle: String) -> Food? {
        if let savedFoods = loadFoodsFromUserDefaults() {
            return savedFoods.first(where: { $0.title == foodTitle })
        }
        return nil
    }
    
    // MARK: - Save comments
    
    static func saveCommentForDrink(drinkTitle: String, comment: Comment) {
        let defaults = UserDefaults.standard
        if let savedDrinksData = defaults.data(forKey: "drinks") {
            if var savedDrinks = try? JSONDecoder().decode([Drink].self, from: savedDrinksData) {
                if let index = savedDrinks.firstIndex(where: { $0.title == drinkTitle }) {
                    if savedDrinks[index].comments == nil {
                        savedDrinks[index].comments = [comment]
                    } else {
                        savedDrinks[index].comments!.append(comment)
                    }
                    if let encoded = try? JSONEncoder().encode(savedDrinks) {
                        defaults.set(encoded, forKey: "drinks")
                        print(loadDrink(savedDrinks[index].title) ?? "Drink not found")
                    }
                } else {
                    print("Failed to find drink in UserDefaults")
                }
            } else {
                print("Failed to parse to type Drink")
            }
        } else {
            print("Failed to load from UserDefaults")
        }
    }
    
    static func saveCommentForFood(foodTitle: String, comment: Comment) {
        let defaults = UserDefaults.standard
        if let savedFoodsData = defaults.data(forKey: "foods") {
            if var savedFoods = try? JSONDecoder().decode([Food].self, from: savedFoodsData) {
                if let index = savedFoods.firstIndex(where: { $0.title == foodTitle }) {
                    if savedFoods[index].comments == nil {
                        savedFoods[index].comments = [comment]
                    } else {
                        savedFoods[index].comments!.append(comment)
                    }
                    if let encoded = try? JSONEncoder().encode(savedFoods) {
                        defaults.set(encoded, forKey: "foods")
                    }
                } else {
                    print("Failed to find food in UserDefaults")
                }
            } else {
                print("Failed to parse to type Food")
            }
        } else {
            print("Failed to load from UserDefaults")
        }
    }
}
