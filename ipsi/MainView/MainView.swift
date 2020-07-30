import SwiftUI
import SwiftyJSON


struct MainView: View {
    @State var viewNum: Int = 0
    @State var images = [Data](repeating: Data(), count: 1000)
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                MainTopBarLayout()
                    .environmentObject(self.selected)
                self.SwitchView()
                MainBottomBarLayout(viewNum: self.$viewNum)
            }.onAppear {
                for (i, univ) in self.selected.old.enumerated() {
                    get(url: univ.logo) { (data, _) in
                        self.images[i] = data
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func SwitchView() -> AnyView {
        return AnyView(Group {
            if self.viewNum == 0 {
                DdayLayout(images: self.$images)
                    .environmentObject(self.selected)
            } else if self.viewNum == 1 {
                CalendarLayout(images: self.$images)
                    .environmentObject(self.selected)
            } else {
                ReviewLayout(images: self.$images)
                    .environmentObject(self.selected)
            }
        })
    }
}
