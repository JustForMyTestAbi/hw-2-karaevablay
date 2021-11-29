//
//  BerlinCLockView.swift
//  BerlinClock
//
//  Created by ablai erzhanov on 20.11.2021.
//

import SwiftUI


struct BerlinCLockView: View {
    @Environment(\.presentationMode) var presentation
    
    @State var isLoading: Bool = true
    @State private var progress = 0.0
    var timeConverter: TimeConverter
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color(red: 34/255, green: 40/255, blue: 49/255)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .center) {
                Rectangle()
                    .fill(timeConverter.secondsBulps.first == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                    .shadow(color: Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)).opacity(0.6), radius: 50, y: 100)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(50)
                    .padding(.top, 0)
                
                HStack(alignment: .center, spacing: 10) {
                    Rectangle()
                        .fill(self.timeConverter.fiveHoursBulps[0] == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                        .shadow(color: self.timeConverter.fiveHoursBulps[0] == true ? CustomColoursShadow.onRedBulp : CustomColoursShadow.offRedBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    Rectangle()
                        .fill(self.timeConverter.fiveHoursBulps[1] == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                        .shadow(color: self.timeConverter.fiveHoursBulps[1] == true ? CustomColoursShadow.onRedBulp : CustomColoursShadow.offRedBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    Rectangle()
                        .fill(self.timeConverter.fiveHoursBulps[2] == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                        .shadow(color: self.timeConverter.fiveHoursBulps[2] == true ? CustomColoursShadow.onRedBulp : CustomColoursShadow.offRedBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    Rectangle()
                        .fill(self.timeConverter.fiveHoursBulps[3] == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                        .shadow(color: self.timeConverter.fiveHoursBulps[3] == true ? CustomColoursShadow.onRedBulp : CustomColoursShadow.offRedBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    
                }
                .padding(.top, 25)
                
                HStack(alignment: .center, spacing: 10) {
                    Rectangle()
                        .fill(self.timeConverter.singleHoursBulps[0] == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                        .shadow(color: self.timeConverter.singleHoursBulps[0] == true ? CustomColoursShadow.onRedBulp : CustomColoursShadow.offRedBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    Rectangle()
                        .fill(self.timeConverter.singleHoursBulps[1] == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                        .shadow(color: self.timeConverter.singleHoursBulps[1] == true ? CustomColoursShadow.onRedBulp : CustomColoursShadow.offRedBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    Rectangle()
                        .fill(self.timeConverter.singleHoursBulps[2] == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                        .shadow(color: self.timeConverter.singleHoursBulps[2] == true ? CustomColoursShadow.onRedBulp : CustomColoursShadow.offRedBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    Rectangle()
                        .fill(self.timeConverter.singleHoursBulps[3] == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                        .shadow(color: self.timeConverter.singleHoursBulps[3] == true ? CustomColoursShadow.onRedBulp : CustomColoursShadow.offRedBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    
                }
                .padding(.top, 10)
                
                HStack(alignment: .center, spacing: 10) {
                    Group {
                        Rectangle()
                            .fill(self.timeConverter.fiveMinutesBulps[0] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                            .shadow(color: self.timeConverter.fiveMinutesBulps[0] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                            .frame(width: 22, height: 45, alignment: .center)
                        Rectangle()
                            .fill(self.timeConverter.fiveMinutesBulps[1] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                            .shadow(color: self.timeConverter.fiveMinutesBulps[1] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                            .frame(width: 22, height: 45, alignment: .center)
                        Rectangle()
                            .fill(self.timeConverter.fiveMinutesBulps[2] == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                            .shadow(color: self.timeConverter.fiveMinutesBulps[2] == true ? CustomColoursShadow.onRedBulp : CustomColoursShadow.offRedBulp, radius: 10, y: 10)
                            .frame(width: 22, height: 45, alignment: .center)
                        Rectangle()
                            .fill(self.timeConverter.fiveMinutesBulps[3] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                            .shadow(color: self.timeConverter.fiveMinutesBulps[3] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                            .frame(width: 22, height: 45, alignment: .center)
                        Rectangle()
                            .fill(self.timeConverter.fiveMinutesBulps[4] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                            .shadow(color: self.timeConverter.fiveMinutesBulps[4] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                            .frame(width: 22, height: 45, alignment: .center)
                        Rectangle()
                            .fill(self.timeConverter.fiveMinutesBulps[5] == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                            .shadow(color: self.timeConverter.fiveMinutesBulps[5] == true ? CustomColoursShadow.onRedBulp : CustomColoursShadow.offRedBulp, radius: 10, y: 10)
                            .frame(width: 22, height: 45, alignment: .center)
                        Rectangle()
                            .fill(self.timeConverter.fiveMinutesBulps[6] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                            .shadow(color: self.timeConverter.fiveMinutesBulps[6] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                            .frame(width: 22, height: 45, alignment: .center)
                        Rectangle()
                            .fill(self.timeConverter.fiveMinutesBulps[7] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                            .shadow(color: self.timeConverter.fiveMinutesBulps[7] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                            .frame(width: 22, height: 45, alignment: .center)
                        Rectangle()
                            .fill(self.timeConverter.fiveMinutesBulps[8] == true ? CustomColours.onRedBulp : CustomColours.offRedBulp)
                            .shadow(color: self.timeConverter.fiveMinutesBulps[8] == true ? CustomColoursShadow.onRedBulp : CustomColoursShadow.offRedBulp, radius: 10, y: 10)
                            .frame(width: 22, height: 45, alignment: .center)
                        Rectangle()
                            .fill(self.timeConverter.fiveMinutesBulps[9] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                            .shadow(color: self.timeConverter.fiveMinutesBulps[9] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                            .frame(width: 22, height: 45, alignment: .center)
                    }
                    Rectangle()
                        .fill(self.timeConverter.fiveMinutesBulps[10] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                        .shadow(color: self.timeConverter.fiveMinutesBulps[10] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                        .frame(width: 22, height: 45, alignment: .center)
                   
                }
                .padding(.top, 10)
                
                HStack(alignment: .center, spacing: 10) {
                    Rectangle()
                        .fill(self.timeConverter.singleMinutesBulps[0] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                        .shadow(color: self.timeConverter.singleMinutesBulps[0] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    Rectangle()
                        .fill(self.timeConverter.singleMinutesBulps[1] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                        .shadow(color: self.timeConverter.singleMinutesBulps[1] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    Rectangle()
                        .fill(self.timeConverter.singleMinutesBulps[2] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                        .shadow(color: self.timeConverter.singleMinutesBulps[2] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    Rectangle()
                        .fill(self.timeConverter.singleMinutesBulps[3] == true ? CustomColours.onYellowBulp : CustomColours.offYellowBulp)
                        .shadow(color: self.timeConverter.singleMinutesBulps[3] == true ? CustomColoursShadow.onYellowBulp : CustomColoursShadow.offYellowBulp, radius: 10, y: 10)
                        .frame(width: 80, height: 40, alignment: .center)
                    
                }
                .padding(.top, 10)

                Text("\(timeConverter.hours)h : \(timeConverter.minutes)m : \(timeConverter.seconds)s")
                    .foregroundColor(Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)))
                    .font(.system(size: 24))
                    .bold()
                    .padding(.top, 60)
                
                Button("Back") {
                    presentation.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 40)
                .background(Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)))
                .cornerRadius(20)
                .shadow(color: Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)).opacity(0.6), radius: 10, y: 10)
                .padding(.top, 60)
                
                Spacer()
            }
            .opacity(isLoading ? 0.2 : 1.0)
            
            
            LoadingView(isLoading: self.$isLoading, progress: self.$progress)
                .padding(.bottom, 300)
        }
    }
}

struct LoadingView: View {
    @Binding var isLoading: Bool
    @Binding var progress: Double
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
            ProgressView(value: self.progress, total: 100.0)
                .progressViewStyle(CustomProgressStyle())
                .frame(width: 200, height: 200)
                .contentShape(Rectangle())
                .onReceive(timer, perform: { _  in
                    if progress < 100 {
                        progress += 5
                    } else {
                        isLoading = false
                    }
                })
                .background(Color.clear)
                .opacity(isLoading ? 1.0 : 0.0)
            
            Text("Loading of Berlin Clock")
                .font(.system(size: 28))
                .bold()
                .foregroundColor(Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)))
                .opacity(isLoading ? 1.0 : 0.0)
                .padding(.top, 50)
        }
    }
}

struct CustomProgressStyle: ProgressViewStyle {
    var strokeColor = Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1))
    var strokeWidth = 15.0

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(fractionCompleted))
                .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                .rotationEffect(.degrees(-45))
        }
    }
}

enum CustomColours {
    static let onRedBulp = Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1))
    static let offRedBulp = Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 0.2))
    static let onYellowBulp = Color(#colorLiteral(red: 255/255, green: 183/255, blue: 64/255, alpha: 1))
    static let offYellowBulp = Color(#colorLiteral(red: 255/255, green: 183/255, blue: 64/255, alpha: 0.2))
}

enum CustomColoursShadow {
    static let onRedBulp = Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 1)).opacity(0.5)
    static let offRedBulp = Color(#colorLiteral(red: 240/255, green: 84/255, blue: 84/255, alpha: 0.2))
    static let onYellowBulp = Color(#colorLiteral(red: 255/255, green: 183/255, blue: 64/255, alpha: 1)).opacity(0.5)
    static let offYellowBulp = Color(#colorLiteral(red: 255/255, green: 183/255, blue: 64/255, alpha: 0.2))
}

struct BerlinCLockView_Previews: PreviewProvider {
    static var previews: some View {
        BerlinCLockView(timeConverter: TimeConverter())
    }
}
