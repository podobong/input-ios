import SwiftUI
import SwiftyJSON

 
struct SelectRequestView: View {
    @State var statusCode: Int = 0
    @State var data = Data()
    @State var json = JSON()
    @EnvironmentObject var selected: Univs
    
    var body: some View {
        self.request(url: "http://ec2-54-180-101-171.ap-northeast-2.compute.amazonaws.com/")
        
        return Group {
            if self.statusCode == 0 {
                LoadingLayout()
            } else if self.statusCode == 200 {
                SelectView(json: self.$json).onAppear {
                    do { try self.json = JSON(data: self.data) } catch { }
                }.environmentObject(self.selected)
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
