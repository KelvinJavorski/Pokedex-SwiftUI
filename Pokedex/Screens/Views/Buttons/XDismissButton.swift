//
//  XDismissButton.swift
//  Pokedex
//
//  Created by Kelvin Javorski Soares on 11/01/24.
//

import SwiftUI

struct XDismissButton: View {
    @Binding var isShowingDetailView: Bool
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
                
            }
        }
        .padding()
        
    }
}
