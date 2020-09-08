//
//  Model.swift
//  JhMemo
//
//  Created by jh on 2020/09/08.
//  Copyright © 2020 jh. All rights reserved.
//

import Foundation

class Memo {
    var content: String //메모
    var insertDate: Date //날짜
    
    //클래스니까 속성 초기화 필수!
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    
    //범위를 배열에 미리 저장?(임시)
    static var dummyMemoList = [
        Memo(content: "ㅎㅎ"),
        Memo(content: "메모 테스트")
    ]
}
