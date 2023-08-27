//
//  ViewWithSearch.swift
//  ios-career-9
//
//  Created by Hisop on 2023/07/29.
//

import Foundation

func sortUserList(userList: [UserInfo]) -> [UserInfo] {
    return userList.sorted{
        if $0.name != $1.name {
            return $0.name < $1.name
        }
        else {
            return $0.age < $1.age
        }
    }
}

func viewUserInfo(userList: [UserInfo]) {
    let sortedUserList = sortUserList(userList: userList)
    
    for list in sortedUserList {
        print("- \(list.name) / \(list.age) / \(list.contact)")
    }
}

func searchUserInfo(userList: [UserInfo]) {
    print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
    guard let findName = readLine() else {
        return
    }
    
    let searchResults = userList.filter { $0.name == findName }
    if searchResults.isEmpty {
        print("연락처에 \(findName)이(가) 없습니다.")
        return
    }
    
    let sortedUserList = sortUserList(userList: searchResults)
    for list in sortedUserList {
        print("- \(list.name) / \(list.age) / \(list.contact)")
    }
}
