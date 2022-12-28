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
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
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
    }
    
    private func setupLayout() {
        labelTimer.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
    }
    
    // MARK: Actions
    
}

