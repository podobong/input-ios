import SwiftUI


struct UnivDetailLayout: View {
    var univ: Univ
    var image: Data
    @ObservedObject var pickerInfo = PickerInfo()
    @EnvironmentObject var selected: SelectedInfos
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(uiImage: (UIImage(data: self.image) ?? UIImage(named: "Blank")!))
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.leading, 16)
                    .padding(.trailing, 12)
                Text(self.univ.name)
                    .foregroundColor(Color.black)
                    .font(.system(size: 24))
            }
            Picker(selection: self.$pickerInfo.sjNum, label: Text("수시/정시")) {
                Text("수시")
            }
            /* Use when jeongsi data added
            Picker(selection: self.$pickerInfo.sjNum, label: Text("수시/정시")) {
                ForEach(0..<self.univ.sjs.count, id: \.self) { i in
                    Text(self.univ.sjs[i].type)
                }
            }
            */
            .frame(height: 100)
            Picker(selection: self.$pickerInfo.jhNum, label: Text("전형")) {
                ForEach(0..<self.univ.sjs[self.pickerInfo.sjNum].jhs.count, id: \.self) { i in
                    Text(self.univ.sjs[self.pickerInfo.sjNum].jhs[i].name)
                }
            }
            .id(self.pickerInfo.id)
            .frame(height: 170)
            Picker(selection: self.$pickerInfo.majorNum, label: Text("학과")) {
                ForEach(0..<self.univ.sjs[self.pickerInfo.sjNum].jhs[self.pickerInfo.jhNum].majors.count, id: \.self) { i in
                    Text(self.univ.sjs[self.pickerInfo.sjNum].jhs[self.pickerInfo.jhNum].majors[i].name)
                }
            }
            .id(self.pickerInfo.id)
            .frame(height: 170)
            Button(action: {
                self.selected.univs.append(SelectedInfo(
                    univ: self.univ.name,
                    sj: self.univ.sjs[self.pickerInfo.sjNum].type,
                    jh: self.univ.sjs[self.pickerInfo.sjNum].jhs[self.pickerInfo.jhNum].name,
                    major: self.univ.sjs[self.pickerInfo.sjNum].jhs[self.pickerInfo.jhNum].majors[self.pickerInfo.majorNum].name
                ))
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("확인")
            }
        }
    }
}
