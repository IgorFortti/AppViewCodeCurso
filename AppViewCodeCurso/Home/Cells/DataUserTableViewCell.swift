//
//  HomeTableViewCell.swift
//  AppViewCodeCurso
//
//  Created by Igor Fortti on 03/03/23.
//

import UIKit

class DataUserTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: DataUserTableViewCell.self)
    
    lazy var screenCell: DataUserTableViewCellScreen = {
        let screen = DataUserTableViewCellScreen()
        return screen
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupScreenCellConstraint()
    }
    
    public func setupCell(data: DataUserModel) {
        screenCell.userNameLabel.text = data.userName
        screenCell.userImageView.image = data.userImage
    }
    
    private func addViews() {
        contentView.addSubview(screenCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScreenCellConstraint() {
        screenCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
