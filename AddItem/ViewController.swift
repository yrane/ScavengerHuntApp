//
//  ViewController.swift
//  AddItem
//
//  Created by apple-swift on 9/16/14.
//  Copyright (c) 2014 DevPubs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    //var itemName: String? //question mark means optional
    var createdItem: ScavengerHuntitem?
    
    @IBOutlet weak var textField: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if let name = textField.text {
                if !name.isEmpty {
                    createdItem = ScavengerHuntitem(name: name)
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //this will basically pop current screen and return to the screen as mentioned in the navigation control
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

