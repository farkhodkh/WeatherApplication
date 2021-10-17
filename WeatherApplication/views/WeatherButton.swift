//
//  WeatherButton.swift
//  WeatherApplication
//
//  Created by Farkhod on 17.10.2021.
//

import SwiftUI


struct WeatherButton: View {
    var buttonTitle: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(buttonTitle)
            .frame(width: 280, height: 50)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
