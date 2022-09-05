////
////  checkbox.swift
////  Community Connections Lewisham
////
////  Created by cex on 18/07/2022.
////
//
//import Foundation
//import UIKit
//
//@IBDesignable class CheckBox: UIButton {
//
//    @IBInspectable var borderColorSelected:UIColor = UIColor(named: "CCLCyan")!
//    @IBInspectable var borderColorDeselected:UIColor = UIColor.gray
//
//    @IBInspectable var borderWidth:CGFloat = 3
//    @IBInspectable var cornerRadius:CGFloat = 10
//
//    @IBInspectable var selectedImage:UIImage = UIImage(named: K.Images.checked)!
//    @IBInspectable var deselectedImage:UIImage = UIImage(named: K.Images.notChecked)!
//
//    @IBInspectable var active:Bool = false
//
//    private let border = CAShapeLayer()
//
//    override func draw(_ rect: CGRect) {
//
//        border.lineWidth = borderWidth
//        border.frame = self.bounds
//        border.fillColor = nil
//        border.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
//        self.layer.addSublayer(border)
//
//        self.layer.cornerRadius = cornerRadius
//        self.layer.masksToBounds = true
//
//        if active {
//            setSelected()
//        } else {
//            setDeselected()
//        }
//
//        // Respond to touch events by user
//        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
//    }
//
//    @objc func onPress() {
//        print("Button Pressed")
//        active = !active
//
//        if active {
//            setSelected()
//        } else {
//            setDeselected()
//        }
//    }
//
//    // Set the selected properties
//    func setSelected() {
//        border.lineDashPattern = nil
//        border.strokeColor = borderColorSelected.cgColor
//        self.setImage(selectedImage, for: .selected)
//        //self.setTitleColor(textColorSelected, for: .normal)
//    }
//
//    // Set the deselcted properties
//    func setDeselected() {
//        border.lineDashPattern = [4, 4]
//        border.strokeColor = borderColorDeselected.cgColor
//        self.setImage(nil, for: .normal)
//        //self.setTitleColor(textColorDeselected, for: .normal)
//    }
//
//}
