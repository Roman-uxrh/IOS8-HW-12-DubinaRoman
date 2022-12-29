//
//  ViewController.swift
//  IOS8-HW-12-DubinaRoman
//
//  Created by admin on 28.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Elements to timer
    
    private var timer = Timer()
    private var duration = 30
    
    private var isWorkTime = true
    private var isStarted = false
    
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
    
    func formatTime() -> String {
        let time = Double(duration)
        let format = DateComponentsFormatter()
        format.zeroFormattingBehavior = .pad
        format.allowedUnits = [.minute, .second]
        return format.string(from: time ) ?? "00:00"
    }
    
    @objc private func startTimer() {
        
        if !isStarted {
            labelTimer.text = formatTime()
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.jobTimer()
            }
            startButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            isStarted = true
        } else {
            timer.invalidate()
            startButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            isStarted = false
        }
    }
    
    @objc private func jobTimer() {
        
        if isWorkTime {
            view.backgroundColor = .green
            duration -= 1
            labelTimer.text = formatTime()
        } else {
            view.backgroundColor = .red
            duration -= 1
            labelTimer.text = formatTime()
            if duration == 0 {
                duration = 30
                isWorkTime = true
            }
        }
            
        if duration == 0 {
            duration = 5
            isWorkTime = false
        }
    }
}

