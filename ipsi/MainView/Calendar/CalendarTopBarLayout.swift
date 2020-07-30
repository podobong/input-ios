import SwiftUI


struct CalendarTopBarLayout: View {
    @Binding var pageNum: Int
    @Binding var isFirstPage: Bool
    @Binding var isLastPage: Bool
    var pageYear: Int
    var pageMonth: Int
    
    var body: some View {
        return VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button(action: {
                    if (self.pageNum > 0) {
                        self.pageNum -= 1
                    } else {
                        self.isFirstPage.toggle()
                    }
                }) {
                    Image(uiImage: UIImage(named: "ArrowLeft")!)
                        .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.horizontal, 10)
                }
                Spacer()
                Text("\(String(self.pageYear))년 \(self.pageMonth)월")
                    .font(.system(size: 22))
                    .padding(.vertical, 14)
                Spacer()
                Button(action: {
                    if (self.pageNum < MAX_PAGE - 1) {
                        self.pageNum += 1
                    } else {
                        self.isLastPage.toggle()
                    }
                }) {
                    Image(uiImage: UIImage(named: "ArrowRight")!)
                        .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.horizontal, 10)
                }
            }
            Rectangle()
                .fill(Color("MiddleGray"))
                .frame(height: 1)
        }
    }
}
