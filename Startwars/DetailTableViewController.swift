//
//  DetailTableViewController.swift
//  Startwars
//
//  Created by Vaibhav Anand on 2020-12-17.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var film: Film!
    var details = [String]()
    let films = Films()
    let group = DispatchGroup() // initialize
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        details = [
            "Name: " + film.title,
            "Episode ID: " + String(film.episodeId),
            "Opening Crawl" + film.openingCrawl,
            "Director" + film.director,
            "Producer" + film.producer,
            "Releae Date" + film.releaseDate,
        ]
        for url in film.charactersURLs {
            group.enter() // wait
            getTitle(url: url, type: "People")
        }
        for url in film.planetsURLs {
            group.enter() // wait
            getTitle(url: url , type: "Planet")
        }
        for url in film.starshipsURLs {
            group.enter() // wait
            getTitle(url: url , type: "Starship")
        }
        for url in film.vehiclesURLs {
            group.enter() // wait
            getTitle(url: url , type: "Vechicle")
        }
        for url in film.speciesURLs {
            group.enter() // wait
            getTitle(url: url , type: "Species")
        }
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    func getTitle(url: String, type: String) {
        films.fetchName(for: url){
            (nameResult) -> Void in
            switch nameResult {
            case let .success(data):
                self.details.append(type + ": " + data)
                self.group.leave()
            case .failure(_):
                self.details.append("Error")
                self.group.leave()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return details.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        cell.textLabel?.text = details[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
