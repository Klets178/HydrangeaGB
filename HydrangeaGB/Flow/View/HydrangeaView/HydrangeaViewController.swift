//
//  HydrangeaViewController.swift
//  HydrangeaGB
//
//  Created by KKK on 03.05.2022.
//

import UIKit

class HydrangeaViewController: UIViewController, NavigationBarDelegate {
    
    private var hydraList: [Character] = []
    private var hydraFiltered: [Character] = []
    
    private var searchBarIsEmpty: Bool {
        guard let text = customNavigationBar.searchBar?.text else { return true }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return !searchBarIsEmpty
    }
    
    private var isViewSercheBar: Bool = false
    
    @IBOutlet weak var customNavigationBar: NavigationBar!
    @IBOutlet weak var tableHydrangea: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        loadFromJson()
        setTableHydrangea()
        setCustomNavigationBar()
        hideKeyboardWhenTappedAround()
    }
}

// MARK:  настройка tableHydrangea
extension HydrangeaViewController {
    func setTableHydrangea() {
        tableHydrangea.delegate = self
        tableHydrangea.dataSource = self
        tableHydrangea.registerCell(type: HydrangeaTableViewCell.self)
    }
}

// MARK:  настройка CustomNavigationBar
extension HydrangeaViewController {
    func setCustomNavigationBar() {
        customNavigationBar.delegate = self
        customNavigationBar.searchBar?.delegate = self
        customNavigationBar.titleLabel?.text = "ГОРТЕНЗИИ"
        customNavigationBar.searchButton?.hiddenFalse()
    }
}

//MARK: Загрузка loadFromJson
extension HydrangeaViewController {
    func loadFromJson() {
        guard
            let localData = ParsingDataJson.instance.getInfoFile(),
            let data = ParsingDataJson.instance.parseJSON(jsonData: localData)
        else { logging(""); return }
                        
        hydraList = data.lists
    }
}

// MARK: - Table view delegate methods
extension HydrangeaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering ? hydraFiltered.count : hydraList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueCell(withType: HydrangeaTableViewCell.self, for: indexPath) as? HydrangeaTableViewCell
        else { return UITableViewCell() }

        if isFiltering {
            cell.configure(with: hydraFiltered[indexPath.row])
        } else  {
            cell.configure(with: hydraList[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDetail(row: indexPath.row)
    }
}

// MARK: - Gesture Delegate
extension HydrangeaViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self == self.navigationController?.topViewController ? false : true
    }
}

// MARK: - goto HydrangeaDetailStoryboard
extension HydrangeaViewController {
    func toDetail(row: Int) {
        let storyboard = UIStoryboard(name: "HydrangeaDetailStoryboard", bundle: nil)
        guard
            let detailViewController = storyboard.instantiateViewController(identifier: "HydrangeaDetailStoryboard") as? HydrangeaDetailViewController
        else { return }
        
        if isFiltering {
            detailViewController.character = hydraFiltered[row]
        } else  {
            detailViewController.character = hydraList[row]
        }
        navigationController?.pushViewController(detailViewController, animated: true)
     }
}

// MARK: - UISearchBarDelegate  Delegate
extension HydrangeaViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        hydraFiltered = searchText.isEmpty ? hydraList : hydraList.filter { (item: Character) -> Bool in
            return item.name.lowercased().contains(searchText.lowercased())
        }
        tableHydrangea.reloadData()
    }
}


// MARK: Кнопка searchAction()
extension HydrangeaViewController {
    func searchAction() {
        isViewSercheBar.toggle()
        customNavigationBar.searchBar.isHidden = !isViewSercheBar
        customNavigationBar.titleLabel.isHidden = isViewSercheBar
    }
}
