//
//  BlankView.swift
//  Devote
//
//  Created by Baptiste on 03/06/2021.
//

import SwiftUI

struct BlankView: View {
    // MARK: - PROPERTIES
    var backgroudColor: Color
    var backgroundOpacity: Double
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
        } //: VSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(backgroudColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - BODY
struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroudColor: Color.black, backgroundOpacity: 0.3)
            .background(BackgroundImageView())
            .background(backgroundGrient.ignoresSafeArea(.all))
    }
}
