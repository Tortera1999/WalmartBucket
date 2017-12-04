//
//  UILabel.swift
//  WalmartBucket
//
//  Created by Abid Amirali on 12/4/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit

extension UILabel {
    
    func numberOfCharactersThatFitLabel() -> Int {
        let fontRef = CTFontCreateWithName(self.font.fontName as CFString, self.font.pointSize, nil)
        let attributes = NSDictionary(dictionary: [kCTFontAttributeName : fontRef])
        let attributeString = NSAttributedString(string: text!, attributes: attributes as? [String : AnyObject])
        let frameSetterRef = CTFramesetterCreateWithAttributedString(attributeString as CFAttributedString)
        
        var characterFitRange:CFRange = CFRange()
        
        CTFramesetterSuggestFrameSizeWithConstraints(frameSetterRef, CFRangeMake(0, 0), nil, CGSize.init(width: bounds.size.width, height: CGFloat(numberOfLines)*font.lineHeight) ,&characterFitRange)
        
        return characterFitRange.length
    }
}
