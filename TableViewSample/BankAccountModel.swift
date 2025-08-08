//
//  BankAccountModel.swift
//  TableViewSample
//
//  Created by 이택성 on 8/8/25.
//

import Foundation

struct BankAccountModel: Codable {
    var accountNumber: String?
    var accountType: String?
    var bankName: String?
    var balanceAmt: String? = ""

}
