//
//  SportCollectionViewCell.swift
//  AppViewCodeCurso
//
//  Created by Igor Fortti on 03/03/23.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: SportCollectionViewCell.self)
    
    lazy var screenCell: SportCollectionViewCellScreen = {
        let screen = SportCollectionViewCellScreen()
        screen.backgroundColor = .systemGray5
        screen.clipsToBounds = true
        screen.layer.cornerRadius = 20
        return screen
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupScreenCellContraint()
    }
    
    private func addViews() {
        contentView.addSubview(screenCell)
    }
    
    public func setupCell(data: SportModel) {
        screenCell.sportNameLabel.text = data.sportName
        screenCell.sportImageView.image = data.sportImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScreenCellContraint() {
        screenCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
