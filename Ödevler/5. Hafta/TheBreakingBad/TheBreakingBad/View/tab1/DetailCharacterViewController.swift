//
//  DetailCharacterViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import UIKit

final class DetailCharacterViewController: BaseViewController {
    var selectedModel: CharacterModel?
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var potrayedLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nickNameLabel: UILabel!
    @IBOutlet private weak var occupationTableView: UITableView!
    @IBOutlet private weak var quoteOutlet: UIButton!
    @IBOutlet private weak var seasonLabel: UILabel!
    private var occupation: [String]? {
        didSet {
            occupationTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteOutlet.layer.cornerRadius = quoteOutlet.frame.height / 2
        indicator.startAnimating()
        configureDetail()
        occupationTableView.dataSource = self
        quoteOutlet.setTitle("\(selectedModel?.name ?? "Author")'s Quotes", for: .normal)
    }
    
    //MARK: Detail Info Part
    private func configureDetail() {
        imageView.loadFrom(URLAddress: selectedModel?.img ?? "")
        indicator.stopAnimating()
        potrayedLabel.text = "Potrayed: " + (selectedModel?.portrayed ?? "")
        nameLabel.text = "Name: " + (selectedModel?.name ?? "")
        nickNameLabel.text = "Nickname: " + (selectedModel?.nickname ?? "")
        var temp = "Appearance: "
        for (x,y) in selectedModel!.appearance.enumerated() {
            if x == 0 {
                temp += "\(y)"
            } else {
                temp += ", \(y)"
            }
        }
        seasonLabel.text = temp
        occupation = selectedModel?.occupation ?? []
        
    }
    
    //Quote Page Action
    @IBAction private func QuoteAction(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "quoteByAuthorVC") as? QuoteByAuthorViewController,
        let name = selectedModel?.name else { return }
        detailVC.authorName = name
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: Image From URL
extension UIImageView {
    fileprivate func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                    self?.image = loadedImage
                }
            }
        }
    }
}

//MARK: Detail Occupation
extension DetailCharacterViewController: UITableViewDataSource {
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return occupation?.count ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "occupationCell", for: indexPath)
        cell.textLabel?.text = occupation?[indexPath.row]
        return cell
    }
    
    
}
