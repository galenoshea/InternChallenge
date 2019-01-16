//
//  ProductDetailsViewController.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-12.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var product: Product?
    private let cellIdentifier = "detailCell" 
    
    @IBOutlet weak var tableView: UITableView!
    
    //Mark: Method for setting the product from the CollectionDetail Controller. Needs to be called for the View.
    internal func setProduct(_ product: Product){
        self.product = product
    }
    
    //Mark: Used if the image needs to be displayed
    /*
    func setImage(_ imageSrc: String){
        if let imageURL = URL(string: imageSrc) {
            DispatchQueue.main.async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    /*
                    let image = UIImage(data: data)
                    self.imageView.image = image
                    self.imageView.layer.cornerRadius = self.imageView.frame.height/2
                    self.imageView.layer.borderWidth = 1
                    self.imageView.layer.borderColor = UIColor(red:235/255, green:115/255, blue:127/255, alpha: 1).cgColor*/
                }
            }
        }
    }*/
    
    //Mark:
    internal override func viewDidLoad() {
        super.viewDidLoad()
        self.title = product?.title
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //Mark:
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (product?.detailsCount())!
    }
    
    //Mark:
    internal func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Mark:
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //Mark:
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Mark:
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! DetailCell
        cell.cellDetail.text = product?.listDetails(indexPath.row)
        
        let selectedColorView = UIView()
        selectedColorView.backgroundColor = UIColor(red:235/255, green:115/255, blue:127/255, alpha: 1)
        cell.selectedBackgroundView = selectedColorView
        
        return cell
    }
    
}
