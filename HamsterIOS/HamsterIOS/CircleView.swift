//
//  CircleView.swift
//  HamsterIOS
//
//  Created by User06 on 2019/12/5.
//  Copyright © 2019 matcha55. All rights reserved.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .trim(from: 0 , to: 0.95)
                    .stroke(Color.orange, lineWidth: 30)
                Circle()
                    .trim(from: 0.95 , to: 1)
                    .stroke(Color.red, lineWidth: 30)
                Text("我和鼠鼠的互動")
                    .font(.title)
                    .foregroundColor(Color.green)
            }.frame(width: 300, height: 300)
             .padding()
            Text("飼主個人時間")
            .foregroundColor(Color.orange)
            Text("與鼠鼠的遊玩時間")
            .foregroundColor(Color.red)
            Text("鼠鼠想要你的陪伴！請多陪陪他！")
            .foregroundColor(Color.blue)
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
