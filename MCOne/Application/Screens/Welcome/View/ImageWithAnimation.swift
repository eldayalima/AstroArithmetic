//
//  ImageWithAnimation.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 18/08/23.
//

import SwiftUI

struct ImageWithAnimation: View {
    var blinking : Bool = false
    var imgName: String
    
    var body: some View {
        Image(imgName)
            .resizable()
            .opacity(blinking ? 0.5 : 1)
            .animation(.easeInOut(duration: 1).repeatForever(), value: blinking)
    }
}

//struct ImageWithAnimation_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageWithAnimation(imgName: "light_astro")
//    }
//}
