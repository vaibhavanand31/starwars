//
//  CategoryListViewController.swift
//  Startwars
//
//  Created by Vaibhav Anand on 2020-12-14.
//

import UIKit

class CategoryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    @IBAction func backToViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var categoryNavigationBar: UINavigationBar!
    @IBOutlet weak var categoryTableView: UITableView!
    
    let films = Films()
    var finalFilms = [Film]()
    var favFilms: FavFilms!
    
    //MARK:- UITableView Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryViewCell
        let finalFilm = self.finalFilms[indexPath.row]
        cell.categoryName?.text = finalFilm.title
        
        var alreadyExit = false
        for favouriteFilm in self.favFilms.favFilms {
            if(favouriteFilm.title == finalFilms[indexPath.row].title){
                alreadyExit = true
                finalFilms[indexPath.row].isFav = true
            }
        }
        
        cell.doubleTapped = {
            finalFilm.isFav = !finalFilm.isFav
            if (finalFilm.isFav) {
                if (!alreadyExit){
                    self.favFilms.addFavFilm(title: finalFilm.title, episodeId: finalFilm.episodeId, openingCrawl: finalFilm.openingCrawl, director: finalFilm.director, producer: finalFilm.producer, releaseDate: finalFilm.releaseDate, charactersURLs: finalFilm.charactersURLs, planetsURLs: finalFilm.planetsURLs, starshipsURLs: finalFilm.starshipsURLs, vehiclesURLs: finalFilm.vehiclesURLs, speciesURLs: finalFilm.speciesURLs, isFav: true)
                }
            }
            else {
                self.favFilms.removeFavFilm(title: finalFilm.title)
            }
            self.favFilms.saveChanges()
            tableView.reloadData()
        }
        
        cell.cellTapped = {
            self.performSegue(withIdentifier: "details", sender: indexPath)
        }
        
        if(finalFilms[indexPath.row].isFav) {
            cell.isFavImage.alpha = 1
        }
        else {
            cell.isFavImage.alpha = 0
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        films.fetchFilms{
            (filmsResult) -> Void in
            switch filmsResult {
                case let .success(film):
                    self.finalFilms.append(contentsOf: film)
                case let .failure(error):
                    print(error)
            }
            self.categoryTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "details") {
            if let detailViewController: DetailTableViewController = segue.destination as? DetailTableViewController {
                let index = sender as! IndexPath
                detailViewController.film = finalFilms[index.row]
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
