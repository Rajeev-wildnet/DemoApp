//
//  ViewController.swift
//  SampleApp
//
//  Created by Rajeev on 21/09/17.
//  Copyright © 2017 Wildnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let cellIdentifierRecipe = "RecipeTableViewCell"
    //MARK:- IBOutlets
    @IBOutlet weak var tableViewRecipe:UITableView?
   
    @IBOutlet weak var searchBarRecipe:UISearchBar?
    var currentPage = 1
    var recipes:[Recipe] = []
   
    
    
    //MARK:- View controller life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewRecipe?.isHidden = true
        registerCell()
        
        
     

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func registerCell(){
        tableViewRecipe?.register(UINib.init(nibName: cellIdentifierRecipe, bundle : nil), forCellReuseIdentifier: cellIdentifierRecipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRecipeWith(recipeStr:String){
       
        ServiceClient.call(URLS.BASE_URL, method: .get, param: ["p":recipeStr,"q":"","page":currentPage], header: [:]) { (response) in
            DispatchQueue.main.async {
                if let res:AnyObject = response  {
                    
                    let envelope = ResponseSkeleton(res)
                    if envelope.getResource().count > 0 {
                        // result is more than 0
                        self.recipes = []
                        let array = envelope.getResource() as! NSArray
                        
                        for recipe in array {
                            
                            var recipeTitle = ""
                            if let title = (recipe as! NSDictionary).object(forKey: KEY_RECIPE.TITLE) {
                                recipeTitle = title as! String
                            }
                            
                            var recipehref = ""
                            if let href = (recipe as! NSDictionary).object(forKey: KEY_RECIPE.HREF) {
                                recipehref = href as! String
                            }
                            
                            
                            
                            var recipeIngredients = ""
                            if let ingredients = (recipe as! NSDictionary).object(forKey: KEY_RECIPE.INGREDIENTS) {
                                recipeIngredients = ingredients as! String
                            }
                            
                            
                            var recipeThumbnail = ""
                            if let thumbnail = (recipe as! NSDictionary).object(forKey: KEY_RECIPE.THUMBNAIL) {
                                recipeThumbnail = thumbnail as! String
                            }

                            
                            
                            
                            let recipe = Recipe(title: recipeTitle, thumbnail: recipeThumbnail, ingredients: recipeIngredients, href: recipehref)
                            
                            self.recipes.append(recipe)
                            
                        }
                        self.searchBarRecipe?.resignFirstResponder()
                         self.tableViewRecipe?.isHidden = false
                        self.tableViewRecipe?.reloadData()
                    }else{
                        
                    }
                    
                }
                else{
                    
                    self.view.makeToast(message: k_network_Error, duration: 3.0, position: HRToastPositionTop as AnyObject )
                }

            }
        }
        
    }


}

//MARK:- TableView DataSource Method
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipeTableCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierRecipe) as? RecipeTableViewCell
        recipeTableCell?.setRecipeData(recipe: recipes[indexPath.row] )
        return recipeTableCell!
    }
}


//MARK:- SearchBarDelegate Method
extension ViewController:UISearchBarDelegate {
  
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool{
        let recipeStr = searchBar.text!+text
        if (recipeStr.characters.count) > 3 {
            recipes = []
            getRecipeWith(recipeStr: recipeStr)
        }else{
            tableViewRecipe?.isHidden = true
        }
        return true
    }
}




