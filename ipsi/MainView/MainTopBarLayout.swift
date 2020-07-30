import SwiftUI


struct MainTopBarLayout: View {
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("입시달력: 입력")
                    .font(.system(size: 22, weight: .semibold))
                    .padding(.horizontal, 16)
                Spacer()
                NavigationLink(destination: SelectRequestView()
                    .environmentObject(self.selected)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                ) {
                    Image(uiImage: (UIImage(named: "Edit")!))
                        .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.horizontal, 12)
                }
            }
            .frame(height: 60)
            .background(Color("LightGray").edgesIgnoringSafeArea(.top))
            Rectangle()
                .fill(Color("MiddleGray"))
                .frame(height: 0.5)
        }
    }
}
