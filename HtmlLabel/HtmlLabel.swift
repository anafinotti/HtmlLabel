//
//  HtmlLabel.swift
//  HtmlLabel
//
//  Created by Ana Finotti on 19/12/20.
//

import UIKit

@IBDesignable public class HtmlLabel: UILabel {
    
    override public var text: String? {
        
        set {
            super.text = newValue
            if self.richText { self.setupRichText() }
        }
        get { return super.text }
    }
    
    @IBInspectable public var richText: Bool = false { didSet { self.setupRichText() } }
    
    private func setupRichText() {
        
        if self.richText {
            
            guard let text = self.text else { return }
            
            if let attributedString = text.htmlAttributedString(color: self.textColor, font: self.font) {
                
                self.attributedText = NSMutableAttributedString(attributedString: attributedString)
            }
        }
    }
}

extension String {
    
    func htmlAttributedString(color: UIColor, font: UIFont) -> NSAttributedString? {
        
        let htmlTemplate = """
        <!doctype html>
        <html>
          <head>
            <style>
              body {
                color: \(color.hexString!);
                font-family: \(font.fontName);
                font-size: \(font.pointSize)px;
              }
            </style>
          </head>
          <body>
            \(self)
          </body>
        </html>
        """
        
        guard let data = htmlTemplate.data(using: .utf8) else {
            return nil
        }
        
        guard let attributedString = try? NSAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: nil
        ) else {
            return nil
        }
        
        return attributedString
    }
}

extension UIColor {
    
    var hexString:String? {
        
        if let components = self.cgColor.components {
            
            let r = components[0]
            let g = components[1]
            let b = components[2]
            return  String(format: "#%02x%02x%02x", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }
        return nil
    }
}
