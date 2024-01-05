//
//  ContentView.swift
//  WeatherApp
//
//  Created by Dang Tung Lam on 05/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State
    var isNightMode : Bool = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(
                topColor: isNightMode ? .gray : .blue, bottomColor: isNightMode ? .black : Color("lightBlue")
            )
            
            VStack{
                CityTextView(cityName: "Hanoi, VN")
                
                MainWeatherStatusView(
                    imageName: "sun.max.fill", temperature: 36
                )
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 38)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 38)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 38)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 38)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temperature: 38)
                }
                
                Spacer()
                WeatherButton(
                    title: "Change Day Time", onPressed: {
                        isNightMode = !isNightMode
                        print("Tapped")
                    })
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
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek).font(.system(size: 28, weight: .medium)).foregroundColor(.white)
            Image(systemName: imageName).renderingMode(.original).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°").font(.system(size: 28, weight: .medium)).foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        
        LinearGradient(colors: [topColor, bottomColor], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white).padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName).renderingMode(.original).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°").font(.system(size: 76, weight: .medium)).foregroundColor(.white)
        }.padding(.bottom, 60)
    }
}

struct WeatherButton: View {
    var title: String
    var onPressed: () -> Void
    var body: some View {
        Button{
            onPressed()
        } label: {
            Text(title).font(.system(size: 20, weight: .medium, design: .default)).frame(width: 280, height: 50).background(Color.white).cornerRadius(10).padding()
        }
    }
}
