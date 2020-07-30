import SwiftUI


struct DdayLayout: View {
    @Binding var images: [Data]
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<self.selected.old.count, id: \.self) { i in
                    DdayItemLayout(index: i, image: self.images[i])
                        .environmentObject(self.selected)
                }
            }
        }
    }
}
