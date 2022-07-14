//
//  RoundButton.swift
//  testCal
//
//  Created by Huy Hà on 7/14/22.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var roundButton : Bool  = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height/2
            }
        }
    }
    override  func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height/2
        }
    }
    

}
