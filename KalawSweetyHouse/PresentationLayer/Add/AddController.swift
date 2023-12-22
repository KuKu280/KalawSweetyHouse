//
//  AddController.swift
//  KalawSweetyHouse
//
//  Created by Ku Ku Zan on 12/1/23.
//

import UIKit

class AddController: UIViewController {
    
    @IBOutlet private var fromDateTF: CalendarTextField!
    @IBOutlet private var toDateTF: CalendarTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        dateTextFieldSetup()
    }

    private func dateTextFieldSetup() {
        fromDateTF.tappedCalendar  = { [weak self] in
            let calendarPopup = CalendarPopupController()
            calendarPopup.didTapSelectedDateDone = { selectedDate in
                self?.fromDateTF.textField.text = selectedDate
                print(selectedDate)
            }
            self?.present(calendarPopup, animated: true)
        }
        
        toDateTF.tappedCalendar = { [weak self] in
            let calendarPopup = CalendarPopupController()
            calendarPopup.didTapSelectedDateDone = { selectedDate in
                self?.toDateTF.textField.text = selectedDate
                print(selectedDate)
            }
            self?.present(calendarPopup, animated: true)
        }
    }
    
    @IBAction 
    private func didTapDismiss() {
        navigationController?.popViewController(animated: true)
    }

}
