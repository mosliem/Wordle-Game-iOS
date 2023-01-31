//
//  Extensions.swift
//  Wordle Game
//
//  Created by mohamedSliem on 1/30/23.
//

import UIKit
import NVActivityIndicatorView

extension StringProtocol {
    
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}


extension UIButton {
    
    func round(with cornerRadius: CGFloat){
        self.layer.cornerRadius = cornerRadius
    }
    
}

var backgroundView: UIView?
var loadingIndicator: NVActivityIndicatorView?
var indicatorView: UIView?

extension UIViewController{
    
    
    func showIndicator(with backgroundColor: UIColor, indicatorType: NVActivityIndicatorType, indicatorColor: UIColor){
        
        backgroundView = UIView(frame: CGRect(x: 0, y: -50, width: view.frame.width, height: view.frame.height+70))
        backgroundView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        
        indicatorView = UIView(frame: CGRect(x: view.frame.width / 2 - 70, y: view.frame.height / 2 - 70, width: 140, height: 140))
        indicatorView?.layer.cornerRadius = 15
        indicatorView?.backgroundColor = backgroundColor
        
        let viewFrame = indicatorView!.frame
        let frame = CGRect(x: viewFrame.width / 2 - 40, y: viewFrame.height / 2 - 50, width: 80, height: 100)
        
        loadingIndicator = NVActivityIndicatorView(frame: frame, type: indicatorType, color: indicatorColor, padding: 15)
        indicatorView?.addSubview(loadingIndicator!)
        
        backgroundView?.addSubview(indicatorView!)
        
        view.addSubview(backgroundView!)
        loadingIndicator!.startAnimating()
    }
    
    func hideIndicator(){
        loadingIndicator?.stopAnimating()
        backgroundView?.removeFromSuperview()
    }
}

