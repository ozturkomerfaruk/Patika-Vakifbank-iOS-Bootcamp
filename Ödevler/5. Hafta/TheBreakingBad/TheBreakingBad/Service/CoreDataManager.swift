//
//  CoreDataManager.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 1.12.2022.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private let managedContext: NSManagedObjectContext!
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func saveNote(tvSeries: String, noteText: String, image: UIImage, episode: String) -> EpisodeNote? {
        let entity = NSEntityDescription.entity(forEntityName: "EpisodeNote", in: managedContext)!
        let note = NSManagedObject(entity: entity, insertInto: managedContext)
        
        //Image to JPG Binary Code
        let data = image.jpegData(compressionQuality: 1)
        //let data = imageV.image?.pngData() // Image to PNG Binary Code
        
        note.setValue(tvSeries, forKey: "tvSeries")
        note.setValue(noteText, forKey: "noteText")
        note.setValue(data, forKey: "image")
        note.setValue(episode, forKey: "episode")
        
        do {
            try managedContext.save()
            print("Saved to Core Data")
            return note as? EpisodeNote
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        return nil
    }
    
    func getNotes() -> [EpisodeNote] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "EpisodeNote")
        do {
            let notes = try managedContext.fetch(fetchRequest)
            return notes as! [EpisodeNote]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
    
    func deleteNote(model: EpisodeNote) {
        managedContext.delete(model)
        
        do {
            try managedContext.save()
            print("Deleted to Core Data")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func updateNote(tvSeries: String, noteText: String, image: UIImage, episode: String, model: EpisodeNote) {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "EpisodeNote")
        
        model.tvSeries = tvSeries
        model.noteText = noteText
        model.episode = episode
        
        let data = image.jpegData(compressionQuality: 1)
        model.image = data
        
        do {
            let notes = try managedContext.fetch(fetchRequest)
            for i in notes {
                if i == model {
                    i.setValue(tvSeries, forKey: "tvSeries")
                    i.setValue(noteText, forKey: "noteText")
                    i.setValue(episode, forKey: "episode")
                }
            }
            try managedContext.save()
            print("Updated to Core Data")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
