//
//  LaunchScreenVC.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 15.12.2022.
//

import UIKit

class LaunchScreenVC: BaseVC {
    
    @IBOutlet private weak var lottieView: UIView!
    @IBOutlet private weak var appNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLaunchScreen()
    }
    
    private func configureLaunchScreen() {
        LottieManager.shared.playLottie(view: lottieView, lottieName: LottieNames.gameController.rawValue)
        lottieView.backgroundColor = .black
        
        appNameLabel.alpha = 0
        
        UIView.animate(withDuration: 3) { [weak self] in
            guard let self = self else { return }
            self.appNameLabel.alpha = 1
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !LaunchOnboardingManager.shared.isNewUser() {
            DispatchQueue.main.asyncAfter(deadline: .now()+2) { [weak self] in
                guard let self = self else { return }
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController") as? UITabBarController else { return }
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now()+2) { [weak self] in
                guard let self = self else { return }
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "onboardingVC") as? UIViewController else { return }
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        LottieManager.shared.stopLottie()
    }
}
