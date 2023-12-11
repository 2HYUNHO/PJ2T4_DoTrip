//
//  GetAPIKey.swift
//  Dotrip
//
//  Created by Hee on 12/10/23.
//

import Foundation

func GetAPIKey(_ plistFilename: String, _ key: String) -> String? {
    // 생성한 .plist 파일 경로 불러오기
    guard let filePath = Bundle.main.path(forResource: plistFilename, ofType: "plist") else {
        fatalError("Couldn't find file '\(plistFilename).plist'")
    }

    // .plist 파일 내용을 딕셔너리로 받아오기
    let plist = NSDictionary(contentsOfFile: filePath)

    // 딕셔너리에서 키 찾기
    guard let value = plist?.object(forKey: key) as? String else {
        fatalError("Couldn't find key '\(key)'")
    }

    return value
}
