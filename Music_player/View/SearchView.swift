//
//  SearchView.swift
//  Music_player
//
//  Created by 林帥帥 on 2023/4/18.
//

import SwiftUI

struct SearchView: View {
    private let array:[String] = ["rank1","rank2","rank3","rank4","rank5","style1","style2","style3","style4","style5","style6","style7","style8","style9","style10","style11","style12"]
    @State var searchInput: String = ""
    let colums:[GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
            ScrollView {
                LazyVStack{
                    //MARK: Head
                    HStack{
                        Text("搜尋")
                            .modifier(CustomTitleModifier())
                            .padding()
                        
                        Spacer()
                    }
                    //MARK: SEARCHBAR
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 40)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .font(.title2)
                                .padding(.leading)
                            TextField(text: $searchInput) {
                                Text("想聽什麼?")
                            }
                            
                        }
                        .padding()
                    }
                    //MARK: SECTION ALL
                    HStack{
                        Text("瀏覽全部")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                        Spacer()
                    }
                    LazyVGrid(columns: colums){
                        ForEach(array,id: \.self) { i in
                            Button {
                                print("123")
                            } label: {
                                Image(i)
                                    .resizable()
                                    .frame(height: 100)
                                    .padding(.leading)
                                    .padding(.bottom)
                                    .cornerRadius(10)
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
