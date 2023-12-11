//
//  MainViewModel.swift
//  SocliaList
//
//  Created by Andrey Safronov on 12/11/2023.
//

import Foundation

class SocliaListViewModel: ObservableObject {
    @Published var listOfGroceries: [Groceries] = []
    
    func verifyUser() -> Bool{
        return true
    }
    
    func markGroceryAsPurchased(groceryListId: Groceries, groceryToToggle: Groceries.product){
        guard let gorceryListToToggle = (listOfGroceries.firstIndex{$0.id == groceryListId.id}) else {
            print("no such ID found")
            return
        }
        let groceryToToggle = listOfGroceries[gorceryListToToggle].products.firstIndex{$0.name == groceryToToggle.name}
        listOfGroceries[gorceryListToToggle].products[groceryToToggle!].purchased.toggle()
    }
    
    func loadDataIntoList() {
        if verifyUser() {
            listOfGroceries =  MockServicesDataServer().mockLogin(findIdofList: ["123","124","125"])
        }
    }
}

