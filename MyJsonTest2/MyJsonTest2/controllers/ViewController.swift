//
//  ViewController.swift
//  MyJsonTest2
//
//  Created by Johnson Liu on 11/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let viewModel = BooksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        
        viewModel.delegate = self
        viewModel.allBooks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.layer.borderColor = UIColor.black.cgColor
        tableView.layer.borderWidth = 0.5
    }
}

extension ViewController: BooksViewModelDelegate {
    
    func didLoadBooksData() {
        tableView.reloadData()
        print("-> books : \(viewModel.booksList)")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.totalSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalRowsInSection(sectionIndex: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        
        let bookItem = viewModel.rowItemAtIndex(rowIndex: indexPath.row)
        cell?.textLabel?.text = bookItem.title ?? ""
        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let bookItem = viewModel.rowItemAtIndex(rowIndex: indexPath.row)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ViewDetailsController") as? ViewDetailsController {
            vc.book = bookItem
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


