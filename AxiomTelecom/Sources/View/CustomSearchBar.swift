//
//  CustomSearchBar.swift
//  AxiomTelecom
//
//  Created by Muhammed Azharudheen on 16/06/2021.
//  Copyright © 2021 Sanu. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    private var margin: CGFloat = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let image = createImage(color: .lightGray.withAlphaComponent(0.5), size: CGSize(width: rect.width, height: 60)) {
            setBackgroundImage(image, for: .any, barMetrics: .default)
        }
    }
    
    private func setup() {
        backgroundImage = UIImage()
        setImage(#imageLiteral(resourceName: "search"), for: .search, state: .normal)
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: margin, bottom: 0, trailing: margin)
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .clear
        searchTextPositionAdjustment = UIOffset(horizontal: margin / 2, vertical: 0)
        setPositionAdjustment(UIOffset(horizontal: margin, vertical: 0), for: .search)
        tintColor = UIColor.lightGray
        placeholder = "Test"
    }
    
    private func createImage(color: UIColor, size: CGSize) -> UIImage? {
        let widthInset = margin * 2
        let heightInset = margin / 2
        let rect = CGRect(x: margin, y: 2, width: size.width - widthInset, height: size.height - heightInset)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 5)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        path.fill()
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        return image
    }
}
