//
//  ViewController.swift
//  AppViewCodeCurso
//
//  Created by Igor Fortti on 02/03/23.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    var screen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.textFieldDelegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
    }
}

extension LoginVC: LoginScreenProtocol {
    
    func loginButtonTapped() {
        let homeVC = HomeVC()
        navigationController?.pushViewController(homeVC, animated: true)
//        guard let screen = screen else { return }
//        auth?.signIn(withEmail: screen.getEmail(), password: screen.getPassword(), completion: { (usuario, error) in
//            if error != nil {
//                self.alert?.getAlert(title: "Atenção", message: "Não foi possivel concluir o cadastro")
//            } else {
//                if usuario == nil {
//                    self.alert?.getAlert(title: "Atenção", message: "Usuário não cadastrado")
//                }  else {
//                    let homeVC = HomeVC()
//                    self.navigationController?.pushViewController(homeVC, animated: true)
//                }
//            }
//        })
    }
    
    func registerButtonTapped() {
        let registerVC = RegisterVC()
        navigationController?.pushViewController(registerVC, animated: true)
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

