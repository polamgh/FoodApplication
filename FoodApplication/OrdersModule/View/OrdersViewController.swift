//
//  OrdersViewController.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/27/1399 AP.
//

import UIKit
import RxSwift
import RxCocoa

class OrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtAmount: UILabel!
    var orders : Array<FoodModel>  = OrderEntity.shared.getOrderItems()
    let items = BehaviorRelay(value: Array<FoodModel>())
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        txtAmount.text = "\(OrderEntity.shared.getOrederTotalAmounts()) USD"
        initPayButton()
        bindTableView()
        
        

    }
 
    
    func initPayButton()  {
        let btnFab = UIButton()
        btnFab.frame = CGRect(x: self.view.frame.maxX - 80 , y: self.view.frame.maxY - 110, width: 60, height: 60)
        btnFab.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnFab.layer.cornerRadius = 30
        btnFab.layer.borderWidth = 0.2
        btnFab.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        btnFab.setImage(#imageLiteral(resourceName: "pay"), for: .normal)
        self.view.addSubview(btnFab)
    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    


}


extension OrdersViewController : UITableViewDelegate {
    
    private func bindTableView() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        items.accept(orders)
        tableView.register(UINib(nibName: "OrderViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        items.bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: OrderViewCell.self)) { (row,item,cell) in
            cell.txtName.text = item.name
            cell.imgIcon.image = UIImage(named: item.imageName ?? "")
            cell.btnDelete.tag = row
            cell.btnDelete.addTarget(self, action: #selector(self.btnDelete(_:)), for: .touchUpInside)
        }.disposed(by: disposeBag)
    }
    
    @objc func btnDelete (_ sender : UIButton){
        self.orders = OrderEntity.shared.deleteOrderItem(index: sender.tag)
        items.accept(orders)
        txtAmount.text = "\(OrderEntity.shared.getOrederTotalAmounts()) USD"
        badge?.decrement(animated: false)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
