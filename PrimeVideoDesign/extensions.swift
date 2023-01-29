//
//  extensions.swift
//  PrimeVideoDesign
//
//  Created by Yılmaz Yağız Dokumacı on 29.01.2023.
//

import Foundation
import UIKit

extension UILabel {
    func add(image: UIImage, text: String, isLeading: Bool = true, imageBounds: CGRect = CGRect(x: 0, y: 0, width: 16, height: 12)) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.bounds = imageBounds
        imageAttachment.image = image
        imageAttachment.image?.withTintColor(.white)
        
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let string = NSMutableAttributedString(string: text)
        
        let mutableAttributedString = NSMutableAttributedString()
        
        if isLeading {
            mutableAttributedString.append(attachmentString)
            mutableAttributedString.append(string)
            attributedText = mutableAttributedString
        } else {
            string.append(attachmentString)
            attributedText = string
        }
    }
    }
