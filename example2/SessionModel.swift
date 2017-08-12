//
//  SessionModel.swift
//  example2
//
//  Created by allen on 2017/07/17.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class SessionModel {
    func create(userID: String, password: String) throws -> String {
        if ( userID == "test" && password == "test" ) {
            return "key"
        } else {
            throw NSError(domain: "不一致", code: -1, userInfo: nil)
        }
    }
}
