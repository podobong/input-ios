import SwiftUI


struct PostRequestView: View {
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        post(url: "http://ec2-54-180-101-171.ap-northeast-2.compute.amazonaws.com/", params: createPostParams()) { (_, _) in }
        
        return DataCheckView()
            .environmentObject(SelectedInfos())
    }
    
    func createPostParams() -> [String: String] {
        var params: [String: String] = [:]
        params.updateValue(UIDevice.current.identifierForVendor?.uuidString ?? "", forKey: "id")
        params.updateValue(UIDevice.current.identifierForVendor?.uuidString ?? "", forKey: "token")
        params.updateValue(String(self.selected.new.count), forKey: "num")
        for (i, info) in self.selected.new.enumerated() {
            params.updateValue(info.univ, forKey: "univ\(i)")
            params.updateValue(info.sj, forKey: "sj\(i)")
            params.updateValue(info.jh, forKey: "jh\(i)")
            params.updateValue(info.major, forKey: "major\(i)")
        }
        return params
    }
}
