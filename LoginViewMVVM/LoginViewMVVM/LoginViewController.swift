//
//  ViewController.swift
//  LoginViewMVVM
//
//  Created by Rashi Karanpuria on 11/12/17.
//  Copyright © 2017 Rashi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class LoginViewController: UIViewController {
    
    @IBOutlet weak var enableLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    var disposeBag = DisposeBag()
    var loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emailField.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.email).disposed(by: disposeBag)
        passwordField.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.password).disposed(by: disposeBag)
        
        loginViewModel.isValid.bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        
        loginViewModel.isValid.subscribe(onNext : {[weak self] isValid in
            self?.enableLabel.text = isValid ? "Button ENabled" : "Not enabled"
            }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

