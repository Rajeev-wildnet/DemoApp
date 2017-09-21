//
//  RecipeTableViewCell.swift
//  SampleApp
//
//  Created by Rajeev on 21/09/17.
//  Copyright © 2017 Shatakshi. All rights reserved.
//

import UIKit


class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
   
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var ingrediants: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setRecipeData(recipe:Recipe){
        title.text = recipe.title
        ingrediants.text = recipe.ingredients
        DispatchQueue.global().async {
            let imageData = NSData(contentsOf: URL(string:recipe.thumbnail)!) as! Data
            if let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.thumbnailImageView.setCornerRadious(value:  self.thumbnailImageView.frame.size.width/2)
                     self.thumbnailImageView.image = image
                }
                
            }
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
