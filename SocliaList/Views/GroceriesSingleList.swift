//
//  GroceriesSingleList.swift
//  SocliaList
//
//  Created by Andrey Safronov on 12/11/2023.
//

import SwiftUI

struct GroceriesSingleList: View {
    var groceries: Groceries
    
    var body: some View {
        List(groceries.items, id: \.self) { item in
            Text(item)
        }
    }
}

#Preview {
    GroceriesSingleList(groceries: Groceries(id: "123", items: ["a","b","c"]))
}
