import SwiftUI


struct SelectLayout: View {
    var allUnivs: [Univ]
    @Binding var images: [Data]
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        NavigationView {
            GeometryReader { metrics in
                VStack(spacing: 0) {
                    SelectTopBarLayout()
                        .environmentObject(self.selected)
                    AllUnivListLayout(allUnivs: self.allUnivs, images: self.$images)
                        .environmentObject(self.selected)
                    SelectedListLayout()
                        .frame(height: metrics.size.height * 0.3)
                        .environmentObject(self.selected)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}
