//
//  BooksViewModel.swift
//  MyJsonTest2
//
//  Created by Johnson Liu on 11/7/22.
//

import UIKit
import SwiftyJSON


protocol BooksViewModelDelegate: AnyObject {
    func didLoadBooksData()
}


class BooksViewModel: NSObject {
    
    weak var delegate: BooksViewModelDelegate?
    
    var booksList = [Book]()
    
    //-- with third party frameworks
    
    func allBooks() {
        loadingBooks() {}
    }
    
    func loadingBooks(completion: @escaping () -> Void) {
        
        DatasManager().booksData() { [weak self] (rawData: Data?) in
            if let booksData = rawData {
                self?.booksList = self?.parseBooksData(data: booksData) ?? []
            }
            self?.delegate?.didLoadBooksData()
            completion()
        }
    }
    
    func parseBooksData(data: Data) -> [Book] {
        var books = [Book]()
        
        do {
            books = try JSONDecoder().decode([Book].self, from: data)
        } catch {
            print(error)
        }

        return books
    }
    
    //-- with Apple libraries
    
    func allBooksWithSession() {
        loadingBooksWithSession {}
    }
    
    func loadingBooksWithSession(completion: @escaping () -> Void) {
        
        DatasManager().booksSessionData() { [weak self] (rawData: Data) in
            do {
                self?.booksList = try JSONDecoder().decode([Book].self, from: rawData)
                DispatchQueue.main.sync {
                    self?.delegate?.didLoadBooksData()
                }
            } catch {
                print(error)
            }
        }
    }
}

extension BooksViewModel {
    
    func totalSection() -> Int {
        return 1
    }
    
    func totalRowsInSection(sectionIndex: Int) -> Int {
        return booksList.count
    }
    
    func rowItemAtIndex(rowIndex: Int) -> Book {
        return rowIndex < booksList.count ? booksList[rowIndex] : Book()
    }
    
}
