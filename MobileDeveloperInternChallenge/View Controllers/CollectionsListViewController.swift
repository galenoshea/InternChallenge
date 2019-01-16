//
//  ViewController.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-10.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import UIKit

class CollectionsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let url = URL(string: "https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")
    private let cellIdentifier = "collectionCell"
    private var cellRow = 0
    private var collections = [CustomCollection]()

    //Mark: Outlets variables that are connected to the Main Storyboard
    @IBOutlet weak var tableView: UITableView!
    
    //Mark: Creates custom collection object model from json
    private func fetchJson() {
        guard let url = self.url else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , response != nil, error == nil else {
                print("Download Error");
                return
            }
            do {
                let jsonModel = try JSONDecoder().decode(Custom_collections.self, from: data)
                self.collections = jsonModel.custom_collections
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
    
    //Mark: sets view
    internal override func viewDidLoad() {
        super.viewDidLoad()
        fetchJson()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Mark: basic dynamic table view methods
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return collections.count
    }
    
    internal func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //Mark: instantiates each row of table
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CollectionCell
    
        cell.cellView.layer.cornerRadius = 10
        //Mark: row select colour
        let selectedColorView = UIView()
        selectedColorView.backgroundColor = UIColor(red:235/255, green:115/255, blue:127/255, alpha: 1)
        cell.selectedBackgroundView = selectedColorView
        
        cell.cellLabel.text = collections[indexPath.row].title
        
        //Mark: image border
        cell.cellImage.layer.cornerRadius = cell.cellImage.frame.height/2
        cell.cellImage.layer.borderWidth = 1
        cell.cellImage.layer.borderColor = UIColor(red:52/255, green:92/255, blue:125/255, alpha: 1).cgColor
        
        //Mark: sets image from url
        if let imageURL = URL(string: collections[indexPath.row].image!.src!) {
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
    
    //Mark: prepares next view controller with collection data
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let collectionDetailsViewController = segue.destination as? CollectionDetailsViewController {
            collectionDetailsViewController.setCollection(collections[self.cellRow])
            collectionDetailsViewController.setCollectionIdUrl(collections[self.cellRow].id!)
        }
    }
    
    //Mark: row select method
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cellRow = indexPath.row
        tableView.deselectRow(at: indexPath, animated: false)
        self.performSegue(withIdentifier: "CollectionDetails", sender: nil)
    }
    
}

