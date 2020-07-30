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
                Spacer()
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    Text("✕")
                        .font(.system(size: 24))
                        .foregroundColor(Color.red)
                }
            }
            .padding(.top, 10)
            .padding(.trailing, 10)
            HStack(spacing: 0) {
                Image(uiImage: (UIImage(data: self.image) ?? UIImage(named: "Blank")!))
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 16)
                Text(self.univ.name)
                    .foregroundColor(Color.black)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(height: 60)
            }
            .padding(.bottom, 30)
            Spacer()
            HStack(spacing: 0) {
                Text("수시/정시")
                    .font(.system(size: 20))
                    .frame(width: 100)
                Picker(
                    selection: self.$pickerInfo.sjNum,
                    label: Text("")
                ) { Text("수시") }
                /* Use when jeongsi data added
                Picker(selection: self.$pickerInfo.sjNum, label: Text("수시/정시")) {
                    ForEach(0..<self.univ.sjs.count, id: \.self) { i in
                        Text(self.univ.sjs[i].type)
                    }
                }
                */
                .frame(width: 270, height: 100)
                .clipped()
                .padding(.trailing, 10)
            }
            HStack(spacing: 0) {
                Text("전형")
                    .font(.system(size: 20))
                    .frame(width: 100)
                Picker(
                    selection: self.$pickerInfo.jhNum,
                    label: Text("")
                ) {
                    ForEach(0..<self.univ.sjs[self.pickerInfo.sjNum].jhs.count, id: \.self) { i in
                        Text(self.univ.sjs[self.pickerInfo.sjNum].jhs[i].name)
                    }
                }
                .id(self.pickerInfo.id)
                .frame(width: 270, height: 170)
                .clipped()
                .padding(.trailing, 10)
            }
            HStack(spacing: 0) {
                Text("학과")
                    .font(.system(size: 20))
                    .frame(width: 100)
                Picker(
                    selection: self.$pickerInfo.majorNum,
                    label: Text("")
                ) {
                    ForEach(0..<self.univ.sjs[self.pickerInfo.sjNum].jhs[self.pickerInfo.jhNum].majors.count, id: \.self) { i in
                        Text(self.univ.sjs[self.pickerInfo.sjNum].jhs[self.pickerInfo.jhNum].majors[i].name)
                    }
                }
                .id(self.pickerInfo.id)
                .frame(width: 270, height: 170)
                .clipped()
                .padding(.trailing, 10)
            }
            Button(action: {
                self.selected.new.append(SelectedInfo(
                    univ: self.univ.name,
                    logo: self.univ.logo,
                    reviewUrl: self.univ.reviewUrl,
                    sj: self.univ.sjs[self.pickerInfo.sjNum].type,
                    jh: self.univ.sjs[self.pickerInfo.sjNum].jhs[self.pickerInfo.jhNum].name,
                    major: self.univ.sjs[self.pickerInfo.sjNum].jhs[self.pickerInfo.jhNum].majors[self.pickerInfo.majorNum].name
                ))
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("확인").padding(.top, 30)
            }
            Spacer()
        }
    }
}
