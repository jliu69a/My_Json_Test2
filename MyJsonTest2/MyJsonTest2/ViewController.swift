//
//  ViewController.swift
//  MyJsonTest2
//
//  Created by Johnson Liu on 11/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = BooksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        viewModel.delegate = self
        
        viewModel.allBooks()
    }
    
    func testingPrint() {
        print("-> books : \(viewModel.booksList)")
    }
    
}

extension ViewController: BooksViewModelDelegate {
    
    func didLoadBooksData() {
        testingPrint()
    }
    
}
