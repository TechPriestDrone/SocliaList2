//
//  MockServices.swift
//  SocliaList
//
//  Created by Andrey Safronov on 12/11/2023.
//

import Foundation

class MockServicesDataServer {
    let mockGroceriesLists = [ Groceries(id: "moms new list", products:
                                        [
                                            Groceries.product(name: "apple",purchased: true),
                                            Groceries.product(name: "beer",purchased: true),
                                            Groceries.product(name: "PS5",purchased: true)
                                        ]),
                          Groceries(id: "friday dinner", products:
                                        [
                                            Groceries.product(name: "apple2"),
                                            Groceries.product(name: "beer2", purchased: true),
                                            Groceries.product(name: "PS52")
                                        ]),
                          Groceries(id: "specials", products:
                                        [
                                            Groceries.product(name: "apple3"),
                                            Groceries.product(name: "beer3"),
                                            Groceries.product(name: "PS53")
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
