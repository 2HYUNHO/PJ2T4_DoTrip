//
//  MyMissionDetailView.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
//

import SwiftUI

struct MyMissionDetailView: View {
   
       // @Binding var seletedMissions : Mission
        @Binding var missions : Mission
        @State var clickedBtn = false

        @State var image : Image?
       //나중에 미션 성공하면 포인트 받기
        var reward  = ""
        var body: some View {
            
                ZStack {
                    VStack(alignment:.leading, spacing: 0){
                        Text("\(missions.name)")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.bottom,8)
                        Text("미션내용:\(missions.description)")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                        Text("주소: \(missions.address)")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
//                      
                        
                    
                    }.offset(x:0, y:-300)
                    
                    MyMissionCameraView(mission:$missions)
                      
            }
        .padding(20)
    }
    
}
            



   
