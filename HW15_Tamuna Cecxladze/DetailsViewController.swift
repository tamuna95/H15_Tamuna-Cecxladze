//
//  DetailsViewController.swift
//  HW15_Tamuna Cecxladze
//
//  Created by APPLE on 12.07.22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var addToFavoriteLbl: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieMainActor: UILabel!
    @IBOutlet weak var movieImdb: UILabel!
    @IBOutlet weak var movieReleaseData: UILabel!
    
    var movieDescriptionField : String?
    var movieMainActorField :String?
    var movieImdbField : String?
    var movieReleaseDataField :String?
    var movieTitleField : String?
    
    var favoriteMoviesArr = [String]()
    override func viewDidLoad() {
        addToFavoriteLbl.isHidden = true
        super.viewDidLoad()
        movieDescription.text = movieDescriptionField
        //ვერ ვხვდები რატომ არ მუშაობს ლეიბლი მრავალხაზზე, მითითებული მაქვს ხაზების რაოდენობა. 0 რომ მივუთითო მაინც არ მუშაობს
        
        movieTitle.text = movieTitleField
        movieImdb.text = movieImdbField
        movieReleaseData.text = movieReleaseDataField
        movieMainActor.text = movieMainActorField
        movieReleaseData.text = movieReleaseDataField
    }
    
    @IBAction func addToFavourite(_ sender: Any) {
        favoriteMoviesArr.append(self.movieTitleField ?? "Title Not found")
        addToFavoriteLbl.isHidden = false
        print(favoriteMoviesArr)
    }
    
    
    
    
    
    
}
