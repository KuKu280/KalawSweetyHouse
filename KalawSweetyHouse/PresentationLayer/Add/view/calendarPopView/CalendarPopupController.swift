//
//  CalendarPopupController.swift
//  KalawSweetyHouse
//
//  Created by Ku Ku Zan on 12/22/23.
//

import UIKit
import FSCalendar

class CalendarPopupController: UIViewController {
    
    
    @IBOutlet var calendarView: FSCalendar!
    
    override var transitioningDelegate: UIViewControllerTransitioningDelegate? {
        get { self }
        set {}
    }
    
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { .custom }
        set {}
    }
    
    var didTapSelectedDateDone : ((String) -> Void) = { _ in }
    var selectedDate = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.delegate = self
        calendarView.dataSource = self
        
    }

    @IBAction 
    private func didTapCancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction 
    private func didTapDone(_ sender: UIButton) {
        didTapSelectedDateDone(selectedDate)
        dismiss(animated: true)
    }
    
}

extension CalendarPopupController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(
        _ calendar: FSCalendar,
        didSelect date: Date,
        at monthPosition: FSCalendarMonthPosition
    ) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MMM/yyyy"
        let result = formatter.string(from: date)
        self.selectedDate = result
    }
}

extension CalendarPopupController: UIViewControllerTransitioningDelegate {
    
    func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController
    ) -> UIPresentationController? {
        DimmingBackgroundPresentationController(
            presentedViewController: presented,
            presenting: presenting
        )
    }
}
