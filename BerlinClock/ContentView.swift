//
//  ContentView.swift
//  BerlinClock
//
//  Created by ablai erzhanov on 18.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var showDetail = false
    @State var selection: Int? = nil
    @State var hours: Int = 0
    @State var minutes:  Int = 0
    @State var seconds:  Int = 0
    var timeConverter = TimeConverter()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 34/255, green: 40/255, blue: 49/255)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("It's Berlin Clock")
                        .foregroundColor(Color(red: 221/255, green: 221/255, blue: 221/255))
                        .frame(width: 300, height: 50)
                        .padding()
                    Text("Please choose your Time!")
                        .foregroundColor(Color(red: 221/255, green: 221/255, blue: 221/255))
                    Spacer()
                    
                    NavigationLink(destination: BerlinCLockView(timeConverter: self.timeConverter), tag: 1, selection: $selection) {
                        Button(showDetail ? "showBerlinClock" : "Let's choose time") {
                            if showDetail {
                                timeConverter.convertTimeToString(hours, minutes: minutes, seconds: seconds) {
                                    self.selection = 1
                                    self.showDetail = false
                                }
                            } else {
                                self.showDetail = true
                            }
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 40)
                        .background(Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)))
                        .cornerRadius(20)
                        .shadow(color: Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)).opacity(0.6), radius: 10, y: 10)
                        .padding()

                        
                    }
                    .padding()
                }
                .onTapGesture {
                    if showDetail {
                        showDetail = false
                    }
                }
                
                DetailView(showDetail: $showDetail, hours: $hours, minutes: $minutes, seconds: $seconds)
                    .offset(y: showDetail ? 0 : 600)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
//                    .animation(.easeIn(duration: 0.5))
            }
        }
    }
}


struct DetailView: View {
    @Binding var showDetail: Bool
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    
    var hoursList = [Int](0..<24)
    var minutesList = [Int](0..<60)
    var secondsList = [Int](0..<60)
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    Spacer()
                    
                    HStack {
                        Picker(selection: self.$hours, label: Text("")) {
                            ForEach(0 ..< hoursList.count) { index in
                                Text("\(hoursList[index])h").tag(index)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: geometry.size.width/3, height: 200, alignment: .center)
                        .pickerStyle(.inline)
                        .labelsHidden()
                        .background(Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)))
                        .compositingGroup()
                        .opacity(showDetail ? 1 : 0)
                        
                        Picker(selection: self.$minutes, label: Text("")) {
                            ForEach(0 ..< minutesList.count) { index in
                                Text("\(minutesList[index])m").tag(index)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: geometry.size.width/3, height: 200, alignment: .center)
                        .pickerStyle(.wheel)
                        .labelsHidden()
                        .background(Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)))
                        .compositingGroup()
                        .opacity(showDetail ? 1 : 0)
                        
                        Picker(selection: self.$seconds, label: Text("")) {
                            ForEach(0 ..< secondsList.count) { index in
                                Text("\(secondsList[index])s").tag(index)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: geometry.size.width/3, height: 200, alignment: .center)
                        .pickerStyle(.wheel)
                        .labelsHidden()
                        .background(Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)))
                        .compositingGroup()
                        .opacity(showDetail ? 1 : 0)
                    }
                    .background(Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)))
//                    .cornerRadius(50)
                }
                
                .padding(.bottom, 150)
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
