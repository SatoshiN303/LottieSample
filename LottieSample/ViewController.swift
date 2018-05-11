//
//  ViewController.swift
//  LottieSample
//
//  Created by 佐藤 慎 on 2018/03/23.
//  Copyright © 2018年 i-studio development team. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    var loadingAnimation: LOTAnimationView = LOTAnimationView(name: "loading")
    var particle: LOTAnimationView = LOTAnimationView(name: "particle")

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingAnimation.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        loadingAnimation.loopAnimation = true
        particle.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        particle.isHidden = true
        particle.loopAnimation = false
        
        view.addSubview(loadingAnimation)
        view.addSubview(particle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadingAnimation.center = view.center
        particle.center = view.center
        
        loadingAnimation.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) { [weak self] in
            self?.loadingAnimation.stop()
            self?.loadingAnimation.isHidden = true
            self?.particle.isHidden = false
            self?.particle.play()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

