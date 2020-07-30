import SwiftUI


struct CalendarItemLayout: View {
    var days: [Date]
    var index: Int
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                Text("\(Calendar(identifier: .gregorian).component(.day, from: self.days[self.index]))")
                    .padding(.vertical, 6)
                Rectangle()
                    .fill(Color("MiddleGray"))
                    .frame(height: 0.5)
                Spacer()
            }
            Rectangle()
                .fill(Color("MiddleGray"))
                .frame(width: 0.5)
        }
    }
}
