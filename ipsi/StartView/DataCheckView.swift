import SwiftUI


struct DataCheckView: View {
    @EnvironmentObject var response: Response
    @EnvironmentObject var selectedUnivs: Univs
    
    var body: some View {
        self.dataCheck(url: "http://ec2-54-180-101-171.ap-northeast-2.compute.amazonaws.com/?id=\(UUID().uuidString)")
        
        return Group {
            if self.response.statusCode == 0 {
                LoadingLayout()
            } else if self.response.statusCode == 400 {
                SelectRequestView()
            } else if self.response.statusCode == 200 {
                MainView()
                    .environmentObject(self.response)
                    .environmentObject(self.selectedUnivs)
            } else {
                ErrorLayout()
            }
        }
    }
    
    func dataCheck(url: String) {
        get(url: url) { (data, response) in
            DispatchQueue.main.async {
                self.response.statusCode = response.statusCode
                if response.statusCode == 200 {
                    self.response.text = String(data: data, encoding: .utf8) ?? ""
                }
            }
        }
    }
}
