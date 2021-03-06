//
//  AnimalsViewController.swift
//  TableViews
//
//  Created by Jaxon Stevens on 1/17/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//


import UIKit
import AVFoundation

protocol WestViewControllerDelegate {
    func didSelectanimal(_ animal: String)
}

class WestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // Add index titles
    let westIndexTitles = ["1", "2","3","4"]
    
    // Create Struct here
    
    struct Objects {
        
        var sectionName : String!
        var sectionData : [String]!
        
    }
    
    // Audio is initated here // AUDIO
    var audioPlayer = AVAudioPlayer()
    // AUDIO
    
    
    
    // Create Object Array
    var objectsArray = [Objects] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Lets create an array for both the sections and the sectionData
        objectsArray = [Objects(sectionName: "Western States", sectionData: ["California", "Oregon","Washington","Nevada","Montana","Idaho"]),Objects(sectionName: "American Cities", sectionData: ["Seattle WA", "Portland OR","Los Angeles CA ","San Francisco CA","Las Vegas NV","Mountain View CA","Lake Tahoe CA","Point Roberts WA"]),Objects(sectionName: "Western Provinces", sectionData: ["British Columbia","Alberta",]),Objects(sectionName: "Canadian Cities", sectionData: ["Vancouver BC","Squamish BC","Whistler BC","Calgary AB","Edmonton AB","Kelowna BC","Nelson BC"])]
        
    

        
        
        // SUBMIT BUTTON SOUND
        let buttonsound = Bundle.main.path(forResource: "buttonsound", ofType: "mp3")
        // copy this syntax, it tells the compiler what to do when action is received
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonsound! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        
    }
    // SUBMIT BUTTON SOUND END
    
    // Play submit button sound here
    @IBAction func play(_ sender: AnyObject) {
        audioPlayer.play()
    // Play submit button sound end
        
    }
    
    
    // Play background soundtrack(Inspiration.mp3) here
    @IBAction func playthis(_ sender: AnyObject) {
        
        setupAudio()
    }
    
    
  // Used for UIAlertView
    let Cities = "Cities"
    let States = "States"

    
    var delegate: WestViewControllerDelegate? = nil
    
// Lets create a tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! WestCell
        
        
        // This assigns the data from the array and sections to the CellLabel
        cell.cellLabel?.text = objectsArray [indexPath.section].sectionData [indexPath.row] // ADDED
        
        // return the cell
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.westIndexTitles
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return objectsArray[section].sectionData.count
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return objectsArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return objectsArray[section].sectionName
    
        
    }
    
    
    
    /// UIAlertView ////////////////////////////////////////////////////////////

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title:  objectsArray [indexPath.section].sectionData [indexPath.row], message: "You Selected \( objectsArray [indexPath.section].sectionData [indexPath.row])", preferredStyle: .alert)
        
        let AlertView = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            NSLog("OKAY")
        }
        
        
        alertController.addAction(AlertView)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}



