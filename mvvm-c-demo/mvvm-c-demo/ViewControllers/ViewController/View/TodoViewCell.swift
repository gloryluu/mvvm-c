//
//  TodoViewCell.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/9/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

import UIKit

class TodoViewCell: UITableViewCell {
    
    static let cellIdentifier = "TodoViewCellIdentifier"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModel: TodoViewCellModel) {
        textLabel?.text = viewModel.title
        textLabel?.numberOfLines = 0
        accessoryType = viewModel.completed ? .checkmark : .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
