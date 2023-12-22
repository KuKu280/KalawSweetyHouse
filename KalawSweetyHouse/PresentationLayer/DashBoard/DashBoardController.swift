//
//  DashBoardController.swift
//  KalawSweetyHouse
//
//  Created by Ku Ku Zan on 11/28/23.
//

import UIKit

class DashBoardController: UIViewController {
    
    @IBOutlet private(set) var navView: UIView!
    
    let houseModel = CloudFireStoreFirebaseApiImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        houseModel.getAllHouse { house in
            print(house)
        } failure: { error in
            print(error)
        }
        
    }
    
    
    private func setupUI() {
        navigationController?.isNavigationBarHidden = true
        navView.layer.shadowColor = UIColor.black.cgColor
        navView.layer.shadowOpacity = 1
        navView.layer.shadowOffset = .zero
        navView.layer.shadowRadius = 7
    }
    
    
    @IBAction 
    private func didTapAdd() {
        navigationController?.pushViewController(
            AddController(),
            animated: true
        )
    }
}
