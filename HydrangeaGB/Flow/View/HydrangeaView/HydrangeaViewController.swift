//
//  HydrangeaViewController.swift
//  HydrangeaGB
//
//  Created by KKK on 03.05.2022.
//

import UIKit

class HydrangeaViewController: UIViewController, NavigationBarDelegate {
    
    var hydraList: [Character] = []
    var hydraCount: Int = 0
    
    @IBOutlet weak var customNavigationBar: NavigationBar!
    @IBOutlet weak var tableHydrangea: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        customNavigationBar.delegate = self
        
        tableHydrangea.delegate = self
        tableHydrangea.dataSource = self
        
        tableHydrangea.registerCell(type: HydrangeaTableViewCell.self)
        
        customNavigationBar.titleLabel.text = "ГОРТЕНЗИИ"

    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadFromJson()
    }

}

//
extension HydrangeaViewController {
    func loadFromJson() {
        guard
            let localData = ParsingDataJson.instance.getInfoFile(),
            let data = ParsingDataJson.instance.parseJSON(jsonData: localData)
        else { logging(""); return }
                        
        hydraList = data.lists
        hydraCount = data.info.count
    }
}

extension HydrangeaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hydraCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueCell(withType: HydrangeaTableViewCell.self, for: indexPath) as? HydrangeaTableViewCell
        else { return UITableViewCell() }

        cell.configure(with: hydraList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDetail(row: indexPath.row)
    }
    

}


extension HydrangeaViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self == self.navigationController?.topViewController ? false : true
    }
    
}


//переходим к HydrangeaDetailStoryboard
extension HydrangeaViewController {
    func toDetail(row: Int) {
        let storyboard = UIStoryboard(name: "HydrangeaDetailStoryboard", bundle: nil)
        guard
            let detailViewController = storyboard.instantiateViewController(identifier: "HydrangeaDetailViewController") as? HydrangeaDetailViewController
        else { return }
        detailViewController.character = hydraList[row]

        show(detailViewController, sender: nil)
    }
}



