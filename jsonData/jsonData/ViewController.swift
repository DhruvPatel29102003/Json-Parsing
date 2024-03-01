//
//  ViewController.swift
//  jsonData
//
//  Created by Droadmin on 6/19/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
   
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var labelTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ReadJSONFile()
        // Do any additional setup after loading the view.
    }
   var detail = fatchData()
    func ReadJSONFile(){
        if let path = Bundle.main.path(forResource: "sample", ofType: "json"){
            do{
                let data = try Data(contentsOf:URL(fileURLWithPath: path),options:.mappedIfSafe)//option file ko memory mein map karne ka option deta hai, jo efficient tarike se large files ko handle karne mein madadgar ho sakta hai.
                let result = try JSONSerialization.jsonObject(with: data,options: .mutableLeaves)
                if let jsonResult = result as?[String: Any]{
                    
                    if let feed = jsonResult["feed"] as?[String: Any]{
                        if let title = feed["title"] as?[String:Any]{
                            if let label = title["label"] as? String{
                                labelTitle.text = label
                            }
                        }
                        if let entry = feed["entry"] as? [[String:Any]]{
                            var arrsum = [String]()
                            for summaryObj in entry{
                                if let summary1 = summaryObj["summary"] as? [String: Any]{
                                    if let label = summary1["label"] as? String{
                                        arrsum.append(label)
                                    
                                    }
                                }
                            }
                           // detail.title = title
                            detail.summery = arrsum
                            tableView.reloadData()
                            //print(detail.title)
                            //print(detail.summery)
                        }
                        
                    }
                }
            }catch{
                print("\(error)")
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detail.summery?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.labelSummary.text = detail.summery?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(indexPath.row)
        let detailvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")as! SecondViewController
        detailvc.summaryText = detail.summery?[indexPath.row] ?? ""
        self.navigationController?.pushViewController(detailvc, animated: true)
    }

}

