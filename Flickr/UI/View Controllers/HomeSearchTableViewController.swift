//
//  HomeSearchTableViewController.swift
//  Flickr
//
//  Created by Fady Derias on 3/26/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import UIKit

private let flickrTableViewCellIdentifier = "flickrTableViewCellIdentifier"

class HomeSearchTableViewController: UITableViewController, UISearchBarDelegate, HomePresenterViewDelegate {
    
    private var photos = [FLPhoto]()
    private let homePresenter = HomePresenter()
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.definesPresentationContext = false
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        enableSearch()
        self.homePresenter.addHomePresenterViewDelegate(withHomePresenterViewDelegate: self)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: flickrTableViewCellIdentifier, for: indexPath) as! FlickrPhotoTableViewCell
        let photo = self.photos[indexPath.row]
        cell.configure(forPhoto: photo)
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath) as! FlickrPhotoTableViewCell
        cell.photoImageView.showFullscreen()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == self.photos.count - 1) {
            self.homePresenter.loadMorePhotos()
        }
    }
    
    // MARK: - HomePresenterViewDelegate
    
    func didLoadPhotos(photos: [FLPhoto]) {
        if (!self.photos.isEmpty) {
            self.navigateTableViewToTop()
        }
        
        self.photos.removeAll()
        self.photos = photos
        self.reloadTableView()
    }
    
    func didLoadMorePhotos(photos: [FLPhoto]) {
        self.photos.append(contentsOf: photos)
        self.reloadTableView()
    }
    
    func serverError() {
        presentAlertController(alertController: UIAlertController.serverErrorAlertController())
    }
    
    func networkConnectionError() {        
        presentAlertController(alertController: UIAlertController.connectionErrorAlertController())
    }
    
    //MARK:- UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            self.homePresenter.loadPhotos(withText: searchText)
        }
    }
    
    //MARK:- Network Support
    
    private func loadPhotos(searchText: String) {
        self.homePresenter.loadPhotos(withText: searchText)
    }
    
    private func enableSearch() {
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    //MARK:- UI Support
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Flickr"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        self.tableView.tableFooterView = UIView()
        self.tableView.keyboardDismissMode = .onDrag
        self.registerTableViewCells()
    }
    
    private func registerTableViewCells() {
        self.tableView.register(FlickrPhotoTableViewCell.self, forCellReuseIdentifier: flickrTableViewCellIdentifier)
    }
    
    private func reloadTableView() {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
    
    private func navigateTableViewToTop() {
        OperationQueue.main.addOperation {
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    
    private func presentAlertController(alertController: UIAlertController) {
        OperationQueue.main.addOperation {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
