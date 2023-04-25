//
//  SportCollectionViewCellScreen.swift
//  AppViewCodeCurso
//
//  Created by Igor Fortti on 03/03/23.
//

import UIKit

class SportCollectionViewCellScreen: UIView {
    
    lazy var sportNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var sportImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupSportNameLabelConstraint()
        setupSportImageViewConstraint()
    }
    
    private func addViews() {
        addSubview(sportNameLabel)
        addSubview(sportImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSportNameLabelConstraint() {
        sportNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.bottom.equalTo(snp.bottom).inset(2)
            make.height.equalTo(20)
        }
    }
    
    private func setupSportImageViewConstraint() {
        sportImageView.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(snp.top).offset(5).inset(5)
            make.bottom.equalTo(sportNameLabel.snp.top)
        }
    }
}
