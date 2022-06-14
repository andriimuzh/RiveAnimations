//
//  CustomFont.swift
//  RiveAnimations
//
//  Created by Andrii Muzh on 10.06.2022.
//

import SwiftUI

struct CustomFont: ViewModifier {
    var textStyle: TextStyle
    
    var name: String {
        switch textStyle {
        case .title1, .title2, .title3, .title4, .title5, .title6:
            return "Poppins Bold"
        case .body, .subhead, .footnote, .caption:
            return "Inter Regular"
        case .headline, .subhead2, .footnote2, .caption2:
            return "Inter SemiBold"
        }
    }
    
    var size: CGFloat {
        switch textStyle {
        case .title1:
            return 60
        case .title2:
            return 40
        case .title3:
            return 34
        case .title4:
            return 28
        case .title5:
            return 24
        case .title6:
            return 20
        case .body:
            return 17
        case .headline:
            return 17
        case .subhead:
            return 15
        case .subhead2:
            return 15
        case .footnote:
            return 13
        case .footnote2:
            return 13
        case .caption:
            return 12
        case .caption2:
            return 12
        }
    }
    
    var relative: Font.TextStyle {
        switch textStyle {
        case .title1:
            return .largeTitle
        case .title2:
            return .largeTitle
        case .title3:
            return .title
        case .title4:
            return .title
        case .title5:
            return .title2
        case .title6:
            return .title3
        case .body:
            return .body
        case .headline:
            return .headline
        case .subhead:
            return .subheadline
        case .subhead2:
            return .subheadline
        case .footnote:
            return .footnote
        case .footnote2:
            return .footnote
        case .caption:
            return .caption
        case .caption2:
            return .caption
        }
    }
    
    
    func body(content: Content) -> some View {
        content.font(.custom(name, size: size, relativeTo: relative))
    }
}

extension View {
    func customFont(_ textStyle: TextStyle) -> some View {
        modifier(CustomFont(textStyle: textStyle))
    }
}


enum TextStyle {
    case title1
    case title2
    case title3
    case title4
    case title5
    case title6
    case body
    case headline
    case subhead
    case subhead2
    case footnote
    case footnote2
    case caption
    case caption2
}
