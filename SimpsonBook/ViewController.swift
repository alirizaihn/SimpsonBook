//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ali Rıza İLHAN on 18.10.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    
    @IBOutlet weak var tableView: UITableView!
    var simsonArray = [Simpson]()
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety", image: UIImage(named: "homer")!)
        let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "Housewife", image: UIImage(named: "marge")!)
        let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Student", image: UIImage(named: "bart")!)
        let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", image: UIImage(named: "lisa")!)
        let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "Baby", image: UIImage(named: "maggie")!)
        
        simsonArray.append(homer);
        simsonArray.append(marge);
        simsonArray.append(bart);
        simsonArray.append(lisa);
        simsonArray.append(maggie);
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = simsonArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return simsonArray.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSimpson = simsonArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailVC", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = selectedSimpson
            
        }
    }

}

