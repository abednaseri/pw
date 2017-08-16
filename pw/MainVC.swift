//
//  MainVC.swift
//  pw
//
//  Created by Abed Naseri Douraki on 04.07.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {

    @IBOutlet weak var tableView: UITableView!
    
    var products_array = [ItemsClass]()
    var filtered_array = [ItemsClass]()
    var searchActive = false
    var searchController: UISearchController!
    
    // pull to reload controller
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product = ItemsClass(id: 1, title: "The title of the product", artikel_nummer: "345612", typ_kategorie: "Type of it", artikel_image_url: "https://www.planungswelten.de/wp-content/uploads/2016/10/Gac_Milieu3-150x150.jpg", status: "Online", start_datum: "Today 16th", end_datum: "Tomorrow")
        products_array.append(product)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.addSubview(self.refreshControl)
        configureSearchController()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        downloadProductItems()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.isActive = false
    }
    
    
    
    
    
    
    
    // Download the data from server and add to products_array
    func downloadProductItems(){
        
        tableView.reloadData()
        
    }
    
    
    // refresh the view when scroll down (scroll happens above with Lazy variable)
    func handleRefresh(_ refreshControl: UIRefreshControl) {
        // Do some reloading of data and update the table view's data source
        // Fetch more objects from a web service, for example...
        downloadProductItems()
        refreshControl.endRefreshing()
    }
    
    
    
    // TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive{
            return filtered_array.count
        }else{
            return products_array.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsCell") as? ItemsCell{
            if searchActive{
                let product_item = filtered_array[indexPath.row]
                cell.configureProductItemsCell(item: product_item)
                return cell
            } else{
                let product_item = products_array[indexPath.row]
                cell.configureProductItemsCell(item: product_item)
                return cell
            }
        } else{
            return ItemsCell()
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditProducts"{
            if let IndexPath = self.tableView.indexPathForSelectedRow{
                let controller = segue.destination as! AddEditVC
                if searchActive{
                    controller.product_obj = filtered_array[IndexPath.row]
                }else{
                    controller.product_obj = products_array[IndexPath.row]
                }
            }
        }
    }

    
    
    
    /////////////// SEARCH VIEW ////////////////
    
    // Setting up the SearchView and adding it to top of Screen
    func configureSearchController(){
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Artikel suchen"
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        self.definesPresentationContext = false
        tableView.tableHeaderView = searchController.searchBar
    }
    
    
    // SearchBar different statues
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !searchActive{
            searchActive = true
            tableView.reloadData()
        }
        searchController.searchBar.resignFirstResponder()
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        if let search_text = searchController.searchBar.text{
            filtered_array = products_array.filter{ product  in
                let what_to_search_for = "\(product.title) \(product.artikel_nummer)"
                return what_to_search_for.lowercased().contains(search_text.lowercased())
            }
        }
        tableView.reloadData()
    }

}

