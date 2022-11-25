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
    @IBOutlet private weak var chars: UILabel!
    @IBOutlet weak var closeOutlet: UIButton!
    

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
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleButtonPressed), name: NSNotification.Name("castEpisode"), object: nil)
    }
    
    @objc private func handleButtonPressed(_ notification: Notification) {
        var temp = ""
            if let texts = notification.object as? [String] {
                for i in texts {
                    temp += (i + "\n\n")
                }
            }
        chars.text = temp
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
