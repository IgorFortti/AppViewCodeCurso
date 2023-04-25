//
//  RegisterVC.swift
//  AppViewCodeCurso
//
//  Created by Igor Fortti on 02/03/23.
//

import UIKit
import FirebaseAuth
import SwiftUI

class RegisterVC: UIViewController {
    
    private var screen: RegisterScreen?
    private var auth: Auth?
    private var alert: Alert?
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.textFieldDelegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
    }
}

extension RegisterVC: RegisterScreenProtocol {
    func registerButtonTapped() {
        guard let screen = screen else { return }
        auth?.createUser(withEmail: screen.getEmail(), password: screen.getPassword(), completion: { (result, error) in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Tente novamente mais tarde", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            } else {
                self.alert?.getAlert(title: "Cadastro concluído", message: "Por gentilza, realize o Login", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
    }
    
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
