//
//  MovieBE.swift
//  ConsumoServicios
//
//  Created by Kenyi Rodriguez on 28/06/21.
//

import Foundation

class MovieBE {
    
    public let title        : String
    public let overview     : String
    private let poster      : String
    private let releaseDate : Date
    public let average      : Double
    
    var posterURL: String {
        "https://image.tmdb.org/t/p/w500\(self.poster)"
    }
    
    var releaseDateFormat: String {
        self.releaseDate.toStringWithFormart("dd 'de' MMMM 'del' yyyy")
    }
    
    init(json: JSON) {
        
        self.title      = json["title"] as? String ?? ""
        self.overview   = json["overview"] as? String ?? ""
        self.poster     = json["poster_path"] as? String ?? ""
        self.average    = json["vote_average"] as? Double ?? 0
        
        let releaseDateString = json["release_date"] as? String ?? ""
        self.releaseDate = releaseDateString.toDateWithFormat("yyyy-MM-dd")
    }
}
