//
//  HamsterData.swift
//  HamsterIOS
//
//  Created by User06 on 2019/12/5.
//  Copyright © 2019 matcha55. All rights reserved.
//

import Foundation


struct Hamsters: Identifiable, Codable {
    var id = UUID()
    var name: String
    var weight: String
    var gender: String
    var activity: String
    var consumeTime: String
}

class HamstersData: ObservableObject{
    @Published var hamsters = [Hamsters](){
        didSet{
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(hamsters){
                UserDefaults.standard.set(data, forKey: "myHamsters")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "myHamsters"){
            let decoder = JSONDecoder()
            if let decodeData = try? decoder.decode([Hamsters].self, from: data){
                hamsters = decodeData
            }
        }
    }
}
