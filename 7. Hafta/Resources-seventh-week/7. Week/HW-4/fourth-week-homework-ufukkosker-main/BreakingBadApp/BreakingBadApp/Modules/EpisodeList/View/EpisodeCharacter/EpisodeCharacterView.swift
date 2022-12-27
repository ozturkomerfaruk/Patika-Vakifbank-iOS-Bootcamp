//
//  EpisodeCharacterView.swift
//  BreakingBadApp
//
//  Created by Ufuk on 26.11.2022.
//

import UIKit

protocol EpisodeCharacterViewDelegate: AnyObject {
    func close()
}

class EpisodeCharacterView: UIView {

    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var containerView: UIView!
    
    private var characters: [String] = []
    static let shared = EpisodeCharacterView()
    weak var delegate: EpisodeCharacterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frrame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func xibSetup(frrame: CGRect) {
        let view = loadXib()
        view.frame = frame
        containerView.layer.cornerRadius = 6
        addSubview(view)
    }
    
    func loadXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: EpisodeCharacterView.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            return view
        } else {
            return UIView()
        }
    }
    
    func config(with characters: [String]) {
        characters.forEach { character in
            let label = UILabel()
            label.text = character
                stackView.addArrangedSubview(label)
        }
    }
    @IBAction func didCloseButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.25) { () -> Void in
            self.alpha = 0.0
            UIApplication.topViewController()?.view.subviews.last?.removeFromSuperview()
        }

        delegate?.close()
    }
}
