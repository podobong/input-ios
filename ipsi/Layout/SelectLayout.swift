import SwiftUI


struct SelectLayout: View {
    var allUnivs: [Univ]
    @EnvironmentObject var selected: Univs
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                SelectTopBarLayout()
                AllUnivListLayout(allUnivs: self.allUnivs).environmentObject(self.selected)
                SelectedListLayout().environmentObject(self.selected)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}
