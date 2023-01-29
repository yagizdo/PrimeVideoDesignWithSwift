//
//  extensions.swift
//  PrimeVideoDesign
//
//  Created by Yılmaz Yağız Dokumacı on 29.01.2023.
//

import Foundation
import UIKit

extension UILabel {
    func add(image: UIImage, text: String, isLeading: Bool = true, imageBounds: CGRect = CGRect(x: 0, y: -5, width: 20, height: 20)) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.bounds = imageBounds
        imageAttachment.image = image
        imageAttachment.image = image.colorImage(with: UIColor(named: "unselectedNavbarItemColor") ?? UIColor.white)
        
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

extension UIImage {
    func colorImage(with color: UIColor) -> UIImage? {
        guard let cgImage = self.cgImage else { return nil }
        UIGraphicsBeginImageContext(self.size)
        let contextRef = UIGraphicsGetCurrentContext()

        contextRef?.translateBy(x: 0, y: self.size.height)
        contextRef?.scaleBy(x: 1.0, y: -1.0)
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)

        contextRef?.setBlendMode(CGBlendMode.normal)
        contextRef?.draw(cgImage, in: rect)
        contextRef?.setBlendMode(CGBlendMode.sourceIn)
        color.setFill()
        contextRef?.fill(rect)

        let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return coloredImage
    }
}
