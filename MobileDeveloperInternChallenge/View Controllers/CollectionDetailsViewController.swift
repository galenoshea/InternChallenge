//
//  CollectionDetailViewController.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import UIKit

class CollectionDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var collectionIdUrl : URL?
    private var productIdUrl : URL?
    private let cellIdentifier = "productCell"
    private var cellRow : Int?
    private var collects = [Collect]()
    private var products = [Product]()
    private var collection : CustomCollection?
    
    //Mark: Outlets variables that are connected to the Main Storyboard
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var body: UITextView!
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var collectionCardView: UIView!
    
    //Mark: Method for concatenating the Collection ID into the URL
    internal func setCollectionIdUrl(_ id: Int){
        self.collectionIdUrl = URL(string: "https://shopicruit.myshopify.com/admin/collects.json?collection_id=\(id)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")
    }
    
    //Mark: Used to set the Collection from the Collection List View Controller
    internal func setCollection(_ collection: CustomCollection){
        self.collection = collection
    }
    
    //Mark: Sets the Header image assoicated with the Collection
    private func setImage(_ imageSrc: String){
        if let imageURL = URL(string: imageSrc) {
            DispatchQueue.main.async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    self.collectionImage.image = image
                    self.collectionImage.layer.cornerRadius = self.collectionImage.frame.height/2
                    self.collectionImage.layer.borderWidth = 1
                    self.collectionImage.layer.borderColor = UIColor(red:235/255, green:115/255, blue:127/255, alpha: 1).cgColor
                }
            }
        }
    }
    
    //Mark: Concatenates the product id URL
    private func setProductIdUrl(){
        var id = ""
        for collect in collects {
            id += String(collect.product_id!) + ","
        }
        self.productIdUrl = URL(string: "https://shopicruit.myshopify.com/admin/products.json?ids=\(id)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")
    }
    
    //Mark: Parses Collection Json file into collects object model
    private func fetchCollectionIdJson() {
        guard let url = self.collectionIdUrl else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , response != nil, error == nil else {
                print("Download Error");
                return
            }
            do {
                let jsonModel = try JSONDecoder().decode(Collects.self, from: data)
                self.collects = jsonModel.collects
                self.setProductIdUrl()
                self.fetchProductIdJson()
            }
            catch {
                print(error)
            }
            }.resume()
    }
    
    //Mark: Parses Production Json file into product object model
    private func fetchProductIdJson(){
        guard let url = self.productIdUrl else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , response != nil, error == nil else {
                print("Download Error");
                return
            }
            do {
                let jsonModel = try JSONDecoder().decode(Products.self, from: data)
                self.products = jsonModel.products
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch {
                print(error)
            }
            }.resume()
    }
    
    //Mark: prepares View
    internal override func viewDidLoad() {
        super.viewDidLoad()
        fetchCollectionIdJson()
        self.body.text = collection?.body_html
        self.title = collection?.title
        self.setCollectionIdUrl((collection?.id)!)
        self.setImage((collection?.image!.src)!)
        
        //Mark: Removes line between Navigation Header and Collection Header Card to give feeling of single peiced Header
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()

        //Mark: Needed for dynamic table view
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Mark: basic table view methods for dynamic table view
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{ return products.count }
    
    internal func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 1 }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 100 }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Mark: Used to set selected colour of a row
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ProductCell
        let selectedColorView = UIView()
        selectedColorView.backgroundColor = UIColor(red:235/255, green:115/255, blue:127/255, alpha: 1)
        cell.selectedBackgroundView = selectedColorView
        
        //Mark: Sets the properties of each row
        cell.cellBody.text = products[indexPath.row].body_html
        cell.cellName.text = products[indexPath.row].title
        cell.cellInventory.text = "Inventory: \(products[indexPath.row].calcInventory())"
        cell.cellImage.layer.cornerRadius = cell.cellImage.frame.height/2
        cell.cellView.layer.cornerRadius = 10
        cell.cellImage.layer.borderWidth = 1
        cell.cellImage.layer.borderColor = UIColor(red:52/255, green:92/255, blue:125/255, alpha: 1).cgColor
        
        //Mark: Sets image of row from url
        if let imageURL = URL(string: products[indexPath.row].image.src!) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.cellImage.image = image
                    }
                }
            }
        }
        return cell
    }
    
    //Mark: Sets Product prior to the product view controller loading
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productDetailsViewController = segue.destination as? ProductDetailsViewController {
            productDetailsViewController.setProduct(products[self.cellRow!])
        }
    }
    
    //Mark: Select row method
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cellRow = indexPath.row
        tableView.deselectRow(at: indexPath, animated: false)
        self.performSegue(withIdentifier: "ProductDetails", sender: nil)
    }

}
