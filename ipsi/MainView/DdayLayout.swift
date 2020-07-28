import SwiftUI


struct DdayLayout: View {
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("").frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 0)
                ForEach(0..<self.selected.univs.count, id: \.self) { i in
                    Text(self.selected.univs[i].univ)
                }
            }
        }
    }
}

