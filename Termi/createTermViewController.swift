//
//  createTermViewController.swift
//  Termy
//
//  Created by Difeng Chen on 3/2/18.
//  Copyright © 2018 Difeng Chen. All rights reserved.
//

import UIKit
import CoreData
class createTermViewController: UIViewController {
    var primaryAcademic = "Computer Science"
    
    let terms:Terms = NSEntityDescription.insertNewObject(forEntityName: "Terms", into: DatabaseController.getContext()) as! Terms
    @IBOutlet weak var primaryAcademicButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        primaryAcademicButton.setTitle(primaryAcademic, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.destination is academicCollectionViewController){
            let ACVController = segue.destination as! academicCollectionViewController
            ACVController.sellectAcademic = (primaryAcademicButton.titleLabel?.text)!
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
