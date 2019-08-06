//
//  AuthWorker.swift
//  BankApp
//
//  Created by Anderson Lentz on 03/08/19.
//  Copyright (c) 2019 Anderson Lentz. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

class AuthWorker
{
    
    func login(userID: String?, password: String?) -> (Bool,String)
    {
        
        let passValidation:(Bool,String) = validatePassword(password: password)
        let userValidation:(Bool,String) = validateUser(user: userID)
        
        if !passValidation.0{
            return passValidation
        }
        
        if !userValidation.0{
            return userValidation
        }
        
        return (true,"OK")

    }
    
    func validateUser(user:String?)->(Bool,String){
        
        if let userLogin = user{
            if userLogin.isCPF{
                return (true,"OK")
            }
            if isValidEmail(emailStr: userLogin){
                return (true,"OK")
            }
        }
        return(false,"E-mail ou CPF inválidos")
    }
    
    func isValidEmail(emailStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    
    func validatePassword(password: String?) -> (Bool,String) {
        
        if let password = password {
        
            let capitalLetterRegEx  = ".*[A-Z]+.*"
            let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
            guard texttest.evaluate(with: password) else {
                return (false,"Password deve conter pelo menos uma letra maiúscula")
                
            }
            
            let numberRegEx  = ".*[0-9]+.*"
            let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
            guard texttest1.evaluate(with: password) else {
                return (false,"Password deve conter pelo menos um número")
                
            }
            
            let specialCharacterRegEx  = ".*[!&^%$#@()/_*+-]+.*"
            let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
            guard texttest2.evaluate(with: password) else {
                return (false,"Password deve conter pelo menos um caracter especial")
                
            }
        }
        else{
            return (false,"Password is empty")
        }
        
        return (true,"OK")
    }
    
    func saveUserID(_ userID: Int?)
    {
        UserDefaults.standard.set(userID, forKey: "userID")
    }
    
    func getUserID() -> Int?
    {
        return UserDefaults.standard.integer(forKey: "userID")
    }
}

extension String {
    
    var isCPF: Bool {
        let cpf = self.onlyNumbers()
        guard cpf.count == 11 else { return false }
        
        let i1 = cpf.index(cpf.startIndex, offsetBy: 9)
        let i2 = cpf.index(cpf.startIndex, offsetBy: 10)
        let i3 = cpf.index(cpf.startIndex, offsetBy: 11)
        let d1 = Int(cpf[i1..<i2])
        let d2 = Int(cpf[i2..<i3])
        
        var temp1 = 0, temp2 = 0
        
        for i in 0...8 {
            let start = cpf.index(cpf.startIndex, offsetBy: i)
            let end = cpf.index(cpf.startIndex, offsetBy: i+1)
            let char = Int(cpf[start..<end])
            
            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }
        
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2
        
        return temp1 == d1 && temp2 == d2
    }
    
    func onlyNumbers() -> String {
        guard !isEmpty else { return "" }
        return replacingOccurrences(of: "\\D",
                                    with: "",
                                    options: .regularExpression,
                                    range: startIndex..<endIndex)
    }
    
}
