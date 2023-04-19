//
//  DetailView.swift
//  Music_player
//
//  Created by 林帥帥 on 2023/4/19.
//

import SwiftUI

struct ReminderDetailView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Rectangle()
                    .ignoresSafeArea()
               VStack{
                    //MARK: Head
                    HStack{
                        Text("你關注得藝人和Podcast節目最新發行的內容。")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal,20)
                    Spacer()
                   Text("還沒有任何更新")
                       .modifier(CustomTitleModifier())
                       .padding()
                   Text("有更新時我們會在此發佈。關注你最愛得藝人和Podcast，隨時掌握他們得最新動態。")
                       .frame(alignment: .center)
                       .foregroundColor(.white)
                   Spacer()
                }
            }
            .navigationTitle("最新發行")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)

        }
    }
}

struct ListenedDetailView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Rectangle()
                    .ignoresSafeArea()
               VStack{
                    //MARK: Head
                    HStack{
                        Text("你昨天聽的歌曲和Podcast節目的內容。")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal,20)
                    Spacer()
                   Text("最近都沒聽歌")
                       .modifier(CustomTitleModifier())
                       .padding()
                   Text("有聽歌時我們會在此顯示，方便你日後聽回味。")
                       .frame(alignment: .center)
                       .foregroundColor(.white)
                   Spacer()
                }
            }
            .navigationTitle("最近播放")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)

        }
    }
}

struct ReminderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListenedDetailView()
    }
}
