//
//  LabeledTextField.swift
//  KalawSweetyHouse
//
//  Created by Ku Ku Zan on 12/18/23.
//

import UIKit

public class LabeledTextField: NibBaseView {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var textField: UITextField!
    @IBOutlet private var errorLabel: UILabel!
    
    
    public var keyboardType: UIKeyboardType {
        set { textField.keyboardType = newValue }
        get { textField.keyboardType }
    }
    
    public var keyboardApperance: UIKeyboardAppearance {
        set { textField.keyboardAppearance = newValue }
        get { textField.keyboardAppearance }
    }
    
    @IBInspectable
    public var title: String? {
        set { titleLabel.text = newValue }
        get { titleLabel.text }
    }
    
    @IBInspectable
    public var placeholder: String? {
        set { textField.placeholder = newValue }
        get { textField.placeholder }
    }
    
    @IBInspectable
    public var error: String? {
        set {
            errorLabel.text = newValue
            errorLabel.isHidden = newValue == nil
        }
        
        get { errorLabel.text }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        error = nil
        setupTextField()
    }
    
    func setupTextField() {
        // create bottom line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(
            x: 0,
            y: textField.frame.height + 10,
            width: textField.frame.width - 45,
            height: 1
        )
        bottomLine.backgroundColor = UIColor.gray.cgColor
        // remove border text field
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
    }

}
