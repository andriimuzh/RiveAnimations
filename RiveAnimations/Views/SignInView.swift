//
//  SignInView.swift
//  RiveAnimations
//
//  Created by Andrii Muzh on 10.06.2022.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Sign In")
                .customFont(.title3)
            Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.")
                .customFont(.subhead2)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Email")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextFiled(iconName: .Email)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Password")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                SecureField("", text: $password)
                    .customTextFiled(iconName: .Password)
            }
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 20, height: 14)
                        .foregroundColor(Color(hex: "#EF001D"))
                    Text("Sign In")
                        .customFont(.headline)
                }
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color(hex: "#F77D8E"))
            .foregroundColor(.white)
            .cornerRadius(10, corners: [.topLeft])
            .cornerRadius(25, corners: [.topRight, .bottomRight, .bottomLeft])
            .shadow(color: Color(hex: "#F77D8E").opacity(0.5), radius: 20, x: 0, y: 10)
            
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.1)
                Text("OR")
                    .customFont(.footnote2)
                    .foregroundColor(.black.opacity(0.3))
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.1)
            }
            
            
            Text("Sign up with Email, Apple or Google")
                .customFont(.footnote)
            HStack {
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 48)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.9), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
