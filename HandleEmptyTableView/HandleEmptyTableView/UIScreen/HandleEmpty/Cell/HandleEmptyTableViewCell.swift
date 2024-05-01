//
//  HandleEmptyTableViewCell.swift
//  HandleEmptyTableView
//
//  Created by Rath! on 1/5/24.
//

import UIKit

class HandleEmptyTableViewCell: UITableViewCell {

    static let identifier = "HandleEmptyTableViewCell"
    
    lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUIView(){
        addSubview(lblTitle)
        NSLayoutConstraint.activate([
            lblTitle.rightAnchor.constraint(equalTo: rightAnchor),
            lblTitle.leftAnchor.constraint(equalTo: leftAnchor),
            lblTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
        
        ])
        
    }

}
