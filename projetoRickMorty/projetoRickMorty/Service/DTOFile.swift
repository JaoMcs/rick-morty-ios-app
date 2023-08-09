//
//  DTOFile.swift.swift
//  projetoRickMorty
//
//  Created by Joao Tavares on 31/07/23.
//

import Foundation

class InfoDTO: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

class CharacterDTO: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: LocationDTO?
    let location: LocationDTO?
    let image: String?
    let episode: [String?]
    let url: String?
    let created: String?
}

class LocationDTO: Codable {
    let name: String?
    let url: String?
}

class ResultDTO: Codable {
    let info: InfoDTO?
    let results: [CharacterDTO]?
}
