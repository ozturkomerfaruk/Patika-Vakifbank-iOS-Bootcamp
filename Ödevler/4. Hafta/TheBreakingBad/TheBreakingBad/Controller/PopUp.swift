//
//  PopUp.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 25.11.2022.
//

import UIKit

//MARK: For Delegate popUp
protocol popUpProtocol {
    func didTapped()
}

final class PopUp: UIView {
    
    var delegate: popUpProtocol?
    @IBOutlet weak var closeOutlet: UIButton!
    
    @IBOutlet private weak var charTableView: UITableView!
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
    
    //MARK: Configure Popup
    private func configurePopUp() {
        charTableView.dataSource = self
        charTableView.delegate = self
        //self custom cell
        self.charTableView.register(UINib(nibName: "PopupCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "popupCustomCell")
        
        //MARK: NotificationCenter for Character
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
    
    //MARK: XibSetup
    private func xibSetup(frame: CGRect) {
        let view = loadXib()
        view.frame = frame
        addSubview(view)
    }
    
    //MARK: XibNib
    private func loadXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PopUp", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }
    
}

//MARK: popup Character TableView DataSource & Delegate
extension PopUp: UITableViewDataSource, UITableViewDelegate {
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters?.count ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "popupCustomCell", for: indexPath) as? PopupCustomTableViewCell,
              let _ = characters?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(name: characters?[indexPath.row] ?? "")
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    //I want to go to DetailControllerView but i can't because there is no navigationcontroller. There is a just UIView!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str = characters?[indexPath.row] ?? ""
        let newStr = str.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        print(newStr)
    }
}
