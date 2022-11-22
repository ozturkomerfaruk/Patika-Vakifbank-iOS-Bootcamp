//
//  XibView.swift
//  XibDeneme
//
//  Created by Ömer Faruk Öztürk on 22.11.2022.
//

import UIKit


class XibView: UIView {
    
    @IBOutlet weak var outletButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "XibView") else { return }
        self.backgroundColor = .clear
        self.addSubview(view)
        view.frame = self.bounds
    }
    
     
    @IBAction func changeColor(_ sender: Any) {
        let color: [UIColor] = [.black, .blue, .brown, .cyan, .darkGray, .darkText, .green, .magenta, .orange, .purple, .red, .systemPink]
        let randomColorIndex = arc4random() % 12
        //MARK: view neden değişmiyor arka tarafta anlamadım
        outletButton.backgroundColor = color[Int(randomColorIndex)]
        print(Int(randomColorIndex))
    }
    
}

extension UIView {
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle.init(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
