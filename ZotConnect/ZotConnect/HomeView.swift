import SwiftUI

struct HomeView: View {
    //home page
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    Spacer()
    var footer: some View {
        HStack {
            .padding()
            Image(systemName: "globe").imageScale(.large).foregroundColor(.accentColor)

        }
    }
}