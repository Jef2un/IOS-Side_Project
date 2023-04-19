//
//  RegisterView.swift
//  Weather_Shop
//
//  Created by 林帥帥 on 2023/4/17.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State var email: String = ""
    @State var password: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
            VStack{
                Image("music123")
                    .resizable()
                    .scaledToFit()
                    .padding(.top,100)

                // MARK: 輸入帳號密碼
                TextField(text: $email) {
                    Text("輸入E-mail")
                        .font(.title3)
                        .foregroundColor(.white)
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
                
                //MARK: 註冊按鈕
                
                Button {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let e = error{
                            print(e.localizedDescription)

                        }else{
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(height: 50)
                            .foregroundColor(Color("lightBlue"))
                            .cornerRadius(15)
                            .padding()
                        Text("註冊")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.title)
                        
                    }
                }
                Spacer()
            }
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
