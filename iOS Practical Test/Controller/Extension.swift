//
//  Helper.swift
//  iOS Practical Test
//
//  Created by Belal on 7/9/22.
//

import Foundation
import UIKit




extension UIImageView {
    func downloadImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = #imageLiteral(resourceName: "placeHolder")
            return
        }
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: URL(string: IMAGE_BASE_URL + imageURLString )!)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : #imageLiteral(resourceName: "placeHolder")
            }
        }
    }
}


extension String {
    var replaceWhitespaces: String {
        return self.replacingOccurrences(of: " ", with: "%20")
    }
}




extension UIViewController {
    
    func setNavigationTitle( title: String) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]
        navBarAppearance.titleTextAttributes = [.foregroundColor:  #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]
        navBarAppearance.backgroundColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = title
        
    }
}
