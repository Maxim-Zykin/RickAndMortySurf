//
//  CharactersCollectionViewModelCell.swift
//  RickAndMortySurf
//
//  Created by Максим Зыкин on 17.07.2024.
//

import Foundation

protocol CharactersCollectionViewModelCellProtocol {
    var name: String { get }
    var image: Data? { get }
    var statusPerson: String { get }
    var species: String { get }
    var gender: String { get }
    init(characters: Characters)
}

class CharactersCollectionViewModelCell: CharactersCollectionViewModelCellProtocol {
    
    var gender: String {
        characters.gender
    }

    var species: String {
        ("•  \(characters.species)")
    }
    
    var statusPerson: String {
        characters.status
    }
    
    var name: String {
        characters.name
    }
    
    var image: Data?{
        ImageManager.shared.fetchImage(from: characters.image)
    }
    
    private var characters: Characters
    
    required init(characters: Characters) {
        self.characters = characters
    }
}
