import SwiftUI
import SwiftyJSON


struct DataCheckView: View {
    @State var statusCode: Int = 0
    @State var data = Data()
    @State var json = JSON()
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        let uuid: String = UIDevice.current.identifierForVendor?.uuidString ?? ""
        self.request(url: "http://ec2-54-180-101-171.ap-northeast-2.compute.amazonaws.com/", params: ["id": uuid])
        
        return Group {
            if self.statusCode == 0 {
                LoadingLayout()
            } else if self.statusCode == 400 {
                SelectRequestView()
                    .environmentObject(self.selected)
            } else if self.statusCode == 200 {
                MainView().environmentObject(self.selected).onAppear {
                    do { try self.json = JSON(data: self.data) } catch { }
                    self.selected.univs = seperateMajors(univs: parseSelectedList(json: self.json))
                }
            } else {
                ErrorLayout()
            }
        }
    }
    
    func request(url: String, params: [String: String]) {
        get(url: url, params: params) { (data, response) in
            self.statusCode = response.statusCode
            if response.statusCode == 200 {
                self.data = data
            }
        }
    }
}
