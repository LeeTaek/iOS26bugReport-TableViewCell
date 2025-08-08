//
//  BugCell.swift
//  TableViewSample
//
//  Created by 이택성 on 8/8/25.
//

import UIKit

class BugCell: UITableViewCell {
    @IBOutlet weak var viewLayer: UIView!
    @IBOutlet weak var imageBank: UIImageView!
    @IBOutlet weak var labelBankName: UILabel!
    @IBOutlet weak var labelAccountNumber: UILabel!
    @IBOutlet weak var labelAccountType: UILabel!
    @IBOutlet weak var viewDotLine: UIView!
    
    @IBOutlet weak var viewMainAccount: UIView!
    @IBOutlet weak var stackViewBalance: UIStackView!
    @IBOutlet weak var viewAccountType: UIView!
    
    @IBOutlet weak var labelBalanceTitle: UILabel!
    @IBOutlet weak var labelBalance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // MARK: - Layout Bug on iOS26 ????
//        self.backgroundColor = .blue
    }
    
    override func layoutSubviews() {
        viewLayer.layer.cornerRadius = 12
        viewLayer.layer.borderColor = UIColor(red: 0.83, green: 0.84, blue: 0.89, alpha: 1).cgColor
        viewLayer.layer.borderWidth = 1
        viewLayer.clipsToBounds = true
        
        viewAccountType.layer.cornerRadius = viewAccountType.bounds.height / 2
        viewAccountType.layer.borderColor = UIColor(red: 0.859, green: 0.898, blue: 0.973, alpha: 1).cgColor
        viewAccountType.layer.borderWidth = 1
        viewAccountType.clipsToBounds = true
        
        viewMainAccount.layer.cornerRadius = viewMainAccount.bounds.height / 2
        viewMainAccount.clipsToBounds = true
    }
    
    func configurationData(_ data: BankAccountModel) {
        imageBank.image = UIImage(systemName: "person")
        labelBankName.text = data.bankName
        labelAccountNumber.text = data.accountNumber
        
        switch data.accountType {
        case "auto":
            labelAccountType.text = "Auto"
            makeBalanceAndCurrency(data, isHancash: false)
        case "manual":
            labelAccountType.text = "Manual"
            hiddenBalance()
        case "wallet":
            labelAccountType.text = "자동 충전"
            labelBalanceTitle.text = "잔액"
            
            makeBalanceAndCurrency(data, isHancash: true)
        default:
            labelAccountType.text = ""
            viewAccountType.isHidden = true
            hiddenBalance()
            break
        }
    }
    
    private func hiddenBalance() {
        viewDotLine.isHidden = true
        stackViewBalance.isHidden = true
    }
    
    private func makeBalanceAndCurrency(_ data: BankAccountModel, isHancash: Bool) {
        labelBalance.isHidden = false
        labelBalanceTitle.isHidden = false
        labelBalance.text = data.balanceAmt ?? "" + " 원"
    }
}
