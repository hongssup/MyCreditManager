//
//  main.swift
//  MyCreditManager
//
//  Created by SeoYeon Hong on 2022/11/17.
//

import Foundation

let INPUT_MENU = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
let INVALID_MENU = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
let INVALID_INPUT = "입력이 잘못되었습니다. 다시 확인해주세요."
let INPUT_NAME = "추가할 학생의 이름을 입력해주세요"
let ADD_NAME_SUCCESS = " 학생을 추가했습니다."
let ADD_NAME_FAIL = "은 이미 존재하는 학생입니다. 추가하지 않습니다."
let EXIT = "프로그램을 종료합니다..."

var runMyCreditManager = true
var creditManager = [String:[String:Double]]()

while runMyCreditManager {
    print(INPUT_MENU)
    let input = readLine()!
    switch input {
    case "1": //학생추가
        print(INPUT_NAME)
        let name = readLine()!
        if name.isValidInput() {
            if creditManager[name] == nil {
                creditManager[name] = [:]
                print(name + ADD_NAME_SUCCESS)
            } else {
                print(name + ADD_NAME_FAIL)
            }
        } else {
            print(INVALID_INPUT)
        }
    case "X":
        print(EXIT)
        runMyCreditManager = false
    default:
        print(INVALID_MENU)
    }
}

extension String {
    func isValidInput() -> Bool {
        for i in self {
            if !i.isLetter { return false }
        }
        return true
    }
}
