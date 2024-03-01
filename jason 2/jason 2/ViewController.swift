//
//  ViewController.swift
//  jason 2
//
//  Created by Droadmin on 6/19/23.
//

import UIKit

class ViewController: UIViewController {
   @IBOutlet weak var myTableView: UITableView!
    var jsonobj:ResultItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        ReadJSONFile()
        // Do any additional setup after loading the view.
    }
    func ReadJSONFile()
    {
        let fileName = "sample"
        let fileType = "json"
        if let path = Bundle.main.path(forResource: fileName, ofType: fileType){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path),options: .mappedIfSafe)
             
                self.jsonobj = try JSONDecoder().decode(ResultItem.self, from: data)
                myTableView.reloadData()
               
             
            }catch{print("Error: \(error)")}
        }
    }
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonobj?.feed?.entry?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell") as! MyTableViewCell
        if let feed = jsonobj?.feed?.entry?[indexPath.row]{
            cell.label1.text = feed.category?.attributes?.term ?? ""
        }
        return cell
    }
}

