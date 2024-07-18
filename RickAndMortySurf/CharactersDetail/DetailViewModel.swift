//
//  DetailViewModel.swift
//  RickAndMortySurf
//
//  Created by Максим Зыкин on 17.07.2024.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    var image: Data? { get }
    var nameLabel: String { get }
    var statusLabel: String { get }
    var speciesLabel: String { get }
    var typeLabel: String? { get }
    var genderLabel: String { get }
    var locationLabel: String { get }
    var episodeLabel: [String] { get }
    init(characters: Characters)
}

class DetailViewModel: DetailViewModelProtocol {

    var image: Data? {
        ImageManager.shared.fetchImage(from: characters.image)
    }
    
    var nameLabel: String {
        characters.name
    }
    
    var statusLabel: String {
        characters.status
    }
    
    var speciesLabel: String {
        "Species: \(characters.species)"
    }
    
    var typeLabel: String? {
        "Type: \(characters.type)"
    }
    
    var genderLabel: String {
        "Genger: \(characters.gender)"
    }
    
    var locationLabel: String {
        " Last known location: \(characters.origin.name)"
    }
    
    var episodeLabel: [String] {
        characters.episode
    }
    
    private var characters: Characters
    
    required init(characters: Characters) {
        self.characters = characters
    }
    
}
