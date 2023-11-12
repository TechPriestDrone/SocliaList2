//
//  MockServices.swift
//  SocliaList
//
//  Created by Andrey Safronov on 12/11/2023.
//

import Foundation

class MockServicesDataServer {
    let mockGroceries = [ Groceries(id: "123", items:
                                        [
                                            "bagles",
                                            "potats",
                                            "fox Snaccs"
                                        ]),
                          Groceries(id: "125", items:
                                        [
                                            "bagles",
                                            "potats",
                                            "fox Snaccs"
                                        ]),
                          Groceries(id: "124", items:
                                        [
                                            "bagles",
                                            "potats",
                                            "fox Snaccs"
                                        ])]
    
    func mockLogin (findIdofList: [String]) -> [Groceries] {
        var listToReturn: [Groceries] = []
        for idToChexck in findIdofList{
            for mockGrocery in mockGroceries {
                if idToChexck == mockGrocery.id {
                    listToReturn.append(mockGrocery)
                }
            }
        }
        return listToReturn
    }
}
