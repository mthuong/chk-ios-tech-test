//
//  CoinsHeader.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import SwiftUI

struct CoinsHeader: View {
    var body: some View {
        HStack (alignment: .center) {
            Text("PAIRS")
                
            
            Spacer()
            
            Text("PRICE")
        }
        .font(.subheadline)
        .foregroundColor(.gray)
    }
}

struct CoinsHeader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinsHeader()
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
