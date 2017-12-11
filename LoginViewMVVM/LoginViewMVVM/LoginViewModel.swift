//
//  LoginViewModel.swift
//  LoginViewMVVM
//
//  Created by Rashi Karanpuria on 11/12/17.
//  Copyright © 2017 Rashi. All rights reserved.
//
import RxSwift
import Foundation
struct LoginViewModel {
    var email = Variable<String>("")
    var password = Variable<String>("")
    var isValid : Observable<Bool>{
        return Observable<Bool>.combineLatest(email.asObservable() , password.asObservable()){
                emailText, passwordText in
                return emailText.characters.count>3&&passwordText.characters.count>3
        }
    }
}

