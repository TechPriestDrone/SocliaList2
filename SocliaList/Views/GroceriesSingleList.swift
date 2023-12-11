//
//  GroceriesSingleList.swift
//  SocliaList
//
//  Created by Andrey Safronov on 12/11/2023.
//

import SwiftUI

struct GroceriesSingleList: View {
    @StateObject var mainViewModel: SocliaListViewModel
    var groceries: Groceries
    
    var body: some View {
        DisclosureGroup{
                ForEach(groceries.products, id: \.name){product in
                    HStack{
                        Text(product.name)
                        Spacer()
                        product.purchased ? Image(systemName: "circle") : Image(systemName: "circle.fill")
                    }
                    .onTapGesture {
                        mainViewModel.markGroceryAsPurchased(groceryListId: groceries, groceryToToggle: product)
                    }
            }
        } label: {
            Text(groceries.id)
        }
    }
}

#Preview {
    GroceriesSingleList(mainViewModel: SocliaListViewModel(), groceries: Groceries(id: "123", products: [Groceries.product(name: "apple", purchased: true),Groceries.product(name: "grapple", purchased: true)]))
}

//List(groceries.items, id: \.name) { item in
//    HStack{
//        Text(item.name)
//        Spacer()
//        Image(systemName: "circle")
//    }
//}
