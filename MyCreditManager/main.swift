//
//  main.swift
//  MyCreditManager
//
//  Created by SeoYeon Hong on 2022/11/17.
//

import Foundation

let menu = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
let invalid_menu = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
let exit = "프로그램을 종료합니다..."
var runMyCreditManager = true

while runMyCreditManager {
    print(menu)
    let input = readLine()!
    switch input {
    case "X": 
        print(exit)
        runMyCreditManager = false
    default:
        print(invalid_menu)
    }
}
