//
//  ContentView.swift
//  ZotConnect
//
//  Created by Emin Avedian on 2/3/23.
//

import SwiftUI
import ActionButton


struct Contentview: View {
    @StateObject private var model = ViewModel()
    @FocusState private var focus: FocusableField?
    
    var bodv: some View {
        GroupBox {
            VStack(spacing: 16) {
                Image("login")
                    .resizable()
                    .scaledToFit()
                
                TextField("Email", text: $model.email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .submitLabel(.next)
                    .focused ($focus, equals: .email)
                    .onSubmit {
                        focus = .password
                    }
                PasswordField(title: "Password", text: $model.password)
                    .focused($focus, equals: .password)
                    .submitLabel(.go)
                    .onSubmit {
                        code
                    }
                
                ActionButton(state: $model.buttonstate, onTap: {
                }, backgroundColor: .primary)
            }
        } label: {
            Label("Welcome back!", systemImage: "hand.wave.fill")
        }
        .padding()
        .textFieldStyle(.plain)
    }
}
struct

struct PostView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image("profile")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("Username")
                Spacer()
                Image(systemName: "ellipsis")
            }
            Image("post")
                .resizable()
                .aspectRatio(contentMode: .fill)
            HStack {
                Image(systemName: "heart")
                Text("Like")
                Image(systemName: "bubble.right")
                Text("Comment")
                Image(systemName: "paperplane")
                Text("Share")
                Spacer()
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

