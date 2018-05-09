//
//  academicCollectionViewController.swift
//  Termy
//
//  Created by Difeng Chen on 2/27/18.
//  Copyright © 2018 Difeng Chen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class academicCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var academicCollectionView: UICollectionView!
    let academicArray: [String] = ["Computer Science","Education","Physics","Music","Art","Business","Law","History","Psychology","Literature","Language","Mathematics","Medical Science","Geography","Biology","Chemistry","Political Science","Philosophy"]
    var sortedAcademicArray = [String]()
    var sellectAcademic = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        academicCollectionView.delegate = self
        academicCollectionView.dataSource = self
        sortedAcademicArray = academicArray.sorted()
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return sortedAcademicArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! academicCollectionViewCell
        cell.academicTitle.text = sortedAcademicArray[indexPath.row]
        cell.academicImage.image = UIImage(named:sortedAcademicArray[indexPath.row])
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sellectAcademic = sortedAcademicArray[indexPath.row]
        performSegue(withIdentifier: "AcademicsToCreateTerm", sender: Any?.self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let AController = segue.destination as! createTermViewController
        AController.primaryAcademic = sellectAcademic
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
