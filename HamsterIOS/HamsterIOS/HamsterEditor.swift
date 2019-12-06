//
//  HamsterEditor.swift
//  HamsterIOS
//
//  Created by User06 on 2019/12/5.
//  Copyright © 2019 matcha55. All rights reserved.
//

import SwiftUI

struct HamsterEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var hamstersData: HamstersData
    @State private var name = ""
    @State private var weight = ""
    @State private var gender = ""
    @State private var time = ""
    @State private var selectDate = Date()
    @State private var selectIndex = 0
    @State private var consumeTime = ""
    let today = Date()
    let startDate = Calendar.current.date(byAdding: .year, value: -5, to: Date())!
    var edithamster: Hamsters?
    var activity = ["睡覺","跑滾輪","出籠子探險","吃飯","吃獎勵小點心","便便尿尿"]
    
    
    var body: some View {
        Form {
            DatePicker("日期", selection: self.$selectDate, in: self.startDate..., displayedComponents: .date)
            TextField("名字", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 50)
                .stroke(Color.yellow, lineWidth: 5))
            TextField("體重", text: $weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 50)
                .stroke(Color.yellow, lineWidth: 5))
            TextField("性別", text: $gender)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.yellow, lineWidth: 5))
            TextField("做了幾分鐘", text: $consumeTime)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 50)
                .stroke(Color.yellow, lineWidth: 5))
        Picker(selection: $selectIndex, label:
            Text("鼠鼠在做什麼？")){
                Text(self.activity[0]).tag(0)
                Text(self.activity[1]).tag(1)
                Text(self.activity[2]).tag(2)
                Text(self.activity[3]).tag(3)
                Text(self.activity[4]).tag(4)
                Text(self.activity[5]).tag(5)
            }
        }
        .background(Color.green)
        .navigationBarTitle(edithamster == nil ? "新增鼠鼠的一天" : "編輯鼠鼠的一天")
        .navigationBarItems(trailing: Button("Save") {
            let Input = Hamsters(name: self.name, weight: self.weight, gender: self.gender, activity: self.activity[self.selectIndex], consumeTime: self.consumeTime)
            if let editInput = self.edithamster {
                let index = self.hamstersData.hamsters.firstIndex {
                    $0.id == editInput.id
                    }!
                self.hamstersData.hamsters[index] = Input
            } else {
                self.hamstersData.hamsters.insert(Input, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
            
        })
            .onAppear {
                if let editInput = self.edithamster {
                    self.name = editInput.name
                    self.weight = editInput.weight
                }
        }
        
    }
    
}

struct HamsterEditor_Previews: PreviewProvider {
    static var previews: some View {
        HamsterEditor(hamstersData: HamstersData())
    }
}
