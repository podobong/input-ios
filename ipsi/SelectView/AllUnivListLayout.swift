import SwiftUI


struct AllUnivListLayout: View {
    var allUnivs: [Univ]
    @State var isClicked: Bool = false
    @State var clickedUnivNum: Int = -1
    @Binding var images: [Data]
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<allUnivs.count, id: \.self) { i in
                    Button(action: {
                        self.isClicked.toggle()
                        self.clickedUnivNum = i
                    }) {
                        HStack(spacing: 0) {
                            Image(uiImage: (UIImage(data: self.images[i]) ?? UIImage(named: "Blank")!))
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                .resizable()
                                .frame(width: 60, height: 60)
                                .padding(.leading, 16)
                                .padding(.trailing, 12)
                            Text(self.allUnivs[i].name)
                                .foregroundColor(Color.black)
                                .font(.system(size: 22))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                    }.sheet(isPresented: self.$isClicked) {
                        UnivDetailLayout(univ: self.allUnivs[self.clickedUnivNum], image: self.images[self.clickedUnivNum])
                            .environmentObject(self.selected)
                    }
                }
            }
        }
    }
}
