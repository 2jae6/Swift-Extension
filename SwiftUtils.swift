//
//  SwiftExtension.swift
//  PhocaMarket
//
//  Created by infludeo on 2022/03/04.
//

import UIKit
import RxSwift
import RxCocoa

class SwiftUtils{
    static func getThumbImage(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage{
        
        var newCropWidth:CGFloat = 0
        var newCropHeight: CGFloat = 0
        
        if image.size.width < image.size.height{
            if (image.size.width < width) {
                newCropWidth = width
            }
            else {
                newCropWidth = image.size.width
            }
            newCropHeight = (newCropWidth * height)/width
        } else {
            if (image.size.height < height) {
                newCropHeight = height
            }
            else {
                newCropHeight = image.size.height
            }
            newCropWidth = (newCropHeight * width)/height
        }
        
        let x = image.size.width/2.0 - newCropWidth/2.0
        let y = image.size.height/2.0 - newCropHeight/2.0
        
        let cropRect = CGRect(x: x, y: y, width: newCropWidth, height: newCropHeight)
        guard let cgImage = image.cgImage?.cropping(to: cropRect) else { return UIImage()}
        

        let cropped = UIImage(cgImage: cgImage)
        
        return cropped
    }
    
}
