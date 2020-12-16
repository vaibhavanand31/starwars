//
//  FavFilms.swift
//  Startwars
//
//  Created by Vaibhav Anand on 2020-12-15.
//

import Foundation

class FavFilms {
    var favFilms = [Film]()
    
    init() {
        if let archivedFilms = NSKeyedUnarchiver.unarchiveObject(withFile: favFilmsArchieveURL.path) as? [Film]{
            favFilms = archivedFilms
        }
    }
    
    let favFilmsArchieveURL:URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("favFilms.archive")
    }()
    
    func addFavFilm(title: String, episodeId: Int, openingCrawl: String, director: String, producer: String, releaseDate: String, charactersURLs: [String], planetsURLs: [String], starshipsURLs: [String], vehiclesURLs: [String], speciesURLs: [String], isFav: Bool){
        favFilms.append(Film(title: title, episodeId: episodeId, openingCrawl: openingCrawl, director: director, producer: producer, releaseDate: releaseDate, charactersURLs: charactersURLs, planetsURLs: planetsURLs, starshipsURLs: starshipsURLs, vehiclesURLs: vehiclesURLs, speciesURLs: speciesURLs))
    }
    
    func removeFavFilm(title: String){
        favFilms = favFilms.filter(){
            $0.title != title
        }
    }
    
    func saveChanges() -> Bool {
        return NSKeyedArchiver.archiveRootObject(favFilms, toFile: favFilmsArchieveURL.path)
    }
}
