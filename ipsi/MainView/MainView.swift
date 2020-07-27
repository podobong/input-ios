import SwiftUI


struct MainView: View {
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        VStack {
            ForEach(0..<self.selected.univs.count, id: \.self) { i in
                Text(self.selected.univs[i].univ)
            }
        }
    }
}
