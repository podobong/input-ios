import SwiftUI


struct CalendarRowLayout: View {
    var days: [Date]
    var row: Int
    
    var body: some View {
        GeometryReader { metrics in
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    ForEach((self.row * 7)..<((self.row + 1) * 7), id: \.self) { i in
                        CalendarItemLayout(days: self.days, index: i)
                            .frame(width: metrics.size.width / 7)
                    }
                }
                Rectangle()
                    .fill(Color("MiddleGray"))
                    .frame(height: 0.5)
            }
        }
    }
}
