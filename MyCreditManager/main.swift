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
let INPUT_NAME_TO_DELETE = "삭제할 학생의 이름을 입력해주세요"
let DELETE_NAME_SUCCESS = " 학생을 삭제하였습니다."
let DELETE_NAME_FAIL = " 학생을 찾지 못했습니다."
let INPUT_CREDIT = "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Micky Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."
let INPUT_CREDIT_TO_DELETE = "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Micky Swift"
let INVALID_NAME = " 학생을 찾지 못했습니다."
let INPUT_GET_CREDIT = "평점을 알고싶은 학생의 이름을 입력해주세요"
let EXIT = "프로그램을 종료합니다..."

var runMyCreditManager = true
var creditManager = [String:[String:String]]()
let grade: [String:Double] = ["A+":4.5, "A":4, "B+":3.5, "B":3, "C+":2.5, "C":2, "D":1.5, "D+":1, "F":0]

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
    case "2": //학생삭제
        print(INPUT_NAME_TO_DELETE)
        let name = readLine()!
        if creditManager[name] != nil {
            creditManager.removeValue(forKey: name)
            print(name + DELETE_NAME_SUCCESS)
        } else {
            print(name + DELETE_NAME_FAIL)
        }
    case "3": //성적추가
        print(INPUT_CREDIT)
        let credit = readLine()!
        let creditArr = credit.split(separator: " ").map{ String($0) }
        if creditArr.count == 3 {
            if creditManager[creditArr[0]] != nil, creditArr[1].isValidInput(), grade[creditArr[2]] != nil {
                creditManager[creditArr[0]]!.updateValue(creditArr[2], forKey: creditArr[1])
                print("\(creditArr[0]) 학생의 \(creditArr[1]) 과목이 \(creditArr[2])로 추가(변경)되었습니다.")
                break
            }
        }
        print(INVALID_INPUT)
    case "4": //성적삭제
        print(INPUT_CREDIT_TO_DELETE)
        let delete = readLine()!
        let deleteArr = delete.split(separator: " ").map{ String($0) }
        if deleteArr.count == 2 {
            if let credit = creditManager[deleteArr[0]] {
                if credit[deleteArr[1]] != nil {
                    creditManager[deleteArr[0]]!.removeValue(forKey: deleteArr[1])
                    print("\(deleteArr[0]) 학생의 \(deleteArr[1]) 과목의 성적이 삭제되었습니다.")
                    break
                }
            } else {
                print(deleteArr[0] + INVALID_NAME)
                break
            }
        }
        print(INVALID_INPUT)
    case "5": //평점보기
        print(INPUT_GET_CREDIT)
        let name = readLine()!
        if name.isValidInput() {
            if let credit = creditManager[name] {
                var total: Double = 0
                for (key, value) in credit {
                    print("\(key): \(value)")
                    total += grade[value]!
                }
                let average = total/Double(credit.count)
                print("평점 : \(floor(average*100)/100)")
                break
            } else {
                print(name + INVALID_NAME)
                break
            }
        }
        print(INVALID_INPUT)
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
