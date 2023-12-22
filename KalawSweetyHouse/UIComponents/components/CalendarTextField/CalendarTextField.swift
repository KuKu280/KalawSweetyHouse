//
//  CalendarTextField.swift
//  KalawSweetyHouse
//
//  Created by Ku Ku Zan on 12/21/23.
//

import UIKit

public class CalendarTextField: NibBasedControl {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var tappedCalendar: () -> () = {}

    @IBInspectable
    private var title: String? {
        set { titleLabel.text = newValue }
        get { titleLabel.text }
    }
    
    @IBInspectable
    private var placeholder: String? {
        set { textField.placeholder = newValue }
        get { textField.placeholder }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction
    private func didTapCalendar(_ sender: UIButton) {
        tappedCalendar()
    }

}
