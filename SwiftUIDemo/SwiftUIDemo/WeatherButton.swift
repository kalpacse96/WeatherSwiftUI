//
//  WeatherButton.swift
//  SwiftUIDemo
//
//  Created by Kalpataru Sahoo on 10/09/22.
//
import SwiftUI
struct ChangeDayTimeButton1: View {
var body: some View {
    Button("Change Weather") {
        print("Tapped")
    }.frame(width: 300, height: 50)
        .background(Color.white)
        .font(.system(size: 20, weight: .bold, design: .default))
        .cornerRadius(10)
}
}
