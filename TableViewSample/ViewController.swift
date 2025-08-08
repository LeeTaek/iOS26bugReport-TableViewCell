//
//  ViewController.swift
//  TableViewSample
//
//  Created by 이택성 on 8/8/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView = UITableView()
    private let mockData: [BankAccountModel] = [
        .init(
            accountNumber: "12345678",
            accountType: "auto",
            bankName: "Super Bank",
            balanceAmt: "100000"
        ),
        .init(
            accountNumber: "ABCDEFGH",
            accountType: "wallet",
            bankName: "Hello Bank",
            balanceAmt: "1000210"
        ),
        .init(
            accountNumber: "가나다라마바사",
            accountType: "manual",
            bankName: "Korea Bank",
            balanceAmt: "30000"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BugCell", bundle: nil), forCellReuseIdentifier: "BugCell")

        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BugCell", for: indexPath) as? BugCell else { return BugCell() }
        
        cell.configurationData(mockData[indexPath.row])
        return cell
    }
}


