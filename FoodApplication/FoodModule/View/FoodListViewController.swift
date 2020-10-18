//
//  FoodListViewController.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/25/1399 AP.
//

import UIKit
import RxCocoa
import RxSwift

class FoodListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
  
    
    var itemsFromSource : [FoodModel]?
    let items = BehaviorRelay(value: [FoodModel]())
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableView()
    }

}




extension FoodListViewController : UITableViewDelegate {
    
    private func bindTableView() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        guard let itemsForAccept = itemsFromSource else {
            return
        }
        items.accept(itemsForAccept)
        tableView.register(UINib(nibName: "FoodMainCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        items.bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: FoodMainTableViewCell.self)) { (row,item,cell) in
            cell.txtName.text = item.name
            cell.imageViewFood.image = UIImage(named: item.imageName ?? "")
            cell.txtIngredients.text = item.ingredients
            cell.txtSize.text = item.size
            cell.btnSelect.setTitle("\(String(describing: (item.amount) ?? 0)) USD", for: .normal)
            cell.btnSelect.tag = row
            cell.btnSelect.addTarget(self, action: #selector(self.btnSelectItem(_:)), for: .touchUpInside)
            cell.layer.backgroundColor = UIColor.systemBackground.cgColor
        }.disposed(by: disposeBag)
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    @objc func btnSelectItem(_ sender : UIButton){
        OrderEntity.shared.addToOrderItems(foodModel: (itemsFromSource?[sender.tag])!)
        badge?.increment(animated: true)
    }
}




