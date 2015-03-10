//
//  PersonDetailViewController.swift
//  Roster
//
//  Created by Erika Feldman on 3/5/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    
    @IBOutlet weak var image: UIImageView!

    var selectedPerson = Person(firstName: "dummy", lastName: "dummy")
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.title = self.selectedPerson.firstName
        self.firstNameLabel.delegate = self
        self.lastNameLabel.delegate = self
        
        self.firstNameLabel.text = self.selectedPerson.firstName
        self.lastNameLabel.text = self.selectedPerson.lastName
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.selectedPerson.firstName = self.firstNameLabel.text
        self.selectedPerson.lastName = self.lastNameLabel.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func photosButtonPressed(sender: AnyObject) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                imagePickerController.sourceType =
                    UIImagePickerControllerSourceType.Camera }
        else {
            imagePickerController.sourceType =
                UIImagePickerControllerSourceType.PhotoLibrary}
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]){
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        self.image.image = image
        self.selectedPerson.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


