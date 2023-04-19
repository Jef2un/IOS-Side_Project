//
//  LoginView.swift
//  Weather_Shop
//
//  Created by 林帥帥 on 2023/4/15.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var register: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @State var userLogin: Bool = false
    var body: some View {
        NavigationView {
            ZStack{
                Rectangle()
                    .ignoresSafeArea()
                VStack{
                    
                    Spacer()
                    //MARK: 雨傘Logo
                
                    Image("music123")
                        .resizable()
                        .scaledToFit()
                    
                    // MARK: 輸入帳號密碼
                    TextField(text: $email) {
                        Text("輸入Email")
                            .foregroundColor(.white)
                            .font(.title3)
                    }
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(15)
                    .padding()
                    
                    SecureField(text: $password) {
                        Text("輸入密碼")
                            .font(.title3)
                            .foregroundColor(.white)

                    }
                    .textContentType(.password)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    //MARK: 登入按鈕
                    
                        Button {
                            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                                if let e = error {
                                    print(e.localizedDescription)
                                } else {
                                    print("Login success")
                                    userLogin = true
                                }
                            }
                            
                        } label: {
                            ZStack{
                                Rectangle()
                                    .frame(height: 50)
                                    .foregroundColor(Color("lightBlue"))
                                    .cornerRadius(15)
                                    .padding()
                                Text("登入")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                        }
                        .fullScreenCover(isPresented: $userLogin) {
                            SwitchTabView()
                        }

                    //MARK: 分隔線
                    
                    HStack{
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.white)

                        Text("還沒註冊?")
                            .foregroundColor(.white)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.white)

                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical,-10)
                    
                    //MARK: 忘記密碼及登入
                    HStack{
                        Spacer()
                        Button {
                            print("123")
                        } label: {
                            Text("忘記密碼")
                                .foregroundColor(.white)

                        }
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Button {
                            register.toggle()
                        } label: {
                            Text("註冊帳號")
                                .foregroundColor(.white)

                        }
                        .sheet(isPresented: $register) {
                            RegisterView()
                        }
                        
                        
                        Spacer()
                    }
                    .padding()
                    Spacer()
                    
                    //MARK: 連結登入分隔線
                    
                    HStack{
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.gray)
                        Text("尚未串通API")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                            .scaledToFill()
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.gray)
                    }
                    .padding()
                    
                    
                    //MARK: 登入渠道
                    HStack{
                        Button {
                            print("ksjdbnvkdjbncv")
                        } label: {
                            Image("facebook")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .padding(.horizontal)
                        }
                        Button {
                            print("ksjdbnvkdjbncv")
                        } label: {
                            Image("line")
                                .resizable()
                                .frame(width: 35,height: 35)
                                .padding(.horizontal)
                        }
                        Button {
                            print("ksjdbnvkdjbncv")
                        } label: {
                            Image("google")
                                .resizable()
                                .frame(width: 27,height: 27)
                                .padding(.horizontal)
                        }
                        
                    }
                }
            }
            }
            
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
