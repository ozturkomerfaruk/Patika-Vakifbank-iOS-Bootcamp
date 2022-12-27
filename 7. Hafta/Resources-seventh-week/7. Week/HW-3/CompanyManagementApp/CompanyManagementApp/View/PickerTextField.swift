//
//  PickerTextField.swift
//  CompanyManagementApp
//
//  Created by Kaan YILDIRIM on 10.12.2022.
//

import UIKit

final class PickerTextField: UITextField {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        false
    }

    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        []
    }

    override func caretRect(for position: UITextPosition) -> CGRect {
        .null
    }
}
