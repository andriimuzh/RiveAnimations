//
//  HCard.swift
//  RiveAnimations
//
//  Created by Andrii Muzh on 15.06.2022.
//

import SwiftUI

struct HCard: View {
    var section: CourseSection
    
    var body: some View {
        HStack (spacing: 16) {
            VStack (alignment: .leading, spacing: 8) {
                Text(section.title)
                    .customFont(.title5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(section.caption)
                    .customFont(.subhead)
            }
            Divider()
            section.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(section.color)
        .foregroundColor(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct HCard_Previews: PreviewProvider {
    static var previews: some View {
        HCard(section: courseSections[0])
    }
}
