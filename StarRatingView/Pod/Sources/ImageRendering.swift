//
//  ImageRendering.swift
//  StarRatingView
//
//  Created by Aaron Daub on 2016-06-03.
//  Copyright © 2016 Aaron Daub. All rights reserved.
//

import UIKit

extension UIImage {
  func fractionalImage(fraction: CGFloat, axis: UILayoutConstraintAxis) -> UIImage? {
    let fullRect = CGRect(origin: CGPointZero, size: size)
    let fractionalSize: CGSize
  
    if axis == .Horizontal {
      fractionalSize = CGSize(width: fullRect.size.width * fraction, height: fullRect.size.height)
    } else {
      fractionalSize = CGSize(width: fullRect.size.width, height: fullRect.size.height * fraction)
    }
    
    let fractionalRect = CGRect(origin: fullRect.origin, size: fractionalSize)
    let croppedImage = CGImageCreateWithImageInRect(CGImage, fractionalRect)
    
    return croppedImage.map { croppedImage in
      UIGraphicsBeginImageContextWithOptions(fullRect.size, false, 0)
      
      UIImage(CGImage: croppedImage).drawAtPoint(CGPointZero)
      
      let result = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return result
    }
  }
  
  func placeAboveImage(image: UIImage) -> UIImage {
    let (maximumWidth, maximumHeight) = (max(image.size.width, size.width), max(image.size.height, size.height))
    let canvas = CGRectMake(0, 0, maximumWidth, maximumHeight)
    UIGraphicsBeginImageContextWithOptions(canvas.size, false, 0)
    
    let midPoint = CGPoint(x: CGRectGetMidX(canvas), y: CGRectGetMidY(canvas))
    image.drawAtPoint(CGPoint(x: midPoint.x - image.size.width / 2, y: midPoint.y - image.size.height / 2))
    self.drawAtPoint((CGPoint(x: midPoint.x - size.width / 2, y: midPoint.y - size.height / 2)))
    
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
  }
}