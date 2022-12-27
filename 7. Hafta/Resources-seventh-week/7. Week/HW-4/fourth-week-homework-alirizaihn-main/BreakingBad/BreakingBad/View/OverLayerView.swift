//
//  OverLayerView.swift
//  BreakingBad
//
//  Created by Ali Rıza İLHAN on 26.11.2022.
//

import UIKit

protocol CloseViewDelegate: AnyObject {
    func closeButtonPressed()
}
final class OverLayerView: UIView {

    @IBOutlet private weak var charactesTableView: UITableView! {
        didSet {
            charactesTableView.dataSource = self
            charactesTableView.delegate = self
        }
    }
    
    weak var delegate: CloseViewDelegate?
    var characters: [String]? {
        didSet {
            charactesTableView.reloadData()
        }
    }
    
    @IBOutlet weak var popUpView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let nib = UINib(nibName: "OverLayerView", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            addSubview(view)
            view.frame = self.bounds
        }
        popUpView.layer.cornerRadius = 25
    }
    
    @IBAction func closePressed(_ sender: Any) {
        removeFromSuperview()
        delegate?.closeButtonPressed()
    }
   
}
extension OverLayerView : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = characters?[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    
}
