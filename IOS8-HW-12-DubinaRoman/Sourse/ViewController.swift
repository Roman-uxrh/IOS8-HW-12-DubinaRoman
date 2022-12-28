//
//  ViewController.swift
//  IOS8-HW-12-DubinaRoman
//
//  Created by admin on 28.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    var duration = 30
    
    var bool = false
    
    var bool2 = false
    
    // MARK: - UI Elements
    
    private lazy var labelTimer: UILabel = {
        let label = UILabel()
        label.text = "GO!"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        return button
    }()
    
    private lazy var shapeView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "elipse")
        return imageView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupView() {
       view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(labelTimer)
        view.addSubview(startButton)
        view.addSubview(shapeView)
    }
    
    private func setupLayout() {
        
        labelTimer.snp.makeConstraints { make in
            make.center.equalTo(shapeView.snp.center)
            make.centerX.equalTo(view)
        }
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(labelTimer.snp.bottom).offset(30)
            make.centerX.equalTo(view)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        shapeView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
    }
    
    // MARK: Actions
    
    @objc private func startTimer() {
        
        if bool == false {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.jobTimer()
            }
            startButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            timer.invalidate()
            startButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            bool = false
        }
    }
    
    @objc private func jobTimer() {
        if bool2 == false {
            view.backgroundColor = .green
            duration -= 1
            labelTimer.text = "\(duration)"
            bool = true
        } else {
            view.backgroundColor = .red
            duration -= 1
            labelTimer.text = "\(duration)"
            bool = true
            if duration == 0 {
                duration = 30
                bool2 = false
            }
        }
            
        if duration == 0 {
            duration = 5
            bool2 = true
        }
    }
}

