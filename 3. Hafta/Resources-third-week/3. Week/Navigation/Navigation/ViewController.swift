//
//  ViewController.swift
//  Navigation
//
//  Created by Kaan YILDIRIM on 12.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pushWithIdPressed(_ sender: Any) {
        guard let pushWithIdVC = storyboard?.instantiateViewController(withIdentifier: "PushWithIdViewController") as? PushWithIdViewController else { return }
        pushWithIdVC.pushedData = "Pushed"
        self.navigationController?.pushViewController(pushWithIdVC, animated: true)
    }
    
    @IBAction func pushWithSeguePressed(_ sender: Any) {
        performSegue(withIdentifier: "pushWithSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushWithSegue" {
            guard let vc = segue.destination as? PushWithSegueViewController else { return }
            vc.pushedData = "Segue"
        }
    }
    
    @IBAction func presentButtonPressed(_ sender: Any) {
        guard let presentVC = storyboard?.instantiateViewController(withIdentifier: "PresentViewController") as? PresentViewController else { return }
        presentVC.presentData = "Presented"
        present(presentVC, animated: true)
    }
}

