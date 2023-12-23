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
                Text("PLACE HOLDER FOR LAST NAME's LIST")
                    .onAppear(){
                        mainViewModel.loadDataIntoList()
                    }
                Spacer()
                List(mainViewModel.listOfGroceries) { grocery in
                    GroceriesSingleList(mainViewModel: mainViewModel, groceries: grocery)
                        .listRowSeparator(.hidden)
                }
            }
        })
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    ListView(mainViewModel: SocliaListViewModel())
}
