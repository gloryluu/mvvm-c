//
//  TodoListItemViewController.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/13/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

import UIKit

class TodoListItemViewController: BaseViewController {
    private var titleLabel: UILabel!
    
    var viewModel: TodoListItemViewModel {
        didSet {
         //   updateUI()
        }
    }
    
    init(viewModel: TodoListItemViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //        super.init(coder: aDecoder) // With Storyboard
        fatalError("Never will happen") // No storyboard
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.viewInit()
        self.constraintsInit()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TodoListItemViewController: ViewControllerProtocol {
    func viewInit() {
        self.title = self.viewModel.showTodoItem().title
        self.titleLabel = UILabel()
        self.titleLabel.text = self.viewModel.showTodoItem().title
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleLabel)
    }
    
    func constraintsInit() {
        self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func updateUI() {
        
    }
}
