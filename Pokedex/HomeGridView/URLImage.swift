//
//  URLImage.swift
//  Pokedex
//
//  Created by Kelvin Javorski Soares on 11/01/24.
//

import Foundation
import SwiftUI

struct URLImage: View {
    @ObservedObject private var imageLoader = ImageLoader()
    let url: String

    init(url: String) {
        self.url = url
    }

    var body: some View {
        Group {
            if let loadedImage = self.imageLoader.loadedImage {
                Image(uiImage: loadedImage)
                    .resizable()
            } else {
                Image(uiImage: UIImage())
                    .resizable()
            }
        }
        .onAppear {
            self.imageLoader.load(url: self.url)
        }
    }
}


