//
//  ContentView.swift
//  ZotConnect
//
//  Created by Emin Avedian on 2/3/23.
//

import SwiftUI
import Combine
import ActionButton

enum FocusableField: Hashable {
    case email, password
}

struct ContentView: View {
    
    @StateObject private var model = ViewModel()
    @FocusState private var focus: FocusableField?
    
    var body: some View {
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
                        model.login()
                    }
                
                ActionButton(state: $model.buttonState, onTap: {
                }, backgroundColor: .primary)
            }
        } label: {
            Label("Welcome back!", systemImage: "hand.wave.fill")
        }
        .padding()
        .textFieldStyle(.plain)
    }
}
struct PasswordField: View {
    let title: String
    @Binding var text: String
    
    @State private var passwordHidden: Bool = true
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if passwordHidden {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text)
                    .disableAutocorrection(true)
            }
            
            Button {
                passwordHidden.toggle()
            } label: {
                Image(systemName: passwordHidden ? "eye.slash" : "eye")
            }
            .foregroundColor(.primary)
        }
        .frame(height: 18)
    }
}

class ViewModel: ObservableObject {
    @Published var buttonState: ActionButtonState = .disabled(title: "Fill out all fields to login", systemImage: "exclamationmark.circle")
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    private var emailIsValidPublisher: AnyPublisher<Bool, Never> {
        $email
            .map {value in
                !value.isEmpty
            }
            .eraseToAnyPublisher()
    }
    
    private var passwordIsValidPublisher: AnyPublisher<Bool, Never> {
        $password
            .map { value in
                !value.isEmpty
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        emailIsValidPublisher
            .combineLatest(passwordIsValidPublisher)
            .map { value1, value2 in
                value1 && value2
            }
            .map { fieldsValid -> ActionButtonState in
                if fieldsValid {
                    return .enabled(title: "Login", systemImage: "checkmark.circle")
                }
                return .disabled(title: "Fill out all fields to login", systemImage: "exclamationmark.circle")
            }
            .assign(to: \.buttonState, on: self)
            .store(in: &cancellables)
    }
    
    func login() {
        buttonState = .loading(title: "Loading", systemImage: "person")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.buttonState = .enabled(title: "Login", systemImage: "checkmark.circle")
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

