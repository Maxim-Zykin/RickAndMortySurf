//
//  ImageManager.swift
//  RickAndMortySurf
//
//  Created by Максим Зыкин on 17.07.2024.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: URL?) -> Data? {
        guard let url = url else { return nil}
        guard let imageData = try? Data(contentsOf: url) else { return nil}
        return imageData
    }
}
