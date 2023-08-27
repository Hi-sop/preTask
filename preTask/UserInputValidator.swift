//
//  Step1.swift
//  ios-career-9
//
//  Created by Hisop on 2023/07/28.
//

import Foundation

struct UserInfo {
    let name: String
    let age: Int
    let contact: String
    
    init(name: String, age: Int, contact: String) {
        self.name = name
        self.age = age
        self.contact = contact
    }
}

func prepareInfo(userInfo: String?) -> [String] {
    guard let unwrappedUserInfo = userInfo else {
        return []
    }
    
    let spaceRemoved = unwrappedUserInfo.split(separator: " ").joined()
    let splitSlash = spaceRemoved.split(separator: "/").map { String($0) }
    
    return splitSlash
}
    
func validateInfo(userInfo: [String]) -> (Bool, UserInfo?) {
    if userInfo.count != 3 {
        if userInfo.isEmpty {
            print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
        }
        else {
            print("올바른 입력 형태가 아닙니다. 입력 형식을 확인해주세요.")
        }
        return (false, nil)
    }
    
    let name = userInfo[0]
    guard let age = Int(userInfo[1]) else {
        print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return (false, nil)
    }
    if 999 < age {
        print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return (false, nil)
    }
    
    let contact = userInfo[2]
    if contact.filter({ $0 == "-" }).count != 2 {
        print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return (false, nil)
    }
    if contact.filter({ $0 != "-" }).count < 9 {
        print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return (false, nil)
    }
    guard let _ = Int(contact.filter({ $0 != "-" })) else {
        print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return (false, nil)
    }
    
    print("입력한 정보는 \(age)세 \(name)(\(contact))입니다.")
    let newUserInfo = UserInfo(name: name, age: age, contact: contact)
    
    return (true, newUserInfo)
}

func inputUserInfo(userList: inout [UserInfo]) {
    print("연락처 정보를 입력해주세요 : ", terminator: "")
    let tempInfo = readLine()
    
    let prepareInfo = prepareInfo(userInfo: tempInfo)
    let (verify, validatedInfo) = validateInfo(userInfo: prepareInfo)
    
    if verify {
        if let unwrapValidatedInfo = validatedInfo {
            userList.append(unwrapValidatedInfo)
        }
    }
}
