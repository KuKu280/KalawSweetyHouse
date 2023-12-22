//
//  UITextFieldExt++.swift
//  KalawSweetyHouse
//
//  Created by Ku Ku Zan on 12/1/23.
//

import UIKit

extension UITextField {
    
    func setInputViewDatePicker(
        target: Any,
        selector: Selector
    ) {
        // Create a UIDatePicker object and assign to PickerView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(
            frame: CGRect(
                x: 0,
                y: 0,
                width: screenWidth, height: 216
            )
        )
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .compact
        } else {
            // Fallback on earlier versions
        }
        self.inputView = datePicker
        
        //Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(
            frame: CGRect(
                x: 0.0,
                y: 0.0,
                width: screenWidth,
                height: 44.0
            )
        )
        let flexible = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let barButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: target,
            action: selector
        )
        toolBar.setItems([flexible, barButton], animated: true)
        self.inputAccessoryView = toolBar
    
    }
}
