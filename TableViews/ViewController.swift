//
//  TableViewSections.swift
//  TableViews
//
//  Created by Jaxon Stevens on 1/23/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    // Add index titles
    let westIndexTitles = ["1", "2","3","4"]
    
    struct Objects {
        
        var sectionName : String!
        var sectionData : [String]!
        
    }
    
    
    let cell = "Cell"
    
    var objectsArray = [Objects] ()
    
    override func viewDidLoad() {
     super.viewDidLoad()
        
        // Lets create an array for both the sections and the sectionData
        objectsArray = [Objects(sectionName: "Western States", sectionData: ["California", "Oregon","Washington","Nevada","Montana","Idaho"]),Objects(sectionName: "American Cities", sectionData: ["Seattle WA", "Portland OR","Los Angeles CA ","San Francisco CA","Las Vegas NV","Mountain View CA","Lake Tahoe CA","Point Roberts WA"]),Objects(sectionName: "Western Provinces", sectionData: ["British Columbia","Alberta",]),Objects(sectionName: "Canadian Cities", sectionData: ["Vancouver BC","Squamish BC","Whistler BC","Calgary AB","Edmonton AB","Kelowna BC","Nelson BC"])]
    }
    
    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
      
        cell.textLabel?.text = objectsArray [indexPath.section].sectionData [indexPath.row]
        return cell


    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return objectsArray[section].sectionData.count
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return objectsArray.count
        
    }
    
   override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.westIndexTitles
    }
    

    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        return objectsArray[section].sectionName
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 1 {
            if indexPath.row < 0 {
                
                UserDefaults.standard.synchronize()
                dismiss(animated: true, completion: nil)
            } else {
                
                
                // This will show the UIAlert View when the user clicks on the cell
                let alertController = UIAlertController(title: "\(cell)", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                
                let action = UIAlertAction(title: "You selected a American City", style: UIAlertActionStyle.default, handler: { action in
                    
                })
                
                alertController.addAction(action)
                show(alertController, sender: nil)
            }
            
        }
}




}
