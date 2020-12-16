//
//  ViewController.swift
//  Startwars
//
//  Created by Vaibhav Anand on 2020-12-14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func films(_ sender: Any) {
        performSegue(withIdentifier: "categoryList", sender: self)
    }
    
    @IBAction func people(_ sender: Any) {
    }
    
    @IBAction func planets(_ sender: Any) {
    }
    
    @IBAction func species(_ sender: Any) {
    }
    
    @IBAction func starships(_ sender: Any) {
    }
    
    @IBAction func vechicles(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "categoryList") {
            if let controllerListViewController: CategoryListViewController = segue.destination as? CategoryListViewController {
                
            }
        }
    }
}


