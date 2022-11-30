//
//  NewNoteView.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 30.11.2022.
//

import UIKit

//AnyObject kullanılmasının sebebinde delegate'i tanımlarken weak olarak tanımlayabilmemiz için. Weak referans typler için kullanılıyor. AnyObject bunu sağlıyor.
protocol NewNoteViewDelegate: AnyObject {
    func savePressed(input: String)
}

final class NewNoteView: UIView {

    @IBOutlet weak var textView: UITextView!
    
    weak var delegate: NewNoteViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let nib = UINib(nibName: "NewNoteView", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            addSubview(view)
            view.frame = self.bounds
        }
    }
    
  
    @IBAction func buttonAction(_ sender: UIButton) {
        delegate?.savePressed(input: textView.text)
        print("Save Pressed")
        removeFromSuperview()
    }
    
}
