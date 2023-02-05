import SwiftUI
struct FooterView: View {
    var body: some View {
        HStack {
            .padding()
            NavigationLink(destination: HomeView()) {
                Image(systemName: "house").imageScale(.large).foregroundColor(.accentColor)
            } 
            NavigationLink(destination: ProfileView()) {
                Image(systemName: "").imageScale(.large).foregroundColor(.accentColor)
            } 
            NavigationLink(destination: NotificationsView()) {
                Image(systemName: "suit.heart").imageScale(.large).foregroundColor(.accentColor)
            } 
            NavigationLink(destination: ProfileView()) {
                Image(systemName: "person").imageScale(.large).foregroundColor(.accentColor)
            } 
            
        }
    }
}