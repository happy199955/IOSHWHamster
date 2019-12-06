//
//  Main.swift
//  HamsterIOS
//
//  Created by User06 on 2019/12/5.
//  Copyright © 2019 matcha55. All rights reserved.
//

import SwiftUI

struct Main: View {
    var body: some View {
        TabView{
            HamsterList()
                .tabItem{
                    Image(systemName:"house.fill")
                    Text("主頁")
                }
            PieChartView(percentages: [10, 40, 50])
                .tabItem {
                      Image(systemName: "questionmark")
                      Text("倉鼠的一天")
                }
            CircleView()
                .tabItem {
                  Image(systemName: "person.circle.fill")
                  Text("倉鼠與我的互動")
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
