//
//  CoinsView.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import SwiftUI

struct CoinsView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    CoinsHeader()
                    
                    ForEach(viewModel.coins.data, id: \.id) { coin in
                        
                        HStack {
                            CoinView(viewModel: CoinView.ViewModel(coin: coin))
                            
                            //                    NavigationLink(
                            //                        destination: Router.destinationForTappedCoin(coin: coin)
                            //                    ) {
                            //                        EmptyView()
                            //                    }
                            //                    .frame(width: 0)
                        }
                        .listRowInsets(EdgeInsets())
                        .padding()
                        
                    }
                    .listRowInsets(EdgeInsets())
                    
                }.navigationTitle("Coinhako")
            }
        }.onAppear(perform: {
            viewModel.onAppear()
        })
    }
}

struct CoinsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsView(viewModel: CoinsView.ViewModel(coins: Coins(data: [Coin.fake(), Coin.fake()]), coinsUseCase: CoinsUseCase(coinsRepository: CoinsRepository())))
    }
}
