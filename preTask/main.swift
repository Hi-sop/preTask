//
//  main.swift
//  ios-career-9
//
//  Created by kjs on 2023/03/22.
//

import Foundation

func step1() {
    var userList: [UserInfo] = []
    inputUserInfo(userList: &userList)
}

func userMenu() {
    var userList: [UserInfo] = []
    while true {
        print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
        print("메뉴를 선택해주세요 : ", terminator: "")
        guard let selectNumber = readLine() else {
            return
        }
        switch selectNumber {
        case "1":
            inputUserInfo(userList: &userList)
        case "2":
            viewUserInfo(userList: userList)
        case "3":
            searchUserInfo(userList: userList)
        case "x":
            print("\n[프로그램 종료]")
            return
        default:
            print("선택이 잘못되었습니다. 확인 후 다시 입력해주세요.")
        }
        print("")
    }
}

userMenu()
