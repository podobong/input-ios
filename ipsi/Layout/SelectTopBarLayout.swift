import SwiftUI


struct SelectTopBarLayout: View {
    @EnvironmentObject var selected: Univs
    
    var body: some View {
        HStack {
            Text("대학전형을 선택해주세요")
                .font(.system(size: 20))
                .padding(.horizontal, 16)
            Spacer()
            NavigationLink(destination: PostRequestView()
                .environmentObject(self.selected)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            ) {
                Text("선택완료")
                    .font(.system(size: 17))
                    .foregroundColor(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .fill(Color("MainColor"))
                            .frame(width: 80, height: 44)
                    )
                    .frame(width: 80, height: 44)
                    .padding(.horizontal, 12)
            }
        }
        .frame(height: 60)
        .background(Color("LightGray"))
    }
}
