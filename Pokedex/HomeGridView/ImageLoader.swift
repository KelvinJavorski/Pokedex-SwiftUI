//
//  ImageLoader.swift
//  Pokedex
//
//  Created by Kelvin Javorski Soares on 11/01/24.
//

import Foundation
import UIKit

final class ImageLoader: ObservableObject {
    @Published var loadedImage: UIImage? = nil

    func load(url: String) {
        print("URL being loaded:", url)
        guard let imageURL = URL(string: url) else { fatalError("URL isn't correct!")}

        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else { fatalError(error!.localizedDescription)}

            DispatchQueue.main.async {
                self.loadedImage = UIImage(data: data)
            }
        }.resume()
    }
}
