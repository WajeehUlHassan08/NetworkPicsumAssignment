//
//  MainViewController.swift
//  NetworkAssignment
//
//  Created by Wajeeh Ul Hassan on 12/07/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var table: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemRed
        table.dataSource = self
        table.delegate = self
        table.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseID)
        
        return table
    }()

    override func viewDidLoad() {
        self.view.backgroundColor = .systemRed
        super.viewDidLoad()
        self.setUpUI()

        // Do any additional setup after loading the view.
    }
    
    private func setUpUI() {
        self.view.addSubview(table)
        self.table.bindToSuperView()
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseID, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }

        let url = URL(string: "https://picsum.photos/200/300")
        
        NetworkManager.shared.getData(url: url) { result in
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    cell.progImageView.image = UIImage(data: data)
                }
            case .failure(_):
                DispatchQueue.main.async {
                    cell.progImageView.image = UIImage(named: "tree")
                }
            }
            
        }
        
        
        NetworkManager.shared.getResponse(url: url) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let newResponse = response as? HTTPURLResponse
                  
                    guard let res = newResponse?.value(forHTTPHeaderField: "picsum-id") else {return}
                    cell.progLabel.text = "Label: \(res)"
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    cell.progLabel.text = "No Label"
                }
            }
        }
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
}


