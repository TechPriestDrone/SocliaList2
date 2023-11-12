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
                        mainViewModel.loadDataintoList()
                    }
                Spacer()
                List(mainViewModel.listOfGroceries) { grocery in
                    DisclosureGroup{
                        ForEach(grocery.items, id: \.self){item in
                            Text(item)
                        }
                    } label: {
                        Text(grocery.id)
                    }
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
