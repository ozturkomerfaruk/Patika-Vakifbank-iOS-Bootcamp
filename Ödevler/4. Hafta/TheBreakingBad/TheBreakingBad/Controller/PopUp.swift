//
//  PopUp.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 25.11.2022.
//

import UIKit

protocol popUpProtocol {
    func didTapped()
}

final class PopUp: UIView {
    
    var delegate: popUpProtocol?
    @IBOutlet weak var closeOutlet: UIButton!
    
    @IBOutlet weak var charTableView: UITableView!
    private var characters: [String]? {
        didSet {
            charTableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        configurePopUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configurePopUp()
    }
    
    private func configurePopUp() {
        charTableView.dataSource = self
        charTableView.delegate = self
        self.charTableView.register(UINib(nibName: "PopupCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "popupCustomCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleButtonPressed), name: NSNotification.Name("castEpisode"), object: nil)
    }
    
    @objc private func handleButtonPressed(_ notification: Notification) {
        var temp = ""
        if let cast = notification.object as? [String] {
            characters = cast
            for i in cast {
                temp += (i + "\n\n")
            }
        }
    }
    
    func xibSetup(frame: CGRect) {
        let view = loadXib()
        view.frame = frame
        addSubview(view)
    }
    
    private func loadXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PopUp", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }
    
}

extension PopUp: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "popupCustomCell", for: indexPath) as? PopupCustomTableViewCell,
              let _ = characters?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(name: characters?[indexPath.row] ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(characters?[indexPath.row])
    }
}
