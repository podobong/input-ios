import SwiftUI


struct MainView: View {
    @EnvironmentObject var response: Response
    @EnvironmentObject var selectedUnivs: Univs
    
    var body: some View {
        Text("MainView")
    }
}
