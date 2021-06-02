//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Baptiste on 03/06/2021.
//

import SwiftUI

struct BackgroundImageView: View {
    // MARK: - BODY
    var body: some View {
        // BACKGROUND IMAGE
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

// MARK: - PREVEIW
struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
