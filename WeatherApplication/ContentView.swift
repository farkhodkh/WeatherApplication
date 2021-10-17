//
//  ContentView.swift
//  WeatherApplication
//
//  Created by Farkhod on 15.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Saint Petersburg, RU")

                MainStatusWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 14)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeak: "TUE", imageName: "cloud.sun.fill", temperature: 14)
                    WeatherDayView(dayOfWeak: "WED", imageName: "cloud.sun.rain.fill", temperature: 12)
                    WeatherDayView(dayOfWeak: "THU", imageName: "cloud.rain.fill", temperature: 15)
                    WeatherDayView(dayOfWeak: "FRI", imageName: "sun.max.fill", temperature: 11)
                    WeatherDayView(dayOfWeak: "SAT", imageName: "cloud.bolt.rain.fill", temperature: 8)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        buttonTitle: "Change day time",
                        textColor: Color.blue,
                        backgroundColor: Color.white
                    )
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeak: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeak)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {

    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainStatusWeatherView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
        Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
