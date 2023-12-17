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
    @State var unmarkedLeft = true
    
    var body: some View {
        DisclosureGroup(groceries.id, isExpanded: $unmarkedLeft ){
                ForEach(groceries.products, id: \.name){product in
                    HStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: UIScreen.main.bounds.width * 0.7)
//                            Rectangle()
//                                .foregroundColor(.black)
//                                .frame(width: UIScreen.main.bounds.width * 0.7, height: 2)
                            Text("   \(product.name)   ")
                                .strikethrough(product.purchased, pattern: .solid, color: .red)
                        }
                        .frame(alignment: .leading)
                        .onTapGesture {
                            unmarkedLeft = mainViewModel.markGroceryAsPurchased(groceryListId: groceries, groceryToToggle: product)
                        }
                        Spacer()
                        ZStack{
                            Rectangle()
                                .foregroundColor(.clear)
                            Image(systemName: "eraser")
                        }
                        .onTapGesture {
                            mainViewModel.deleteGroceryFromList(groceryList: groceries, groceryTodelete: product)
                        }
                    }
//                    .onTapGesture {
//                        mainViewModel.markGroceryAsPurchased(groceryListId: groceries, groceryToToggle: product)
//                    }
            }
        }
        .onAppear(){
            if groceries.products.filter({$0.purchased == false}).isEmpty{
                unmarkedLeft = false
            }
        }
    }
}

#Preview {
    GroceriesSingleList(mainViewModel: SocliaListViewModel(), groceries: Groceries(id: "123", products: [Groceries.product(name: "apple", purchased: false),Groceries.product(name: "grapple", purchased: false)]))
}

//List(groceries.items, id: \.name) { item in
//    HStack{
//        Text(item.name)
//        Spacer()
//        Image(systemName: "circle")
//    }
//}
