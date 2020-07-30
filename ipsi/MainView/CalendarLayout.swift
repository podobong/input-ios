import SwiftUI


struct CalendarLayout: View {
    @Binding var images: [Data]
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("CalendarLayout")
            Spacer()
        }
    }
}
