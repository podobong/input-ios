import SwiftUI


struct SelectedListLayout: View {
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color("MiddleGray"))
                .frame(height: 0.5)
            Group {
                if selected.univs.count == 0 {
                    Text("선택한 전형이 없습니다.")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 260, maxHeight: 260)
                        .background(Color("LightGray").edgesIgnoringSafeArea(.bottom))
                } else {
                    VStack(spacing: 0) {
                        ScrollView {
                            VStack(spacing: 0) {
                                ForEach(0..<self.selected.univs.count, id: \.self) { i in
                                    VStack(spacing: 0) {
                                        Text("\(self.selected.univs[i].univ) \(self.selected.univs[i].sj) \(self.selected.univs[i].jh) \(self.selected.univs[i].major)")
                                            .font(.system(size: 20))
                                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                        Rectangle()
                                            .fill(Color("MiddleGray"))
                                            .frame(height: 0.5)
                                    }
                                }
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 260, maxHeight: 260)
                    .background(Color("LightGray").edgesIgnoringSafeArea(.bottom))
                }
            }
        }
    }
}
