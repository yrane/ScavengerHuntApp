//
//  ListViewController.swift
//  AddItem
//
//  Created by apple-swift on 9/16/14.
//  Copyright (c) 2014 DevPubs. All rights reserved.
//

import Foundation

import UIkit

class ListViewController : UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {  //The last 2 protocols added for ImagePicker action of delegate which was giving error otherwise
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePicker.sourceType = .Camera          // If Camera is available
            
        } else {
            imagePicker.sourceType = .PhotoLibrary    // If Camera is not available
        }
        
        imagePicker.delegate = self                   // Need to add imagePicker protocols as mentioned above in ListViewController class declaration
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    
    @IBAction func unwindToList(segue: UIStoryboardSegue){
        if segue.identifier == "DoneItem" {
            
            let addItemController = segue.sourceViewController as ViewController
            if let newItem = addItemController.createdItem {
                itemList += [newItem]
                
                // adding new item to the listview by adding new index
                // Here we are adding new item to the view and not the model, which would have meant updating the initial array itself
                let indexPath = NSIndexPath(forRow: itemList.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    var itemList = [ScavengerHuntitem]()
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell") as UITableViewCell
        
        let item = itemList[indexPath.row]
        cell.textLabel!.text = item.name
        
        if (item.isComplete) {
            cell.accessoryType = .Checkmark
            cell.imageView!.image = item.photo
        } else {
            cell.accessoryType = .None
            cell.imageView?.image = nil
        }
        
        return cell
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: NSDictionary) {
        
        let indexPath = tableView.indexPathForSelectedRow()!
        let selectedItem = itemList[indexPath.row]
        
        let photo = info[UIImagePickerControllerOriginalImage] as UIImage
        selectedItem.photo = photo
        
        //return the image back to first screen and also check the selected item
        dismissViewControllerAnimated(true, completion: {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        })
        
    }
    
}