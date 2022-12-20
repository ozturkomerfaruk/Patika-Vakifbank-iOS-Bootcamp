//
//  OnboardingViewModel.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 16.12.2022.
//

import Foundation

protocol OnboardingViewModelProtocol {
    
    func appendSlide(model: OnboardingModel)
    func countSlide() -> Int
    func getSlideModel(at index: Int) -> OnboardingModel
}

final class OnboardingViewModel: OnboardingViewModelProtocol {
        
    private var slides: [OnboardingModel] = []
    
    func appendSlide(model: OnboardingModel) {
        slides.append(model)
    }
    
    func countSlide() -> Int {
        return slides.count
    }
    
    func getSlideModel(at index: Int) -> OnboardingModel {
        return slides[index]
    }
}
