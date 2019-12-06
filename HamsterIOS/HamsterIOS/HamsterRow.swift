//
//  HamsterRow.swift
//  HamsterIOS
//
//  Created by User06 on 2019/12/5.
//  Copyright © 2019 matcha55. All rights reserved.
//

import SwiftUI

struct HamsterRow: View {
    
    var hamsters: Hamsters

    var body: some View {
        HStack{
            VStack{
                Text("Name:" + hamsters.name)
                Text("Gender: " + hamsters.gender)
                Text("Weight:" + hamsters.weight + "g")
            }
            Spacer()
            VStack{
                Text(hamsters.activity)
                Text("\(hamsters.consumeTime)min")
            }
        }
    }
}

struct HamsterRow_Previews: PreviewProvider {
    static var previews: some View {
        HamsterRow(hamsters: Hamsters(name: "penny", weight: "30", gender: "公", activity: "睡覺", consumeTime: "30"))
    }
}
