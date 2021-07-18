//
//  ViewBox.swift
//  Delegados
//
//  Created by Kenyi Rodriguez on 5/07/21.
//

import UIKit

@objc protocol ViewBoxDelegate {
    func viewBox(_ viewBox: ViewBox, didTapViewWithGesture gesture: UITapGestureRecognizer)
}

@IBDesignable class ViewBox: UIView {
    
    @IBInspectable var nombreColor: String = ""
    
    @IBOutlet var delegate: ViewBoxDelegate?
    
    lazy var tapGesture: UITapGestureRecognizer = {
       
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(self.tapGestureInView(_:)))
        return gesture
    }()
    
    override func draw(_ rect: CGRect) {
        self.addGestureRecognizer(self.tapGesture)
    }
    
    @objc func tapGestureInView(_ sender: UITapGestureRecognizer) {
        self.delegate?.viewBox(self, didTapViewWithGesture: sender)
    }
}
