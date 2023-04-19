//
//  MusicBox.swift
//  Music_player
//
//  Created by 林帥帥 on 2023/4/18.
//

import SwiftUI



struct MusicBox: View {
    @StateObject var soundsManager: SoundsManager = SoundsManager()
    @State var showImagePicker = false
    @State var image: UIImage?
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
            ScrollView{
                LazyVStack{
                    //MARK: Head
                    HStack{
                        if image != nil {
                            Image(uiImage: image!)
                                .resizable()
                                .frame(width: 30,height: 30)
                                .cornerRadius(10)
                                .padding()
                                .padding(.trailing,-15)
                        } else {
                            Button(action: {
                                self.showImagePicker = true
                            }) {
                                Image("unknow")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .cornerRadius(10)
                                    .padding()
                                    .padding(.trailing,-15)
                            }
                        }

                        Text("你的音樂庫")
                            .modifier(CustomTitleModifier())
                        
                        Spacer()
                        Button {
                            print("123")
                        } label: {
                            Image(systemName: "camera")
                                .modifier(CustomTitleModifier())
                                .padding(.trailing)
                            
                        }
                    }
                    .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                        ImagePicker(image: self.$image, presentationMode: self.$showImagePicker)
                    }
                    
                    Button {
                        soundsManager.playSound(songs: "mymusic")
                        soundsManager.showSheet.toggle()
                    } label: {
                        HStack{
                            Image(systemName: "heart.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 70,height: 70)
                                .background(LinearGradient(colors: [.blue,.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                            Text("已按讚的歌曲")
                                .foregroundColor(.white)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal)

                    }
                }
            }
        }
        .environmentObject(soundsManager)
        .sheet(isPresented: $soundsManager.showSheet) {
            ZStack{
                Color.black
                VStack{
                    ProgressView(value: soundsManager.progress)
                        .frame(height: 5)
                        .accentColor(.white)
                        .background(Color.gray)
                        .padding()
                    Button {
                        soundsManager.pauseMusic()
                    } label: {
                        Image(systemName: "playpause")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
            }
            .ignoresSafeArea()
            .presentationDetents([.fraction(0.1)])
            .presentationDragIndicator(.hidden)

        }
    }
    func loadImage() {
        guard image != nil else { return }
        // 處理圖像
    }
}



struct MusicBox_Previews: PreviewProvider {
    static var previews: some View {
        MusicBox()
    }
}
