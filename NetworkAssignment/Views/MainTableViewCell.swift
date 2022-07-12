//
//  MainTableViewCell.swift
//  NetworkAssignment
//
//  Created by Wajeeh Ul Hassan on 12/07/2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let reuseID = "\(MainTableViewCell.self)"

    lazy var progImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemMint
        return imageView
    }()
    
    lazy var progLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .systemOrange
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpUI() {
        let vStackview = UIStackView(frame: .zero)
        self.backgroundColor = .clear
        vStackview.translatesAutoresizingMaskIntoConstraints = false
        vStackview.spacing = 8
        vStackview.axis = .vertical
        vStackview.distribution = .fillEqually
        
        vStackview.addArrangedSubview(self.progLabel)
        
        let hStackView = UIStackView(frame: .zero)
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.spacing = 8
        hStackView.axis = .horizontal
        
        hStackView.addArrangedSubview(progImageView)
        hStackView.addArrangedSubview(vStackview)
        
        self.progImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.progImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.contentView.addSubview(hStackView)
        hStackView.bindToSuperView()
        
    }

}
