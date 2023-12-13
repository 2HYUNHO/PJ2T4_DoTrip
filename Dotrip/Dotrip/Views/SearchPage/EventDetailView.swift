//
//  EventDetailView.swift
//  Dotrip
//
//  Created by Hee on 12/11/23.
//

import SwiftUI

struct EventDetailView: View {
    
    @StateObject var eventInfo = EventInfoAPI.shared
    @StateObject var eventIntro = IntroductionAPI.shared
    
    let contentId: String
    let contentTypeId: String
    
    var body: some View {
        VStack {
            Divider()
            
            if contentTypeId == "15" {
                ForEach(eventInfo.posts, id: \.self) { result in
                    Text("행사 기간: \(result.eventstartdate)~\(result.eventenddate)")
                    Text("개장 시간: \(result.playtime.escapingHTML)")
                    // <- html태그 제거 extension
                    // string값 뒤에 넣어주면 됩니다.
                    Text("입장료: \(result.usetimefestival.escapingHTML)")
                }
                
                Divider()
                
                ForEach(eventIntro.posts, id: \.self) { result in
                    // 행사소개가 행사소개글, 행사일정 두가지입니다.
                    Text("행사 소개: \(result.infotext.escapingHTML)")
                }
            } else if contentTypeId == "12" {
                ForEach(eventInfo.keyPosts, id: \.self) { result in
                    Text("\(result.restdate)")
                    Text("\(result.expguide)")
                    Text("\(result.usetime.escapingHTML)")
                }
            }
        }
        .padding(20)
        .onAppear() {
            if contentTypeId == "15" {
                eventInfo.feachData(contentID: contentId, contentType: contentTypeId)
                eventIntro.feachData(contentID: contentId, contentType: contentTypeId)
            } else if contentTypeId == "12" {
                eventInfo.feachData(contentID: contentId, contentType: contentTypeId)
            }
        }
    }
}

//#Preview {
//    EventDetailView()
//}
