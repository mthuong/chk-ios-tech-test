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
        
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header:                 searchField
                            .padding()
                ) { }
                .background(Color.white)
                .listRowInsets(EdgeInsets(
                                top: 0,
                                leading: 0,
                                bottom: 0,
                                trailing: 0))
                .textCase(nil)
                
                Section(header: CoinsHeader()
                .listRowInsets(EdgeInsets()))
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

struct CoinsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsView(viewModel: CoinsView.ViewModel(coins: [Coin.fake(), Coin.fake()], coinsUseCase: CoinsUseCase(coinsRepository: CoinsRepository())))
    }
}
