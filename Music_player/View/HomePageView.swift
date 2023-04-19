//
//  ContentView.swift
//  Music_player
//
//  Created by 林帥帥 on 2023/4/18.
//

import SwiftUI

struct HomePageView: View {
    
    @State private var progress: Float = 0.0
    
    @StateObject var locationDataManager = LocationDataManager()
    
    @ObservedObject var weatherManager = WeatherManager()

    private let rankArray:[String] = ["rank1","rank2","rank3","rank4","rank5"]
    
    private let poCastRanking:[String] = ["popcast1","popcast2","popcast3","popcast4","popcast5","popcast6","popcast7"]
    
    private let singerArray:[String] = ["singer1","singer2","singer3","singer4","singer5","singer6",]
    
    private let styleArray:[String] = ["style1","style2","style3","style4","style5","style6",]
    var body: some View {
        NavigationView {
            ZStack{
                Rectangle()
                    .ignoresSafeArea()
                ScrollView{
                    LazyVStack{
                        //MARK: Head
                        HStack{
                            
                            Text("你好!")
                                .modifier(CustomTitleModifier())
                                .padding(.leading)
                            Image(systemName:"\(conditionName(id:weatherManager.id))")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 50,height: 50)
                            Text("\(String(format: "%.0f",weatherManager.temp ))\u{2103}")
                                .foregroundColor(.white)
                                .font(.title)
                            Spacer()

                            NavigationLink {
                                ReminderDetailView()
                            } label: {
                                Image(systemName: "bell")
                                    .modifier(CustomTitleModifier())
                            }
                            NavigationLink {
                                ListenedDetailView()
                            } label: {
                                Image(systemName: "clock")
                                    .modifier(CustomTitleModifier())
                            }
                        

                        }

                        //MARK: BODY
                        
                        //MARK: 排行榜
                        HStack{
                            Text("排行榜")
                                .modifier(CustomTitleModifier())
                                .padding(.horizontal)
                            Spacer()
                        }
                        ScrollView(.horizontal){
                            LazyHStack{
                                ForEach(rankArray,id: \.self) { i in
                                    Button {
                                        print("123")
                                    } label: {
                                        Image(i)
                                            .resizable()
                                            .frame(width: 150,height: 150)
                                            .padding(.leading)
                                            .padding(.trailing,-15)
                                    }
                                    
                                }
                            }
                            .padding(.bottom)
                        }
                        //MARK: 熱門電台
                        HStack{
                            Text("熱門電台")
                                .modifier(CustomTitleModifier())
                                .padding(.horizontal)
                            Spacer()
                        }
                        ScrollView(.horizontal){
                            LazyHStack{
                                ForEach(poCastRanking,id: \.self) { i in
                                    Button {
                                        print("123")
                                    } label: {
                                        Image(i)
                                            .resizable()
                                            .frame(width: 150,height: 150)
                                            .padding(.leading)
                                            .padding(.trailing,-15)
                                    }
                                    
                                }
                            }
                            .padding(.bottom)
                        }
                        //MARK: 熱門藝人
                        HStack{
                            Text("熱門藝人")
                                .modifier(CustomTitleModifier())
                                .padding(.horizontal)
                            Spacer()
                        }
                        ScrollView(.horizontal){
                            LazyHStack{
                                ForEach(singerArray,id: \.self) { i in
                                    Button {
                                        print("123")
                                    } label: {
                                        Image(i)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150,height: 150)
                                            .cornerRadius(75)
                                            .padding(.leading)
                                            .padding(.trailing,-15)
                                    }
                                    
                                }
                            }
                            .padding(.bottom)
                        }
                        //MARK: 指定風格
                        
                        HStack{
                            Text("指定風格")
                                .modifier(CustomTitleModifier())
                                .padding(.horizontal)
                            Spacer()
                        }
                        ScrollView(.horizontal){
                            LazyHStack{
                                ForEach(styleArray,id: \.self) { i in
                                    Button {
                                        print("123")
                                    } label: {
                                        Image(i)
                                            .resizable()
                                            .frame(width: 150,height: 150)
                                            .padding(.leading)
                                            .padding(.trailing,-15)
                                    }
                                    
                                }
                            }
                            .padding(.bottom)
                        }
                    }
                }
                }
                
        }
        .onAppear {
            weatherManager.fetchWeather(cityName: "Taipei")

        }
        
    }
}
func conditionName(id:Int) -> String{
    switch id {
    case 200...232:
        return "cloud.bolt"
    case 300...321:
        return "cloud.drizzle"
    case 500...531:
        return "cloud.rain"
    case 600...622:
        return "cloud.snow"
    case 701...781:
        return "cloud.fog"
    case 800:
        return "sun.max"
    case 801...804:
        return "cloud"
    default:
        return "cloud"
    }
}

//MARK: CustomTitleModifier
struct CustomTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .bold()
            .padding(.trailing)
    }
}



struct SwitchTabView: View{
    @State var tabViewSelection: Int = 0
    @EnvironmentObject var soundsManager: SoundsManager
    var body: some View {
        ZStack{
            TabView(selection: $tabViewSelection) {
                HomePageView()
                    .tabItem {
                        Label("首頁",systemImage: "house.fill")
                            .foregroundColor(.white)
                    }
                    .tag(0)
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color.black,for: .tabBar)
                SearchView()
                    .tabItem {
                        Label("搜尋",systemImage: "magnifyingglass.circle.fill")
                            .foregroundColor(.white)
                    }
                    .tag(0)
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color.black,for: .tabBar)
                MusicBox()
                    .tabItem {
                        Label("你的音樂庫",systemImage: "books.vertical")
                            .foregroundColor(.white)
                    }
                    .tag(0)
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color.black,for: .tabBar)
            }
            .accentColor(.white)
        }
    }
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchTabView()
    }
}
