//
//  ImageConverter.swift
//  KingsCup
//
//  Created by Allan Aranzaso on 2021-10-08.
//

import Foundation
import UIKit


//func resize(image: UIImage) -> UIImage {
//    let size = cardDisplayed.bounds.size
//    
//    let renderer = UIGraphicsImageRenderer(size: size)
//    let resizedImage = renderer.image {
//        context in image.draw(in: CGRect(x:0, y:0, width: size.width, height: size.height))
//    }
//    return resizedImage
//}

fileprivate func downsample(imageAt imageURL: URL, to pointSize: CGSize, scale: CGFloat = UIScreen.main.scale) -> UIImage? {
    
    // Create CGImageSource that represents an image
    let imageSrcOptions = [kCGImageSourceShouldCache: false] as CFDictionary
    guard let imageSrc = CGImageSourceCreateWithURL(imageURL as CFURL, imageSrcOptions) else {
        return nil
    }
    print("Image URL: \(imageURL)")
    
    // Calculate the desired dimension
    let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale
    
    // Perform downsampling
    let downsampleOptions = [
        kCGImageSourceCreateThumbnailFromImageAlways: true, kCGImageSourceShouldCacheImmediately: true, kCGImageSourceCreateThumbnailWithTransform: true,
        kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels] as CFDictionary
    
    guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSrc, 0, downsampleOptions) else {
        return nil
    }
    
    return UIImage(cgImage: downsampledImage)
    }
