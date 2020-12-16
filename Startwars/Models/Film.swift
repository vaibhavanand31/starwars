//
//  Film.swift
//  Startwars
//
//  Created by Vaibhav Anand on 2020-12-15.
//

import Foundation

class Film {
    let title: String
    let episodeId: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let charactersURLs: [String]
    let planetsURLs: [String]
    let starshipsURLs: [String]
    let vehiclesURLs: [String]
    let speciesURLs: [String]
    var isFav: Bool = false
    
    init(title: String, episodeId: Int, openingCrawl: String, director: String, producer: String, releaseDate: String, charactersURLs: [String], planetsURLs: [String], starshipsURLs: [String], vehiclesURLs: [String], speciesURLs: [String]) {
        self.title = title
        self.episodeId = episodeId
        self.openingCrawl = openingCrawl
        self.director = director
        self.producer = producer
        self.releaseDate = releaseDate
        self.charactersURLs = charactersURLs
        self.planetsURLs = planetsURLs
        self.starshipsURLs = starshipsURLs
        self.vehiclesURLs = vehiclesURLs
        self.speciesURLs = speciesURLs
    }
}
