import SwiftUI


struct ReviewLayout: View {
    @Binding var images: [Data]
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<self.selected.old.count, id: \.self) { i in
                    ReviewItemLayout(index: i, image: self.images[i])
                        .environmentObject(self.selected)
                }
            }
        }
    }
}
