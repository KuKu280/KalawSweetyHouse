//
//  FirebaseApi.swift
//  KalawSweetyHouse
//
//  Created by Ku Ku Zan on 11/28/23.
//

import Foundation

protocol FirebaseApi {
    func getAllHouse(
        success: @escaping([KSHRespnse]) -> Void,
        failure: @escaping(String) -> Void
    )
    func add()
    func delete()
}
