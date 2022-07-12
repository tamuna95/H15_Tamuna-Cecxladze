//
//  ViewController.swift
//  HW15_Tamuna Cecxladze
//
//  Created by APPLE on 12.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var movieTableView: UITableView!
    var indexPathArr = [IndexPath]()
    
    var moviesArr :[Movie] = [Movie(title: "Title1", releaseDate: "11.01.2010", imdb: 7.8, mainActor: "Actor1", seen: true, isFavourite: true),
                              Movie(title: "Title2", releaseDate: "20.03.2012", imdb: 8.9, mainActor: "Actor2", seen: false, isFavourite: false),
                              Movie(title: "Title3", releaseDate: "03.09.2020", imdb: 9.8, mainActor: "Actor3", seen: true, isFavourite: false),
                              Movie(title: "Title4", releaseDate: "31.09.2009", imdb: 6.7, mainActor: "Actor4", seen: false, isFavourite: false),
                              Movie(title: "Title5", releaseDate: "21.09.2006", imdb: 8.7, mainActor: "Actor5", seen: true, isFavourite: true),
                              Movie(title: "Title6", releaseDate: "29.09.2021", imdb: 7.7, mainActor: "Actor6", seen: false, isFavourite: false),
                              Movie(title: "Title7", releaseDate: "21.10.2001", imdb: 5.7, mainActor: "Actor7", seen: true, isFavourite: false),
                              Movie(title: "Title8", releaseDate: "1.09.2003", imdb: 4.7, mainActor: "Actor8", seen: true, isFavourite: false),
                              Movie(title: "Title9", releaseDate: "11.05.2016", imdb:6.7, mainActor: "Actor9", seen: true, isFavourite: true), Movie(title: "Titl10", releaseDate: "21.07.2021", imdb: 6.8, mainActor: "Actor10", seen: true, isFavourite: false)]
    var seenFilmsArr = [Movie]()
    var notSeenFilmsArr = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sortedBySeenMovies(_ sender: Any) {
        moviesArr.sort(by: { $0.seen && !$1.seen})
        print(moviesArr)
        self.movieTableView.reloadData()
    }
    
    @IBAction func sortedByIsFavourite(_ sender: Any) {
        moviesArr.sort(by: { $0.isFavourite && !$1.isFavourite})
        print(moviesArr)
        self.movieTableView.reloadData()
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPathArr.append(indexPath)
        performSegue(withIdentifier: "DetailsViewController", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsViewController" {
            let detailsVC = segue.destination as! DetailsViewController
            for i in indexPathArr {
                detailsVC.movieTitleField = moviesArr[i.row].title
                detailsVC.movieImdbField = String(moviesArr[i.row].imdb)
                detailsVC.movieDescriptionField = moviesArr[i.row].description
                detailsVC.movieMainActorField = moviesArr[i.row].mainActor
                detailsVC.movieReleaseDataField = moviesArr[i.row].releaseDate
            }
        }
    }
}
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return moviesArr.count
        }else if section == 1 {
            return seenFilmsArr.count
        }else {
            return notSeenFilmsArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableViewCell
        cell.titleLabel.text = moviesArr[indexPath.row].title
        cell.imdbLabel.text = "Imdb: \(String(moviesArr[indexPath.row].imdb))"
        
        cell.delegateOfChangeSection = self
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 30))
        header.addSubview(label)
        header.backgroundColor = .orange
        if section == 0 {
            label.text = "ყველა ფილმი"
            
        }else if section == 1 {
            label.text = "ნანახი ფილმები"
            
        }else if section == 2 {
            label.text = "სანახავი ფილმები"
        }
        return header
    }
    
}

//ვერ გავმართე სექციაში დამატების ფუნქციონალი
extension ViewController : ChangeSection {
    func MoveInSection(cell: MovieTableViewCell) {
        if let indexPath = movieTableView.indexPath(for: cell) {
            if moviesArr[indexPath.row].seen {
                seenFilmsArr.append(moviesArr[indexPath.row])
                print("print",moviesArr[indexPath.row])
                self.movieTableView.reloadData()
                
            }
            else {
                notSeenFilmsArr.append(moviesArr[indexPath.row])
                print(moviesArr[indexPath.row].seen)
                self.movieTableView.reloadData()
                
            }
            
        }
    }
    
    
}

