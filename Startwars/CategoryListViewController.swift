//
//  CategoryListViewController.swift
//  Startwars
//
//  Created by Vaibhav Anand on 2020-12-14.
//

import UIKit

class CategoryListViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate {

    @IBOutlet weak var categoryNavigationBar: UINavigationBar!
    @IBOutlet weak var categoryTableView: UITableView!
    
    let films = Films()
    var finalFilms = [Film]()
    var favFilms: FavFilms!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        categoryNavigationBar.topItem?.backBarButtonItem = backButton
       
        films.fetchFilms{
            (filmsResult) -> Void in
            switch filmsResult {
                case let .success(film):
                    self.finalFilms.append(contentsOf: film)
                    print(self.finalFilms[1].title)
            case let .failure(error):
                print(error)
            }
            self.categoryTableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    //MARK:- UIRTableView Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryViewCell
        var finalFilm = self.finalFilms[indexPath.row]
        cell.categoryName?.text = finalFilm.title
        
        cell.doubleTapped = {
            finalFilm.isFav = !finalFilm.isFav
            if (finalFilm.isFav) {
                self.favFilms.addFavFilm(title: finalFilm.title, episodeId: finalFilm.episodeId, openingCrawl: finalFilm.openingCrawl, director: finalFilm.director, producer: finalFilm.producer, releaseDate: finalFilm.releaseDate, charactersURLs: finalFilm.charactersURLs, planetsURLs: finalFilm.planetsURLs, starshipsURLs: finalFilm.starshipsURLs, vehiclesURLs: finalFilm.vehiclesURLs, speciesURLs: finalFilm.speciesURLs, isFav: true)
            }
            else {
                self.favFilms.removeFavFilm(title: finalFilm.title)
            }
            tableView.reloadData()
        }
        
        cell.cellTapped = {
            self.performSegue(withIdentifier: "details", sender: self)
        }
        
        if(finalFilms[indexPath.row].isFav) {
            cell.isFavImage.alpha = 1
        }
        else {
            cell.isFavImage.alpha = 0
        }
        return cell
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
