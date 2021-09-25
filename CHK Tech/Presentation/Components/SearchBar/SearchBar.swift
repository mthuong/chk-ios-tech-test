//
//  SearchBar.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/25/21.
//

import SwiftUI

struct SearchBar: View {
    @State private var showCancelButton: Bool = false
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search...", text: $searchText, onEditingChanged: { isEditing in
                    withAnimation {
                        self.showCancelButton = isEditing
                    }
                }, onCommit: {
                    print("onCommit")
                }).foregroundColor(.primary)
                
                Button(action: {
                    if !self.searchText.isEmpty {
                        self.searchText = ""
                    }
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            
            if showCancelButton  {
                Button("Cancel") {
                    // Dismiss keyboard
                    UIApplication.shared.endEditing(true)
                    if !self.searchText.isEmpty {
                        self.searchText = ""
                    }
                    withAnimation {
                        self.showCancelButton = false
                    }
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    @State static var searchText = ""
    
    static var previews: some View {
        Group {
            SearchBar(searchText: $searchText)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
