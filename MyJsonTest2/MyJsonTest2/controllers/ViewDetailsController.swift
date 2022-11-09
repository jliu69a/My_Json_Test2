//
//  ViewDetailsController.swift
//  MyJsonTest2
//
//  Created by Johnson Liu on 11/8/22.
//

import UIKit

class ViewDetailsController: UIViewController {
    
    @IBOutlet var displayLabel: UILabel!
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Details"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        displayLabel.layer.borderColor = UIColor.black.cgColor
        displayLabel.layer.borderWidth = 0.5
        
        displayLabel.text = displayContent()
    }
    
    func displayContent() -> String {
        
        guard let bookItem = book else {
            return ""
        }
        
        let displaying = " Title : \(bookItem.title ?? "")\n\n\n Author : \(bookItem.author?.first_name ?? "") \(bookItem.author?.last_name ?? "")\n\n\n Publish at : \(bookItem.author?.location?.city ?? ""), \(bookItem.author?.location?.nation ?? "")\n\n\n Notes : \(bookItem.notes ?? "")"
        return displaying
    }
    
}
