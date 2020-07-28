import SwiftUI
import SwiftyJSON


struct MainView: View {
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        VStack(spacing: 0) {
            MainTopBarLayout()
            DdayLayout().environmentObject(self.selected)
        }
    }
}
