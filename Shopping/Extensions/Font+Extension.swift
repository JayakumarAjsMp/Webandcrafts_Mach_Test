//
//  Image+Extension.swift
//  Shopping
//
//  Created by INI SYSTEMS on 01/10/23.
//

import SwiftUI

extension Font {
    
    static func sfProDisplayRegular(_ size: CGFloat) -> Font {
        return Font.custom("DMSans-Regular", size: size)
    }
    
    static func sfProDisplayMedium(_ size: CGFloat) -> Font {
        return Font.custom("SFProDisplay-Medium", size: size)
    }
    
    static func sfProDisplayBold(_ size: CGFloat) -> Font {
        return Font.custom("DMSans-Bold", size: size)
    }
    
    static func sfProDisplaySemiBold(_ size: CGFloat) -> Font {
        return Font.custom("DMSans-SemiBold", size: size)
    }
    
}
