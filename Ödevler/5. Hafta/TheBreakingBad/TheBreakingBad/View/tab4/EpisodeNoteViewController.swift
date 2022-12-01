//
//  EpisodeNoteViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 1.12.2022.
//

import UIKit

final class EpisodeNoteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFloatingButton()
    }
    
    private func configureFloatingButton() {
        let floatingButton = UIButton()
        floatingButton.setTitle("+", for: .normal)
        floatingButton.backgroundColor = .systemBlue
        floatingButton.titleLabel?.font = UIFont(name: "Helvetica", size: 40)
        
        floatingButton.layer.cornerRadius = 35
        view.addSubview(floatingButton)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        
        floatingButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        floatingButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        floatingButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true

        floatingButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        
        floatingButton.addTarget(self, action: #selector(floatingPressed), for: .touchUpInside)
    }
    
    @objc func floatingPressed() {
        print("Pressed")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "newNoteVC") as? NewEpisodeNoteViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
