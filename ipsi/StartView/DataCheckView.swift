import SwiftUI


struct DataCheckView: View {
    @State var statusCode: Int = 0
    @State var data = Data()
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        let uuid: String = UIDevice.current.identifierForVendor?.uuidString ?? ""
        self.request(url: "http://ec2-54-180-101-171.ap-northeast-2.compute.amazonaws.com/?id=\(uuid)")
        
        return Group {
            if self.statusCode == 0 {
                LoadingLayout()
            } else if self.statusCode == 400 {
                SelectRequestView().environmentObject(self.selected)
            } else if self.statusCode == 200 {
                MainView().environmentObject(self.selected)
            } else {
                ErrorLayout()
            }
        }
    }
    
    func request(url: String) {
        get(url: url) { (data, response) in
            self.statusCode = response.statusCode
            if response.statusCode == 200 {
                self.data = data
            }
        }
    }
}
