//
//  AddPageViewController.swift
//  Hw3-2
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import UIKit

class AddPageViewController: UIViewController {
    
    @IBOutlet weak var zookeeperNameTF: UITextField!
    @IBOutlet weak var saveZookeeperOutlet: UIButton!
    
    
    @IBOutlet weak var selectAnimalTypeOutlet: UIButton!
    @IBOutlet var animalsCollection: [UIButton]!
    
    @IBOutlet weak var animalNameTF: UITextField!
    @IBOutlet weak var addAnimalView: UIStackView!
    
    @IBOutlet weak var saveAnimalOutlet: UIButton!
    
    @IBOutlet weak var selectZookeeperOutlet: UIButton!
    
    @IBOutlet weak var zookeeperTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveAnimalOutlet.layer.cornerRadius = saveAnimalOutlet.frame.height / 2
        saveZookeeperOutlet.layer.cornerRadius = saveZookeeperOutlet.frame.height / 2
        selectAnimalTypeOutlet.layer.cornerRadius = selectAnimalTypeOutlet.frame.height / 2
        selectZookeeperOutlet.layer.cornerRadius = selectZookeeperOutlet.frame.height / 2
        
        animalsCollection.forEach {
            btn in
            btn.layer.cornerRadius = btn.frame.height / 2
            btn.isHidden = true
            btn.alpha = 0
        }
        
        UIView.animate(withDuration: 0.5) {
            self.zookeeperTableView.center = self.view.center
            self.zookeeperTableView.isHidden = true
        }
        
        zookeeperTableView.dataSource = self
        zookeeperTableView.delegate = self
        print("Zookeeper Count: \(ZooModel.allZookeeperList.count)")
    }
    
    //Animasyon bucalamaları. Görmezden gelin :D Şansımı deniyorum mantığını kavramaya çalışıyorum
    @IBAction func selectZookeeper(_ sender: UIButton) {
        if ZooModel.allZookeeperList.isEmpty {
            alertWarning(title: "Warning", message: "Eat less, find yourself a butler")
        } else {
            UIView.animate(withDuration: 0.8) {
                self.zookeeperTableView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
                self.zookeeperTableView.center = self.view.center
                self.zookeeperTableView.isHidden = !self.zookeeperTableView.isHidden
            }
        }
    }
    
    @IBAction func selectAnimalType(_ sender: UIButton) {
        animalsCollection.forEach {
            btn in
            UIView.animate(withDuration: 0.8) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 : 0
                btn.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func animalCollection(_ sender: UIButton) {
        if let btn = sender.titleLabel?.text {
            selectAnimalTypeOutlet.setTitle(btn, for: .normal)
            animalsCollection.forEach {
                btn in
                UIView.animate(withDuration: 0.8) {
                    btn.isHidden = true
                    btn.alpha = 0
                }
            }
        }
    }
    
    
    @IBAction func saveZookeper(_ sender: Any) {
        
        let str = """
        Zookeeper's Name: \(zookeeperNameTF.text!)
        """
        
        if zookeeperNameTF.text!.isEmpty || zookeeperNameTF.text!.isNumber {
            alertWarning(title: "Warning", message: "Check Name!")
        }
        
        let newZookeeper = ZookeeperModel(name: zookeeperNameTF.text!)
        
        // create the alert
        let alert = UIAlertController(title: "About Zookeeper", message: str, preferredStyle: .alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Save", style: UIAlertAction.Style.default) {
            UIAlertAction in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "aboutZooVC") as? AboutZooViewController else { return }
            ZooModel.allZookeeperList.append(newZookeeper)
            self.zookeeperTableView.reloadData()
            self.navigationController?.pushViewController(vc, animated: true)
        })
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveAnimal(_ sender: Any) {
        
        if animalNameTF.text!.isEmpty || animalNameTF.text!.isNumber {
            alertWarning(title: "Warning", message: "Name is Missing.")
        }
        if selectAnimalTypeOutlet.titleLabel!.text! == "Select Animal Type" {
            alertWarning(title: "Warning", message: "Please select a animal type")
        }
        if selectZookeeperOutlet.titleLabel!.text! == "Select Zookeeper" {
            alertWarning(title: "Warning", message: "Please select a zookeper")
        }
        
        let str = """
        Animal's Name: \(animalNameTF.text!)
        Animal Type: \(selectAnimalTypeOutlet.titleLabel!.text!)
        Zookeeper: \(selectZookeeperOutlet.titleLabel!.text!)
        """
        
        let newAnimal = AnimalModel()
        
        for val in ZooModel.allZookeeperList {
            if val.name == selectZookeeperOutlet.titleLabel!.text! {
                newAnimal.name = animalNameTF.text!
                newAnimal.zookeeper = val
                val.animalList.append(newAnimal)
                newAnimal.animalType = selectAnimalTypeOutlet.titleLabel!.text!
            }
        }
        
        // create the alert
        let alert = UIAlertController(title: "About Animal", message: str, preferredStyle: .alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Save", style: UIAlertAction.Style.default) {
            UIAlertAction in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "aboutZooVC") as? AboutZooViewController else { return }
            ZooModel.waterLimit! -= newAnimal.waterConsumption
            ZooModel.allAnimalList.append(newAnimal)
            self.navigationController?.pushViewController(vc, animated: true)
        })
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertWarning(title: String, message: String) {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

extension AddPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = ZooModel.allZookeeperList[indexPath.row].name
        selectZookeeperOutlet.setTitle(name, for: .normal)
        UIView.animate(withDuration: 0.8) {
            self.zookeeperTableView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            self.zookeeperTableView.isHidden = !self.zookeeperTableView.isHidden
        }
        
    }
}

extension AddPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ZooModel.allZookeeperList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zookeeperCell", for: indexPath)
        cell.textLabel?.text = ZooModel.allZookeeperList[indexPath.row].name
        return cell
    }
}

extension String {
    var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}
