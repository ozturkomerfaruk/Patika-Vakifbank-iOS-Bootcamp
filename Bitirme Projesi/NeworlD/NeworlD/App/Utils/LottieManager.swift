//
//  LottieManager.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 15.12.2022.
//

import UIKit
import Lottie

enum LottieNames: String {
    case loading = "38701-loading"
    case gaming = "111634-3d-gaming"
    case cBot = "10178-c-bot"
    case gameBoy = "13689-gameboy-color"
    case gameBoyAdvance = "13690-gameboy-advance"
    case gameController = "45082-game-controller"
    case macintosh = "13356-macintosh"
    case games = "118264-teenager-playing-video-games"
    case favourites = "58790-favourite-animation"
    case notes = "9810-notes"
}

class LottieManager {
    
    static let shared = LottieManager()
    private var granted: Bool?
    
    private var animationView: LottieAnimationView!
    
    init(){}
    
    func playLottie(view: UIView, lottieName: String) {
        granted = true
        animationView = .init(name: lottieName)
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        view.addSubview(animationView)
        animationView.play()
    }
    
    func stopLottie() {
        animationView.stop()
    }
}
    
    
