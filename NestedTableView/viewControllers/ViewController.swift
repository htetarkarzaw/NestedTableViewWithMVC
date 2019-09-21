//
//  ViewController.swift
//  NestedTableView
//
//  Created by Htet Arkar Zaw on 9/15/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: BaseViewController {

    @IBOutlet weak var tvNested: UITableView!
//    var parentList : [ParentVO] = []
    var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        tvNested.delegate = self
        tvNested.dataSource = self
        tvNested.separatorStyle = .none
        
//        let baseUrlString = "https://a847c7d4-655d-497f-9f10-b3ea1a4e51b5.mock.pstmn.io/parents"
//        guard let url = URL(string: baseUrlString) else { return }
        
//        Alamofire.request(url).responseData { (response) in
//
//            guard let data = response.result.value else {return}
//
//            do{
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                self.parentList = try
//                    decoder.decode([ParentVO].self, from: data)
//                self.tvNested.reloadData()
//            }catch let jsonErr{
//                print(jsonErr.localizedDescription)
//            }
//        }
        
        getParentList()
        
        tvNested.registerForCell(strID: ParentTableViewCell.identifier)
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tvNested.addSubview(refreshControl)
    }
    @objc func onRefresh(){
        getParentList()
    }

    private func getParentList(){
           self.showProgress(message: "Loading")
           StudentModel.shared().apiGetParentList(success: {
               self.hideProgress()
               self.refreshControl.endRefreshing()
               self.tvNested.reloadData()
           }) { (err) in
               self.refreshControl.endRefreshing()
               self.hideProgress()
               print(err)
           }
       }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let childItemCount = StudentModel.shared().studentResponse[indexPath.row].childs?.count ?? 0
        
        return CGFloat(53 + (108 * childItemCount))
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentModel.shared().studentResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ParentTableViewCell.identifier, for: indexPath) as! ParentTableViewCell
        cell.parent = StudentModel.shared().studentResponse[indexPath.row]
        return cell
    }
    
    
}

