//
//  CloudFireStoreFirebaseApiImpl.swift
//  KalawSweetyHouse
//
//  Created by Ku Ku Zan on 11/28/23.
//

import Foundation
import Firebase
import FirebaseFirestore

class CloudFireStoreFirebaseApiImpl: FirebaseApi {
    
    let db = Firestore.firestore()
    
    func getAllHouse(success: @escaping ([KSHRespnse]) -> Void, failure: @escaping (String) -> Void) {
        db.collection("kalaw_sweety_house").addSnapshotListener { snapshot, error in
            
            // check for error
            if error == nil && snapshot != nil {
                var houseList = [KSHRespnse]()
                snapshot?.documents.forEach({ singleSnapShot in
                    let house = KSHRespnse(
                        nameUUID: singleSnapShot["nameUUID"] as? String ?? "",
                        name: singleSnapShot["name"] as? String ?? "",
                        facebookAccountName: singleSnapShot["facebookAccountName"] as? String ?? "",
                        fromDate: singleSnapShot["fromDate"] as? String ?? "",
                        toDate: singleSnapShot["toDate"] as? String ?? "",
                        phoneNumber: singleSnapShot["phoneNumber"] as? String ?? "",
                        numberOfPersons: singleSnapShot["numberOfPersons"] as? Int ?? 0,
                        extraBad: singleSnapShot["extraBad"] as? Int ?? 0,
                        roomType: singleSnapShot["roomType"] as? String ?? "",
                        bookingStatus: singleSnapShot["bookingStatus"] as? String ?? "",
                        paymentMethod: singleSnapShot["paymentMethod"] as? String ?? "",
                        cashAmount: singleSnapShot["cashAmount"] as? Int ?? 0,
                        depositAmount: singleSnapShot["depositAmount"] as? Int ?? 0
                    )
                   
                    houseList.append(house)
                })
            }
        }
    }
    
    func add() {
        print("Add")
    }
    
    func delete() {
        print("Delete")
    }
}
