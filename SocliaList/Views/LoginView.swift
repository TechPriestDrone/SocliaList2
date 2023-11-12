//
//  LoginView.swift
//  SocliaList
//
//  Created by Andrey Safronov on 12/11/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                NavigationLink {
                    ListView(mainViewModel: SocliaListViewModel())
                } label: {
                    Text("LOGIN")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    //                .frame(width: (UIScreen.main.bounds.width - 10), height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding()

                }
            }
        }
    }
}

#Preview {
    LoginView()
}
