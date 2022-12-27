//
//  ListAnimalViewController.swift
//  Hw3-2
//
//    
//

import UIKit
import AVFoundation

final class ListAnimalViewController: UIViewController {
    
    @IBOutlet private weak var animalsTableView: UITableView!
    
    private var mp3Player: AVAudioPlayer? = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalsTableView.register(UINib.init(nibName: "AnimalCustomCell", bundle: nil), forCellReuseIdentifier: "animalCustomCell")

        animalsTableView.delegate = self
        animalsTableView.dataSource = self
        
        print(ZooModel.shared.allAnimalList.count)
    }
    
    private func playSound(fileName: String) {
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

extension ListAnimalViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = ZooModel.shared.allAnimalList[indexPath.row].animalType!
        playSound(fileName: type.lowercased())
    }
}

extension ListAnimalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ZooModel.shared.allAnimalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCustomCell", for: indexPath) as! AnimalCustomCell
        let all = ZooModel.shared.allAnimalList
        let model = all[indexPath.row]
        cell.configure(name: model.name!, type: model.animalType!, zookeeper: model.zookeeper!.name!)
        return cell
    }
}
