import SwiftUI


struct DdayItemDetailLayout: View {
    @EnvironmentObject var selected: SelectedInfos
    var index: Int
    
    var body: some View {
        let schedules: [Schedule] = self.selected.old[self.index].schedules
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "M월 d일"
        
        return VStack(spacing: 0) {
            ForEach(0..<schedules.count, id: \.self) { i in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text(schedules[i].description)
                            .font(.system(size: 18))
                            .foregroundColor(Color("DarkDarkGray"))
                        Spacer()
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Text("시작일: ")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("DarkGray"))
                                Text(formatter.string(from: schedules[i].startDate))
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                            HStack(spacing: 0) {
                                Text("마감일: ")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("DarkGray"))
                                Text(formatter.string(from: schedules[i].endDate))
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    Rectangle()
                        .fill(Color("MiddleGray"))
                        .frame(height: 0.5)
                }
            }
        }
    }
}
