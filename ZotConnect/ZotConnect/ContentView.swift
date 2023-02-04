//
//  ContentView.swift
//  ZotConnect
//
//  Created by Emin Avedian on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    //home page
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            NavigationLink(destination: LoginView()) {
                Text("Go to LoginView")
            }
        }
        .padding()
    }
    Spacer()
    var footer: some View {
        HStack {
            .padding()
            Image(systemName: "").imageScale(.large).foregroundColor(.accentColor)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

