//
//  TimePickers.swift
//  BerlinClock
//
//  Created by ablai erzhanov on 26.11.2021.
//

import SwiftUI


struct PickerView: View {
    @Binding var isShow: Bool
    
    var hoursList = [Int](0..<24)
    var minutesList = [Int](0..<60)
    var secondsList = [Int](0..<60)
    @Binding var hours: Int 
    @Binding var minutes: Int
    @Binding var seconds: Int
    var body: some View {
        HStack(alignment: .center, spacing: 5, content: {
            Picker(selection: self.$hours, label: Text("")) {
                ForEach(0 ..< hoursList.count) { index in
                    Text("\(hoursList[index])").tag(index)
                        .foregroundColor(.orange)
                    
                }
            }
            .frame(width: 30, height: 30, alignment: .center)
            .pickerStyle(.wheel)
            .clipped()
            .labelsHidden()
            .background(Color.clear)
            .opacity(isShow ? 1 : 0)
            .padding(.leading, 5)
            .padding(.top, 0)
            .padding(.bottom, 0)
            .compositingGroup()
            
            Picker(selection: self.$minutes, label: Text("")) {
                ForEach(0 ..< minutesList.count) { index in
                    Text(":\(minutesList[index])").tag(index)
                        .foregroundColor(.orange)
                        .background(Color.white)
                }
            }
            
            .frame(width: 30, height: 30, alignment: .center)
            .clipped()
            .pickerStyle(.wheel)
            .labelsHidden()
            .background(Color.white)
            .opacity(isShow ? 1 : 0)
//            .padding(.leading, 5)
            .compositingGroup()
            
            Picker(selection: self.$seconds, label: Text("")) {
                ForEach(0 ..< secondsList.count) { index in
                    Text(":\(secondsList[index])").tag(index)
                        .foregroundColor(.orange)
                        .background(Color.white)
                }
            }
            .frame(width: 30, height: 30, alignment: .center)
            .clipped(antialiased: true)
            .pickerStyle(.wheel)
            .labelsHidden()
            .background(Color.clear)
            .opacity(isShow ? 1 : 0)
            .padding(.trailing, 5)
            .compositingGroup()
        })
        .compositingGroup()
        .background(Color.white)
        .overlay( self.isShow ? RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.orange, lineWidth: 2) : nil)
        .opacity(isShow ? 1 : 0)
    }
}
