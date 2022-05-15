//
//  LogInView.swift
//  LogInIntoButton
//
//  Created by Сергей Веретенников on 15/05/2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var timer = SomeTimer()
    
    var body: some View {
        ZStack {
            Color.mint.ignoresSafeArea()
            VStack {
                Text("\(timer.timerCount)").bold().padding(.top, 150)
                    .font(.system(size: 24))
                Spacer()
                ButtonView(timer: timer)
                Spacer()
            }
        }
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct ButtonView: View {
    
    @ObservedObject var timer: SomeTimer
    
    let color = Color(#colorLiteral(red: 0.9779732823, green: 1, blue: 0.2428201735, alpha: 1))
    
    var body: some View {
        Button(action: timer.startTimer ) {
            Text("\(timer.buttonName)")
                .font(.system(size: 24))
                .bold()
        }
        .frame(width: 200, height: 50)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 2)
        )
    }
}
