//
//  MainView.swift
//  BerlinClock
//
//  Created by ablai erzhanov on 26.11.2021.
//

import SwiftUI

struct MainView: View {
    @State var hours: Int = 0
    @State var minutes:  Int = 0
    @State var seconds:  Int = 0
    var timeConverter = TimeConverter()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 242/255, green: 242/255, blue: 238/255)
                    .edgesIgnoringSafeArea(.all)
                TimePickerField()
            }
            
                .navigationTitle("TimePicker")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct BerlinClockView: View {
//    var body: some View {
//        ZStack {
//            VStack(alignment: .center) {
//                SecondsView()
//                FiveHourView()
//                SingleHourView()
//                FiveMinuteView()
//                SingleMinuteView()
//            }
//        }
//    }
//}

struct TimePickerField: View {
    @State var inputedNUmber: String = "12:12:12"
    @State var time: Date = Date()
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0

    @State var showPicker: Bool = true
    var hoursList = [Int](0..<24)
    var body: some View {
        HStack {
            Text("Insert time")
                .padding(.leading, 16)
                .padding(.top, 15)
                .padding(.bottom, 15)
            
            Spacer()
            PickerView(isShow: self.$showPicker, hours: self.$hours, minutes: self.$minutes, seconds: self.$seconds)
                .padding(.trailing, 16)
                .padding(.top, 15)
                .padding(.bottom, 15)
        }
        .background(Color.white)
        .cornerRadius(12)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
