//
//  WeatherView.swift
//  TopWeather
//
//  Created by MD FARID on 28/11/23.
//

import SwiftUI

struct WeatherView: View {
    var weather : ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack{
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40 ))
                            
                            Text(weather.weather[0].main )
                        }
                        .frame(width: 150,alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "º").font(.system(size: 100)).fontWeight(.bold).padding()
                    }
                    
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string:"https://unsplash.com/photos/white-and-brown-city-buildings-during-daytime-Nyvq2juw4_o")){image in image
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                            .frame(width:350)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("weather now") .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.medium", name: "Min temp", value: (weather.main.temp_min.roundDouble()+"º"))
                        Spacer()
                        WeatherRow(logo: "thermometer.high", name: "Max temp", value: (weather.main.temp_max.roundDouble()+"º"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "wind speed", value: (weather.wind.speed.roundDouble()+"m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity ", name: "Humidity", value: (weather.main.humidity.roundDouble()+"%"))
                    }
                    
                    
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.664, saturation: 0.953, brightness: 0.718))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
            }
            
            
            
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.664, saturation: 0.953, brightness: 0.718))
            .preferredColorScheme(.dark)
            
            
        }
        
    }
    
    
    
    struct WeatherView_Previews: PreviewProvider{
        static var previews: some View{
            WeatherView(weather: previewWeather)
            
        }
    }
}
