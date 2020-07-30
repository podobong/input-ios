import SwiftUI


struct CalendarView: View {
    @State var pageNum: Int = MAX_PAGE / 2
    @State var isFirstPage: Bool = false
    @State var isLastPage: Bool = false
    @Binding var images: [Data]
    @EnvironmentObject var selected: SelectedInfos
    @GestureState private var translation: CGFloat = 0
    var monthDiff: Int {
        get {
            return self.pageNum - MAX_PAGE / 2
        }
    }
    var pageDate: Date {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM"
            let now: Date = formatter.date(from: formatter.string(from: Date()))!
            return Calendar.current.date(byAdding: .month, value: self.monthDiff, to: now)!
        }
    }
    var pageYear: Int {
        get {
            let monthFormatter = DateFormatter()
            monthFormatter.dateFormat = "YYYY"
            return Int(monthFormatter.string(from: self.pageDate))!
        }
    }
    var pageMonth: Int {
        get {
            let monthFormatter = DateFormatter()
            monthFormatter.dateFormat = "M"
            return Int(monthFormatter.string(from: self.pageDate))!
        }
    }
    var firstDayOfWeek: Int {
        return Calendar(identifier: .gregorian).component(.weekday, from: self.pageDate) - 1
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack(spacing: 0) {
                CalendarTopBarLayout(pageNum: self.$pageNum, isFirstPage: self.$isFirstPage, isLastPage: self.$isLastPage,
                                     pageYear: self.pageYear, pageMonth: self.pageMonth)
                CalendarPageLayout(pageNum: self.$pageNum, pageDate: self.pageDate, firstDayOfWeek: self.firstDayOfWeek)
                    .environmentObject(self.selected)
                    .frame(maxHeight: .infinity)
                    .gesture(
                        DragGesture().updating(self.$translation) { value, state, _ in
                            state = value.translation.width
                        }.onEnded { value in
                            let offset = value.translation.width / metrics.size.width
                            let newPageNum = (CGFloat(self.pageNum) - offset).rounded()
                            self.pageNum = min(max(Int(newPageNum), 0), MAX_PAGE - 1)
                        }
                    )
            }.alert(isPresented: self.$isFirstPage) {
                Alert(
                    title: Text("주의"),
                    message: Text("첫 번째 페이지입니다."),
                    dismissButton: .default(Text("닫기"))
                )
            }.alert(isPresented: self.$isLastPage) {
                Alert(
                    title: Text("주의"),
                    message: Text("마지막 페이지입니다."),
                    dismissButton: .default(Text("닫기"))
                )
            }
        }
    }
}
