//
//  MovieCollectionViewCell.swift
//  ConsumoServicios
//
//  Created by Kenyi Rodriguez on 28/06/21.
//

import UIKit
import Alamofire

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var lblName          : UILabel!
    @IBOutlet weak private var lblReleaseDate   : UILabel!
    @IBOutlet weak private var imgMovie         : UIImageView!
    @IBOutlet weak private var imageContent     : UIView!
    
    var objMovie: MovieBE! {
        didSet { self.updateData() }
    }
    
    private func updateData() {
    
        self.lblName.text = self.objMovie.title
        self.lblReleaseDate.text = self.objMovie.releaseDateFormat
        
        AF.request(self.objMovie.posterURL).response { responseData in
            
            guard let data = responseData.data else { return }
            let image = UIImage(data: data)
            self.imgMovie.image = image
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.imgMovie.layer.cornerRadius = 8
        self.imageContent.layer.shadowColor = UIColor.black.cgColor
        self.imageContent.layer.shadowOffset = .zero
        self.imageContent.layer.shadowRadius = 4
        self.imageContent.layer.shadowOpacity = 0.3
        self.imageContent.layer.masksToBounds = false
    }
}
