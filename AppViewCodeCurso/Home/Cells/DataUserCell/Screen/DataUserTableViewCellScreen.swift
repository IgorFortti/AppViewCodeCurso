//
//  HomeTableViewCellScreen.swift
//  AppViewCodeCurso
//
//  Created by Igor Fortti on 03/03/23.
//

import UIKit

class DataUserTableViewCellScreen: UIView {
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupUserImageViewConstraint()
        setupUserNameLabelConstraint()
    }
    
    private func addViews() {
        addSubview(userImageView)
        addSubview(userNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserImageViewConstraint() {
        userImageView.snp.makeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
    }
    
    private func setupUserNameLabelConstraint() {
        userNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(userImageView.snp.trailing).offset(20)
        }
    }
}
