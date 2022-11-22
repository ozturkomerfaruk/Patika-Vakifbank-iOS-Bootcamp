//
//  SecondViewController.swift
//  TabBarDeneme
//
//  Created by Ömer Faruk Öztürk on 22.11.2022.
//

import UIKit

class SecondViewController: UIPageViewController {
    
    private lazy var orderedViewController: [UIViewController] = {
        [ self.pageViewController(page: "PageOne"),
          self.pageViewController(page: "PageTwo"),
          self.pageViewController(page: "PageThree") ]
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let vc = orderedViewController.first {
            setViewControllers([vc], direction: .forward, animated: true)
        }
    }
    
    private func pageViewController(page: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(page)ViewController")
    }
}


extension SecondViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = orderedViewController.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewController.count > previousIndex else {
            return nil
        }
        
        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = orderedViewController.firstIndex(of: viewController) else { return nil }
        
        let afterIndex = vcIndex + 1
        
        guard afterIndex != orderedViewController.count else {
            return nil
        }
        
        guard orderedViewController.count > afterIndex else {
            return nil
        }
        
        return orderedViewController[afterIndex]
    }
}
