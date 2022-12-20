//
//  OnboardingCustomCell.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 16.12.2022.
//

import UIKit

final class OnboardingCustomCell: UICollectionViewCell {
    
    @IBOutlet private weak var lottieView: UIView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblDescription: UILabel!
    
    func configureCustomCell(_ model: OnboardingModel){
        lottieView = onboardingLottieView(name: model.lottieViewStr)
        lblTitle.text = model.title
        lblDescription.text = model.description
        
        func onboardingLottieView(name: String) -> UIView? {
            if lottieView != nil {
                LottieManager.shared.playLottie(view: lottieView, lottieName: name)
                return lottieView
            }
            return nil
        }
    }
    
    override func prepareForReuse() {
        lottieView = nil
    }
}
