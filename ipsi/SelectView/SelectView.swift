import SwiftUI
import SwiftyJSON


struct SelectView: View {
    @State var images = [Data](repeating: Data(), count: 1000)
    @Binding var json: JSON
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        let allUnivs: [Univ] = parseUnivList(json: self.json)
        
        return Group {
            if json.isEmpty {
                LoadingLayout()
            } else {
                SelectLayout(allUnivs: allUnivs, images: self.$images)
                    .environmentObject(self.selected)
                    .onAppear {
                        for (i, univ) in allUnivs.enumerated() {
                            get(url: univ.logo) { (data, _) in
                                self.images[i] = data
                        }
                    }
                }
            }
        }
    }
}
