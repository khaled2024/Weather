//
//  ForcastView.swift
//  Weather
//
//  Created by KhaleD HuSsien on 11/11/2022.


import SwiftUI

struct ForcastView: View {
    var BottonSheetTranslationProrated: CGFloat = 1
    @State var selection = 0
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                SegmentedControl(selection: $selection)
                
                // forecast card
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12){
                        if selection == 0 {
                            ForEach(Forecast.hourly){ forecast in
                                ForcastCard(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                        }else{
                            ForEach(Forecast.daily){ forecast in
                                ForcastCard(forecast: forecast, forecastPeriod: .daily)
                            }
                            .transition(.offset(x: 430))
                        }
                        
                    }
                    .padding(.vertical,20)
                }
                .padding(.horizontal,20)
                
                // image wedgit
                Image("Forecast Widgets")
                    .opacity(BottonSheetTranslationProrated)
            }
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - BottonSheetTranslationProrated)
        .overlay{
            //button sheet seperator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity,alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay{
            // indecator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity,alignment: .top)
        }
    }
}

struct ForcastView_Previews: PreviewProvider {
    static var previews: some View {
        ForcastView()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}
