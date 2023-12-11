//
//  ListView.swift
//  SocliaList
//
//  Created by Andrey Safronov on 12/11/2023.
//

import SwiftUI

struct ListView: View {
    @StateObject var mainViewModel: SocliaListViewModel
    var body: some View {
        NavigationView(content: {
            VStack{
                Text("LAST NAME's LIST")
                    .onAppear(){
                        mainViewModel.loadDataIntoList()
                    }
                Spacer()
                List(mainViewModel.listOfGroceries) { grocery in
                    GroceriesSingleList(mainViewModel: mainViewModel, groceries: grocery)
                    Divider()
                }
            }
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ListView(mainViewModel: SocliaListViewModel())
}

//DisclosureGroup{
//    ForEach(grocery.items, id: \.name){item in
//        GroceriesSingleList(groceries: grocery)
//    }
//} label: {
//    Text(grocery.id)
//}
