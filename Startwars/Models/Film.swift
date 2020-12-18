//
//  Film.swift
//  Startwars
//
//  Created by Vaibhav Anand on 2020-12-15.
//

import Foundation

class Film: NSObject, NSCoding {
    
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
    
    func encode(with coder: NSCoder) {
        coder.encode(isFav, forKey: "isFav")
        coder.encode(title, forKey: "title")
        coder.encode(episodeId, forKey: "episodeId")
        coder.encode(openingCrawl, forKey: "openingCrawl")
        coder.encode(director, forKey: "director")
        coder.encode(producer, forKey: "producer")
        coder.encode(releaseDate, forKey: "releaseDate")
        coder.encode(charactersURLs, forKey: "charactersURLs")
        coder.encode(planetsURLs, forKey: "planetsURLs")
        coder.encode(starshipsURLs, forKey: "starshipsURLs")
        coder.encode(vehiclesURLs, forKey: "vehiclesURLs")
        coder.encode(speciesURLs, forKey: "speciesURLs")
    }
    
    required init?(coder: NSCoder) {
        isFav = coder.decodeBool(forKey: "isFav")
        title = coder.decodeObject(forKey: "title") as! String
        episodeId = coder.decodeInteger(forKey: "episodeId")
        openingCrawl = coder.decodeObject(forKey: "openingCrawl") as! String
        director = coder.decodeObject(forKey: "director") as! String
        producer = coder.decodeObject(forKey: "producer") as! String
        releaseDate = coder.decodeObject(forKey: "releaseDate") as! String
        charactersURLs = coder.decodeObject(forKey: "charactersURLs") as! [String]
        planetsURLs = coder.decodeObject(forKey: "planetsURLs") as! [String]
        starshipsURLs = coder.decodeObject(forKey: "starshipsURLs") as! [String]
        vehiclesURLs = coder.decodeObject(forKey: "vehiclesURLs") as! [String]
        speciesURLs = coder.decodeObject(forKey: "speciesURLs") as! [String]
        super.init()
    }
}
