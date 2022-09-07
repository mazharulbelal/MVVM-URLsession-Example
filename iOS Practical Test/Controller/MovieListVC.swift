//
//  MovieListVC.swift
//  iOS Practical Test
//
//  Created by Belal on 7/9/22.
//

import UIKit

class MovieListVC: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var movieCell = "MovieTableViewCell"
    let searchController = UISearchController(searchResultsController: nil)
    var isSearching = false
    var defaultText = "marvel"
    var viewModel = MovieViewModel()
    var movieList : [Result]?
    
    
    fileprivate func viewModelMovieListAPICalled(_ movieName: String) {
        viewModel.getMovieList(movieName: movieName) { [weak self] in
            self?.movieList = self?.viewModel._movieList
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: movieCell, bundle: nil), forCellReuseIdentifier: movieCell)
        self.setNavigationTitle(title: "Movie List")
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        viewModelMovieListAPICalled(defaultText)
        
    }
}


extension MovieListVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCell) as! MovieTableViewCell
        if let  _movieList = movieList {
            cell.selectionStyle = .none
            cell.titleLbl.text = _movieList[indexPath.row].title
            cell.desLbl.text = _movieList[indexPath.row].overview
            cell.imgView.downloadImage(_movieList[indexPath.row].posterPath)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}




extension MovieListVC: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        (searchText.count > 0) ? isSearchingEnable(searchText) : isSearchingDisable()
    }
    
    func isSearchingEnable(_ text: String) {
        viewModelMovieListAPICalled(text)
        isSearching = true
        tableView.reloadData()
    }
    
    
    func isSearchingDisable() {
        isSearching = false
        viewModelMovieListAPICalled(defaultText)
        tableView.reloadData()
    }
}





