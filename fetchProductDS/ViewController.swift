//
//  ViewController.swift
//  fetchProductDS
//
//  Created by Macintosh on 31/05/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var ProductTableView: UITableView!
    var jsonDecoder : JSONDecoder?
    var url : URL?
    var urlRequest : URLRequest?
    var products : [Product] = []
    var productTableaviewCell : ProductTableViewCell?
    private var reuseId = "ProductTableViewCell"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSONUsingDecoder()
        initializeTableView()
        registerXIBWithTableView()
    }
    
    func initializeTableView(){
        ProductTableView.dataSource = self
        ProductTableView.delegate = self
    }
    func registerXIBWithTableView(){
       var uiNib = UINib(nibName:"ProductTableViewCell" , bundle: nil)
        self.ProductTableView.register(uiNib, forCellReuseIdentifier: "ProductTableViewCell")
    }

    func parseJSONUsingDecoder(){
        var url = URL(string: "https://fakestoreapi.com/products")
        var urlRequest = URLRequest(url: url!)
        var urlsession = URLSession(configuration: .default)
        var dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            self.products = try! JSONDecoder().decode([Product].self, from: data!)
            self.jsonDecoder = JSONDecoder()
            print(self.products)
//            for eachProduct in productResponse{
//                print(eachProduct)
                DispatchQueue.main.async {
                self.ProductTableView.reloadData()
               }
            }
       
        dataTask.resume()
    }

}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        productTableaviewCell = self.ProductTableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! ProductTableViewCell
     productTableaviewCell?.idLabel.text = String(products[indexPath.row].id)
     productTableaviewCell?.titleLabel.text = products[indexPath.row].title
     productTableaviewCell?.priceLabel.text = String(products[indexPath.row].price)
     productTableaviewCell?.DescriptionLabel.text = products[indexPath.row].description
     productTableaviewCell?.categoryLabel.text = "\(products[indexPath.row].category)"
     productTableaviewCell?.countLabel.text = String(products[indexPath.row].rating.count)
     productTableaviewCell?.rateLabel.text = String(products[indexPath.row].rating.rate)
     productTableaviewCell?.productImageViewLabel.kf.setImage(with: URL(string: products[indexPath.row].image))
        return productTableaviewCell!
    }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
}
