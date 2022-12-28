//
//  ViewController.swift
//  IOS8-HW-12-DubinaRoman
//
//  Created by admin on 28.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private lazy var labelTimer: UILabel = {
        let label = UILabel()
        label.text = "1"
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
        return button
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
    }
    
    private func setupLayout() {
        
        labelTimer.snp.makeConstraints { make in
            make.centerY.equalTo(view).offset(-170)
            make.centerX.equalTo(view)
        }
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(labelTimer.snp.bottom).offset(60)
            make.centerX.equalTo(view)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
    
    // MARK: Actions
    
}

