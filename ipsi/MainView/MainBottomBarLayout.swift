import SwiftUI


struct MainBottomBarLayout: View {
    @Binding var viewNum: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 10)
            HStack(spacing: 0) {
                Spacer()
                Button(action: {self.viewNum = 0}) {
                    VStack(spacing: 0) {
                        Image(uiImage: UIImage(named: "Home")!)
                            .resizable()
                            .frame(width: 28, height: 28)
                            .padding(.bottom, 2)
                        Text("Home")
                            .font(.system(size: 14))
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                Button(action: {self.viewNum = 1}) {
                    VStack(spacing: 0) {
                        Image(uiImage: UIImage(named: "Calendar")!)
                            .resizable()
                            .frame(width: 28, height: 28)
                            .padding(.bottom, 2)
                        Text("Calendar")
                            .font(.system(size: 14))
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                Button(action: {self.viewNum = 2}) {
                    VStack(spacing: 0) {
                        Image(uiImage: UIImage(named: "Review")!)
                            .resizable()
                            .frame(width: 28, height: 28)
                            .padding(.bottom, 2)
                        Text("Review")
                            .font(.system(size: 14))
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
            }
            Spacer()
        }
        .foregroundColor(Color.black)
        .background(Color("LightGray").edgesIgnoringSafeArea(.bottom))
        .frame(height: 60)
    }
}

