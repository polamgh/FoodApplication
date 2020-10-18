//
//  PizzaViewController.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/25/1399 AP.
//

import UIKit

class FoodListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items = [ ["name": "Cheese" , "imageName": "Cheese" , "ingredients": "It will always be a simple, unadorned masterpiece on its own.","size": "200 grams, 35 cm","amount": "30 USD"] ,
                  ["name": "Veggie" , "imageName": "Veggie", "ingredients": "Everything from peppers and mushrooms, to eggplant and onions make for an exciting and tasty veggie pizza.","size": "200 grams, 35 cm","amount": "30 USD"] ,
                  ["name": "Pepperoni" , "imageName": "Pepperoni", "ingredients": "Who doesn’t love biting into a crispy, salty round of pepperoni","size": "200 grams, 35 cm","amount": "30 USD"],
                  ["name": "Meat" , "imageName": "Meat", "ingredients": "Pile on ground beef and sausage for a hearty meal","size": "200 grams, 35 cm","amount": "30 USD"],
                  ["name": "Margherita" , "imageName": "Margherita", "ingredients": "Margherita pizza is made with basil, fresh mozzarella, and tomatoes","size": "200 grams, 35 cm","amount": "30 USD"],
                  ["name": "BBQ Chicken" , "imageName": "BBQ Chicken", "ingredients": "The chicken slathered over the top of a pie gives it a tangy, sweet flavor that can’t be beaten","size": "200 grams, 35 cm","amount": "30 USD"],
                  ["name": "Hawaiian" , "imageName": "Hawaiian", "ingredients": "add in some ham and it creates an unexpectedly solid sweet and salty combination for this type of pizza","size": "200 grams, 35 cm","amount": "30 USD"],
                  ["name": "Buffalo" , "imageName": "Buffalo", "ingredients": "All its spicy, salty, buttery goodness is a natural pairing for pizza","size": "200 grams, 35 cm","amount": "30 USD"],
                  ["name": "Supreme" , "imageName": "Supreme", "ingredients": "scattered on these pies, from sausage to vegetables to pepperoni. And it’s the combination of the flavors that really makes it sing.","size": "200 grams, 35 cm","amount": "30 USD"],
                  ["name": "The Works" , "imageName": "The Works", "ingredients": "a wide variety of veggie toppings including onions, olives, and mushrooms, plus bacon and pepperoni","size": "200 grams, 35 cm","amount": "30 USD"]
    ]
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FoodMainCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
       


    }


  
    
  
    
 
}




extension FoodListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FoodMainTableViewCell
        cell.txtName.text = self.items[indexPath.row]["name"]
        cell.imageViewFood.image = UIImage(named: self.items[indexPath.row]["imageName"] ?? "")
        cell.txtIngredients.text = self.items[indexPath.row]["ingredients"]
        cell.txtSize.text = self.items[indexPath.row]["size"]
        cell.btnSelect.setTitle(self.items[indexPath.row]["amount"], for: .normal)
        cell.btnSelect.addTarget(self, action: #selector(btnSelectItem(_:)), for: .touchUpInside)
        cell.layer.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1).cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    @objc func btnSelectItem(_ sender : UIButton){
        badge?.increment(animated: true)
    }
}




