//
//  CoinView.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import SwiftUI

struct CoinView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        let coin = viewModel.coin
        
        HStack (alignment: .center) {
            AsyncImage(url: URL(string: coin.icon ?? ""), placeholder: {
                ActivityIndicator(isAnimating: .constant(true), style: .medium)
            }, image: { Image(uiImage: $0).resizable() })
            .scaledToFit()
            .frame(width: 40, height: 40, alignment: .center)
            .padding(.trailing, 20)
            
            Text(coin.base)
                .bold()
                .font(.body) + Text("/\(coin.counter ?? "")")
                .foregroundColor(.gray)
            
            Spacer()
            
            VStack (alignment: .trailing) {
                Text(viewModel.buyPrice)
                    .foregroundColor(Color.init(hex: "0ecb81"))
                    .font(.system(size: 17))
                Text(viewModel.sellPrice)
                    .foregroundColor(Color(hex: "f6465d"))
                    .font(.system(size: 16))
            }
        }
    }
}

#if !TESTING
struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinView(viewModel: CoinView.ViewModel(coin: Coin.fake()))
            CoinView(viewModel: CoinView.ViewModel(coin: Coin.fake()))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
