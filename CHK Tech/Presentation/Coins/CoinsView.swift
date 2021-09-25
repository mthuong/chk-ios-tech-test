//
//  CoinsView.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import SwiftUI

struct CoinsView: View {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: searchField.padding()) { }
                .background(Color.white)
                .listRowInsets(EdgeInsets(
                                top: 0,
                                leading: 0,
                                bottom: 0,
                                trailing: 0))
                .textCase(nil)
                
                Section(header: CoinsHeader().listRowInsets(EdgeInsets()))
                {
                    ForEach(viewModel.coins, id: \.id) { coin in
                        
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
                }
            }
            .resignKeyboardOnTapGesture()
            .onAppear(perform: {
                viewModel.onAppear()
            })
            .navigationTitle("Coinhako")
        }
    }
}

private extension CoinsView {
    var searchField: some View {
        SearchBar(searchText: $viewModel.search)
    }
}

#if DEBUG
struct CoinsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsView(viewModel: CoinsView.ViewModel(coins: [Coin.fake(), Coin.fake()], coinsUseCase: CoinsUseCase(coinsRepository: CoinsRepository())))
    }
}
#endif
