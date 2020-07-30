import SwiftUI


struct DdayItemLayout: View {
    var index: Int
    var image: Data
    var dday: Int {
        get {
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let now: Date = formatter.date(from: formatter.string(from: Date()))!
            let day: Date = formatter.date(from: formatter.string(from: self.selected.old[self.index].schedules[0].endDate))!
            let interval = Int(now.distance(to: day))
            return interval / 86400
        }
    }
    @State var isClicked: Bool = false
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        let info: SelectedInfo = self.selected.old[self.index]
        return VStack(spacing: 0) {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.isClicked.toggle()
                }
            }) {
                HStack(spacing: 0) {
                    Image(uiImage: (UIImage(data: self.image) ?? UIImage(named: "Blank")!))
                        .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 76, height: 76)
                        .padding(.horizontal, 20)
                    VStack(spacing: 0) {
                        Text("\(info.univ) \(info.schedules[0].description)")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Text(info.sj)
                            .font(.system(size: 16))
                            .foregroundColor(Color("DarkGray"))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Text(info.jh)
                            .font(.system(size: 16))
                            .foregroundColor(Color("DarkGray"))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Text(info.major)
                            .font(.system(size: 16))
                            .foregroundColor(Color("DarkGray"))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    if self.dday == 0 {
                        Text("D-day")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(Color.red)
                            .padding(.leading, 6)
                            .padding(.trailing, 10)
                    } else {
                        Text("D-\(self.dday)")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(Color.red)
                            .padding(.leading, 6)
                            .padding(.trailing, 10)
                    }
                    Image(uiImage: (UIImage(named: "ArrowTop")!))
                        .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 16)
                }
                .padding(.vertical, 24)
            }
            Rectangle()
                .fill(Color("MiddleGray"))
                .frame(height: 1)
            if self.isClicked {
                DdayItemDetailLayout(index: index)
            }
        }
    }
}
