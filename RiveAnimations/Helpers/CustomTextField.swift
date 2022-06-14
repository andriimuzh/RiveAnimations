//
//  CustomTextField.swift
//  RiveAnimations
//
//  Created by Andrii Muzh on 10.06.2022.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    var iconName: TextInputIconNames
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .overlay(
                RoundedRectangle(
                    cornerRadius: 15,
                    style: .continuous
                )
                .stroke()
                .fill(.black.opacity(0.1))
            )
            .overlay(
                Image(iconName.rawValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
            )
    }
}

extension View {
    func customTextFiled(iconName: TextInputIconNames) -> some View {
        modifier(CustomTextField(iconName: iconName))
    }
}

enum TextInputIconNames: String {
    case Email = "Icon Email"
    case Password = "Icon Lock"
}
