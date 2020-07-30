import SwiftUI


struct ReviewItemLayout: View {
    var index: Int
    var image: Data
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationLink(
                destination: WebView(request: URLRequest(url: URL(string: selected.old[index].reviewUrl)!))
                    .navigationBarTitle("입시달력: 입력", displayMode: .inline)
            ) {
                HStack(spacing: 0) {
                    Image(uiImage: (UIImage(data: self.image) ?? UIImage(named: "Blank")!))
                        .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 76, height: 76)
                        .padding(.horizontal, 20)
                    VStack(spacing: 0) {
                        Text(self.selected.old[index].univ)
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Spacer().frame(height: 5)
                        Text("대학 리뷰 보러가기")
                            .font(.system(size: 18))
                            .foregroundColor(Color("DarkDarkGray"))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(.vertical, 20)
            Rectangle()
                .fill(Color("MiddleGray"))
                .frame(height: 1)
        }
    }
}
