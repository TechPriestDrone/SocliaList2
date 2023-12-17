//
//  MockServices.swift
//  SocliaList
//
//  Created by Andrey Safronov on 12/11/2023.
//

import Foundation

class MockServicesDataServer {
    let mockGroceriesLists = [ Groceries(id: "123", products:
                                        [
                                            Groceries.product(name: "apple",purchased: true),
                                            Groceries.product(name: "beer",purchased: true),
                                            Groceries.product(name: "PS5",purchased: true)
                                        ]),
                          Groceries(id: "125", products:
                                        [
                                            Groceries.product(name: "apple"),
                                            Groceries.product(name: "beer"),
                                            Groceries.product(name: "PS5")
                                        ]),
                          Groceries(id: "124", products:
                                        [
                                            Groceries.product(name: "apple"),
                                            Groceries.product(name: "beer"),
                                            Groceries.product(name: "PS5")
                                        ])]
    
    func mockLogin (findIdofList: [String]) -> [Groceries] {
        var listToReturn: [Groceries] = []
        for idToChexck in findIdofList{
            for mockGroceryList in mockGroceriesLists {
                if idToChexck == mockGroceryList.id {
                    listToReturn.append(mockGroceryList)
                }
            }
        }
        return listToReturn
    }
}
