//
//  MovieTableViewCell.swift
//  HW15_Tamuna Cecxladze
//
//  Created by APPLE on 12.07.22.
//

import UIKit
protocol ChangeSection {
    func MoveInSection(cell: MovieTableViewCell)
}
class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var delegateOfChangeSection: ChangeSection!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func changeSectionButton(_ sender: UIButton) {
        delegateOfChangeSection.MoveInSection(cell: self)
    }
    
}
