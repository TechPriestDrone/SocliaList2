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
    
    func loadDataintoList() {
        if verifyUser() {
            listOfGroceries =  MockServicesDataServer().mockLogin(findIdofList: ["123","124"])
        }
    }
}

