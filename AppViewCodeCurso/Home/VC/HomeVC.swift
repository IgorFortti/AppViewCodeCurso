//
//  HomeVC.swift
//  AppViewCodeCurso
//
//  Created by Igor Fortti on 03/03/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeVCScreen?
    
    var userList: [DataUserModel] = [DataUserModel(userName: "Igor", userImage: UIImage(named: "menino1") ?? UIImage()),
                                     DataUserModel(userName: "Fortti", userImage: UIImage(named: "menino2") ?? UIImage()),
                                     DataUserModel(userName: "Mis", userImage: UIImage(named: "menina1") ?? UIImage())]
    
    var sportList:[SportModel] =  [SportModel(sportName: "corrida", sportImage: UIImage(named: "corrida") ?? UIImage()),
                                   SportModel(sportName: "ciclismo", sportImage: UIImage(named: "ciclismo") ?? UIImage()),
                                   SportModel(sportName: "yoga", sportImage: UIImage(named: "yoga") ?? UIImage())]
    
    override func loadView() {
        homeScreen = HomeVCScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configTableViewProtocol(delegate: self, dataSource: self)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            cell?.setupCell(data: sportList)
            return cell ?? UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: DataUserTableViewCell.identifier, for: indexPath) as? DataUserTableViewCell
        cell?.setupCell(data: userList[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
