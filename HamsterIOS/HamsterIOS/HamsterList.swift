//
//  HamsterList.swift
//  HamsterIOS
//
//  Created by User06 on 2019/12/5.
//  Copyright © 2019 matcha55. All rights reserved.
//

import SwiftUI

struct HamsterList: View {
    
    @ObservedObject var hamstersData = HamstersData()
    @State private var showEdithamster = false
    
    
    var body: some View {
        VStack{
            NavigationView {
                List {
                    ForEach(hamstersData.hamsters) { (hamsters) in
                        NavigationLink(destination: HamsterEditor(hamstersData: self.hamstersData, edithamster: hamsters)) {
                            HamsterRow(hamsters: hamsters)
                            
                        }
                    }
                    .onDelete { (indexSet) in self.hamstersData.hamsters.remove(atOffsets: indexSet)
                    }
                }
                .navigationBarTitle("倉鼠的美好日常")
                .navigationBarItems(leading: EditButton() ,trailing: Button(action: {
                    self.showEdithamster = true
                }, label: {
                    Image(systemName: "plus.circle.fill")
                    
                }))
                    .sheet(isPresented: $showEdithamster) {
                        NavigationView {
                             HamsterEditor(hamstersData: self.hamstersData)
                        }
                    }
            }

        }
        
    }
}

struct HamsterList_Previews: PreviewProvider {
    static var previews: some View {
        HamsterList()
    }
}
