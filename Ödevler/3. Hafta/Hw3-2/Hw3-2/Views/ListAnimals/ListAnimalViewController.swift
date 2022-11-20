//
//  ListAnimalViewController.swift
//  Hw3-2
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import UIKit
import AVFoundation

class ListAnimalViewController: UIViewController {
    
    @IBOutlet weak var animalsTableView: UITableView!
    
    var mp3Player: AVAudioPlayer? = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalsTableView.register(UINib.init(nibName: "AnimalCustomCell", bundle: nil), forCellReuseIdentifier: "animalCustomCell")

        animalsTableView.delegate = self
        animalsTableView.dataSource = self
        
        print(ZooModel.allAnimalList.count)
    }
    
}

extension ListAnimalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = ZooModel.allAnimalList[indexPath.row].animalType!
        if type == "Cat" {
            let catPath = Bundle.main.path(forResource: "cat", ofType: "mp3")
            do {
                try self.mp3Player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: catPath!) as URL)
            } catch {
                print("Error")
            }
            mp3Player?.play()
            print("Cat")
        } else if type == "Dog" {
            let catPath = Bundle.main.path(forResource: "dog", ofType: "mp3")
            do {
                try self.mp3Player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: catPath!) as URL)
            } catch {
                print("Error")
            }
            mp3Player?.play()
            print("Dog")
        } else {
            let catPath = Bundle.main.path(forResource: "squirrel", ofType: "mp3")
            do {
                try self.mp3Player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: catPath!) as URL)
                
            } catch {
                print("Error")
            }
            mp3Player?.play()
            print("Squirrel")
        }
    }
}

extension ListAnimalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ZooModel.allAnimalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCustomCell", for: indexPath) as! AnimalCustomCell
        let all = ZooModel.allAnimalList
        cell.configure(name: all[indexPath.row].name!, type: all[indexPath.row].animalType!, zookeeper: all[indexPath.row].zookeeper!.name!)
        return cell
    }
}
