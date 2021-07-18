//
//  MovieWS.swift
//  ConsumoServicios
//
//  Created by Kenyi Rodriguez on 28/06/21.
//

import Foundation
import Alamofire

class MovieWS {
    
    func getMovies(_ completionHandler: @escaping ArrayMovies) {
        
        let urlString = "https://api.themoviedb.org/4/list/1?api_key=752cd23fdb3336557bf3d8724e115570&page=1"
    
        AF.request(urlString).responseJSON { dataResponse in
            
            let json = dataResponse.value as? JSON ?? [:]
            let arrayResults = json["results"] as? [JSON] ?? []
            
            var arrayMovies = [MovieBE]()
            
            for movieJSON in arrayResults {
                let objMovie = MovieBE(json: movieJSON)
                arrayMovies.append(objMovie)
            }
            
            completionHandler(arrayMovies)
        }
    }
}
