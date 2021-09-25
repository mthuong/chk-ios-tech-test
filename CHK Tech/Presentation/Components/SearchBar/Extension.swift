//
//  Extension.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/25/21.
//

import SwiftUI

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnTapGesture: ViewModifier {
    var gesture = TapGesture().onEnded { _ in
        UIApplication.shared.endEditing(true)
    }
    
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnTapGesture() -> some View {
        return modifier(ResignKeyboardOnTapGesture())
    }
}
