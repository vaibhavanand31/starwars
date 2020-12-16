//
//  CategoryViewCell.swift
//  Startwars
//
//  Created by Vaibhav Anand on 2020-12-15.
//

import UIKit

class CategoryViewCell: UITableViewCell {

    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var isFavImage: UIImageView!
    
    var doubleTapped : (() -> ())?
    var cellTapped : (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.isUserInteractionEnabled = true
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTappedCell))
        singleTap.numberOfTapsRequired = 1
        self.addGestureRecognizer(singleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTappedCell))
        doubleTap.numberOfTapsRequired = 2
        self.addGestureRecognizer(doubleTap)
        
        singleTap.require(toFail: doubleTap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func doubleTappedCell(){
        self.doubleTapped?()
    }
    
    @objc func singleTappedCell(){
        self.cellTapped?()
    }

}
