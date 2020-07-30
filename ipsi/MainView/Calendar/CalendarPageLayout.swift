import SwiftUI


struct CalendarPageLayout: View {
    @Binding var pageNum: Int
    @EnvironmentObject var selected: SelectedInfos
    var pageDate: Date
    var firstDayOfWeek: Int
    var days: [Date] {
        var array = [Date](repeating: Date(), count: 42)
        array[self.firstDayOfWeek] = self.pageDate
        for i in 0..<42 {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM"
            let now: Date = formatter.date(from: formatter.string(from: self.pageDate))!
            let diff: Int = i - self.firstDayOfWeek
            array[i] = Calendar.current.date(byAdding: .day, value: diff, to: now)!
        }
        return array
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack(spacing: 0) {
                ForEach(0..<6, id: \.self) { i in
                    CalendarRowLayout(days: self.days, row: i)
                }
                .frame(height: metrics.size.height / 6)
            }
        }
    }
}
