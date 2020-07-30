import SwiftUI


struct DdayItemDetailLayout: View {
    @EnvironmentObject var selected: SelectedInfos
    var index: Int
    
    var body: some View {
        let schedules: [Schedule] = self.selected.old[self.index].schedules
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        
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
                                Text(formatter.string(from: schedules[i].startDate))
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                Spacer().frame(width: 2)
                                Text("부터")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color("DarkDarkGray"))
                            }
                            Spacer().frame(height: 5)
                            HStack(spacing: 0) {
                                Text(formatter.string(from: schedules[i].endDate))
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                Spacer().frame(width: 2)
                                Text("까지")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color("DarkDarkGray"))
                            }
                            .frame(alignment: .bottom)
                        }
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)
                    Rectangle()
                        .fill(Color("MiddleGray"))
                        .frame(height: 0.5)
                }
            }
        }
    }
}
