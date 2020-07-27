import SwiftUI
import SwiftyJSON


struct SelectView: View {
    @Binding var json: JSON
    @EnvironmentObject var selected: Univs
    
    var body: some View {
        let allUnivs: [Univ] = self.parseUnivList()
        
        return Group {
            if json.isEmpty {
                LoadingLayout()
            } else {
                SelectLayout(allUnivs: allUnivs).environmentObject(self.selected)
            }
        }
    }
    
    func parseUnivList() -> [Univ] {
        var univs: [Univ] = []
        
        for univ in self.json.arrayValue {
            let dict: [String: JSON] = univ.dictionaryValue
            let name: String = dict["name"]!.rawString()!
            let logo: String = dict["logo"]!.rawString()!
            let reviewUrl: String = dict["review_url"]!.rawString()!
            var sjs: [SJ] = []
            for sj in dict["sjs"]!.arrayValue {
                let dict: [String: JSON] = sj.dictionaryValue
                let type: String = dict["sj"]!.rawString()!
                var jhs: [JH] = []
                for jh in dict["jhs"]!.arrayValue {
                    let dict: [String: JSON] = jh.dictionaryValue
                    let name: String = dict["name"]!.rawString()!
                    var majors: [Major] = []
                    for major in dict["majors"]!.arrayValue {
                        majors.append(Major(name: major.dictionaryValue["name"]!.rawString()!))
                    }
                    jhs.append(JH(name: name, majors: majors))
                }
                sjs.append(SJ(type: type, jhs: jhs))
            }
            univs.append(Univ(name: name, logo: logo, reviewUrl: reviewUrl, sjs: sjs))
        }
        return univs
    }
}
