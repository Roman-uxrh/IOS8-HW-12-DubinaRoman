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
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Are you ready?"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "GO!"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var startImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "play.fill"))
        image.tintColor = .black
        return image
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 75
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
        [textLabel, timerLabel, startImage, startButton, shapeView].forEach { view.addSubview($0) }
    }
    
    private func setupLayout() {
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.centerX.equalTo(view)
        }
        
        timerLabel.snp.makeConstraints { make in
            make.center.equalTo(shapeView.snp.center)
            make.centerX.equalTo(view)
        }
        
        startImage.snp.makeConstraints { make in
            make.top.equalTo(shapeView.snp.bottom).offset(40)
            make.centerX.equalTo(view)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(shapeView.snp.bottom).offset(40)
            make.centerX.equalTo(view)
            make.height.equalTo(100)
            make.width.equalTo(100)
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
            timerLabel.text = formatTime()
            timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
                self.jobTimer()
            }
            startImage.image = UIImage(systemName: "pause.fill")
            isStarted = true
        } else {
            timer.invalidate()
            startImage.image = UIImage(systemName: "play.fill")
            isStarted = false
        }
    }
    
    @objc private func jobTimer() {
        
        if isWorkTime {
            view.backgroundColor = .green
            duration -= 1
            timerLabel.text = formatTime()
            textLabel.text = "Never stop dansing!!"
        } else {
            view.backgroundColor = .red
            duration -= 1
            timerLabel.text = formatTime()
            textLabel.text = "Relax baby)"
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

