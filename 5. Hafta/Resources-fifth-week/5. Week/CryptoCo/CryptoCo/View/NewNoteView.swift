//
//  NewNoteView.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 26.11.2022.
//

import UIKit

protocol NewNoteViewDelegate: AnyObject {
    func savePressed(input: String)
}

final class NewNoteView: UIView {

    @IBOutlet private weak var noteTextView: UITextView!
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
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        delegate?.savePressed(input: noteTextView.text)
        removeFromSuperview()
    }

}
