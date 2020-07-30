import SwiftUI


struct SelectedListLayout: View {
    @EnvironmentObject var selected: SelectedInfos
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color("MiddleGray"))
                .frame(height: 0.5)
            Group {
                if selected.new.count == 0 {
                    Text("선택한 전형이 없습니다.")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 260, maxHeight: 260)
                        .background(Color("LightGray").edgesIgnoringSafeArea(.bottom))
                } else {
                    VStack(spacing: 0) {
                        ScrollView {
                            VStack(spacing: 0) {
                                ForEach(0..<self.selected.new.count, id: \.self) { i in
                                    VStack(spacing: 0) {
                                        HStack(spacing: 0) {
                                            Text("\(self.selected.new[i].univ) \(self.selected.new[i].sj) \(self.selected.new[i].jh) \(self.selected.new[i].major)")
                                                .font(.system(size: 20))
                                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading, 12)
                                                .padding(.trailing, 6)
                                                .padding(.vertical, 6)
                                            Button(action: { self.selected.new.remove(at: i) }) {
                                                Text("✕")
                                                    .foregroundColor(Color.red)
                                                    .padding(.trailing, 12)
                                            }
                                        }
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
