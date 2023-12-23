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
        DisclosureGroup(
            isExpanded: $unmarkedLeft,
            content: {
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
            }
            Divider()
            },
            label: { 
                VStack{
                Text("\(groceries.id)")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .onAppear(){
//                        if groceries.products.filter({$0.purchased == false}).isEmpty{
//                            unmarkedLeft = false
//                        }
                        unmarkedLeft = !groceries.products.filter({$0.purchased == false}).isEmpty
                    }
                    HStack{
                        Spacer()
                        Image(systemName: mainViewModel.listIcon(numberofMarked: groceries.products.filter({$0.purchased == false}).count, totalListSize: groceries.products.count))
                        Spacer()
                        unmarkedLeft ? Image(systemName: "scroll") : Image(systemName: "scroll.fill")
                    }
                Rectangle()
                    .frame(height: 0.2)
                }
                .padding(.leading)
            }
        ).buttonStyle(PlainButtonStyle()).accentColor(.clear).disabled(true)
    }
}

#Preview {
    GroceriesSingleList(mainViewModel: SocliaListViewModel(), groceries: Groceries(id: "moms list wqdas asd ", products: [Groceries.product(name: "apple", purchased: false),Groceries.product(name: "grapple", purchased: false)]))
}
