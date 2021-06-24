//
//  StartButtonView.swift
//  GreenBook
//
//  Created by Pablo Guarneros on 6/22/21.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // MARK: - BODY
    var body: some View {
        Button(action:{
            isOnboarding = false
        }){
            HStack (spacing: 15){
                Text("Start Journey")
                    .font(Font.custom("Solway-Regular",size:21))
            }
            .padding(.horizontal, 39)
            .padding(.vertical, 18)
            .background(
                Capsule().strokeBorder(Color .white,lineWidth:1.75)
            )
    }                     .foregroundColor(.white)
//: BUTTON
    }
}

// MARK: - PREVIEW

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
