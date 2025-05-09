//
//  HeaderView.swift
//  Maintenance Mate
//
//  Created by Fernando Cardona on 3/19/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(background)
                .rotationEffect(Angle(degrees: angle))

            VStack{
                Text(title)
                    .font(.system(size: 40))
                    .foregroundStyle(Color.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.white)
            }
            .padding(.top, 80)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subtitle: "Subtitle",
                   angle: 15,
                   background: .blue)
    }
}
