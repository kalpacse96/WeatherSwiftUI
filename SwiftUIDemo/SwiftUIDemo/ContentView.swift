//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Kalpataru Sahoo on 23/08/22.
//

import SwiftUI

struct ContentView: View {
    @State public var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack {
                CityTextView(cityName: "Mumbai, India")
                MainWeatherStackView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
                
                HStack(spacing: 18) {
                    daySubView(day: "SUN", imageName: "cloud.sun.rain.fill", temp: 96)
                    daySubView(day: "MON", imageName: "cloud.moon.fill", temp: 63)
                    daySubView(day: "TUE", imageName: "cloud.sun.fill", temp: 26)
                    daySubView(day: "WED", imageName: "cloud.sun.fill", temp: 44)
                    daySubView(day: "THU", imageName: "cloud.bolt.rain.fill", temp: 75)
                    daySubView(day: "FRI", imageName: "cloud.sun.rain.fill", temp: 36)
                }
                Spacer(minLength: 10)
                ChangeDayTimeButton(isNight: $isNight, title: "Change day time")
                Spacer()
                            
                
            }
        }
    }
}

struct DataType: Identifiable {
    let id: Int
    let name: String
    let size: String
    let color: Color
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
            ContentView()
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}

struct daySubView: View {
    var day: String
    var imageName: String
    var temp: Int
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 18, weight: .regular, design: .default))
                .foregroundColor(.white)
            Image.init(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            Text("\(temp)°")
                .font(.system(size: 18, weight: .regular, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient.init(
            gradient:
                Gradient.init(colors: [topColor,bottomColor]), startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding()
            
    }
}

struct MainWeatherStackView: View {
    var imageName: String
    var temp: Int
    var body: some View {
        VStack(spacing: 0) {
            Image.init(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            Text("\(temp)°")
                .font(.system(size: 40, weight: .medium, design: .default))
                .foregroundColor(.white)
        
        }.padding(.bottom, 40)
    }
}

struct ChangeDayTimeButton: View {
    @Binding var isNight: Bool
    var title: String
    var body: some View {
        Button(title) {
            print("Tapped")
            isNight.toggle()
        }.frame(width: 300, height: 50)
            .background(Color.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

