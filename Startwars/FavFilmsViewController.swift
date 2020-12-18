//
//  FavFilmsViewController.swift
//  Startwars
//
//  Created by Vaibhav Anand on 2020-12-15.
//

import UIKit

class FavFilmsTableViewController: UITableViewController {

    var favFilms: FavFilms!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favFilms.favFilms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favFilm", for: indexPath) as! FavFilmViewCell
        
        cell.favFilmTitle.text = favFilms.favFilms[indexPath.row].title
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

class FavFilmViewCell: UITableViewCell {
    
    @IBOutlet weak var favFilmTitle: UILabel!
}
