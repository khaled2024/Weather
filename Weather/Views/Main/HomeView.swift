//
//  HomeView.swift
//  Weather
//
//  Created by KhaleD HuSsien on 11/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            //MARK: - Background
            Color.background.ignoresSafeArea()
            //MARK: - Background Image
            Image("Background")
                .scaledToFit()
                .ignoresSafeArea()
            //MARK: - House image
            Image("House")
                .frame(maxHeight: .infinity,alignment: .top)
                .padding(.top, 257)
            //MARK: - Current Weather
            VStack{
                Text("Cairo")
                    .font(.largeTitle)
                VStack{
                    Text(attributedString)
//                    Text("19°")
//                        .foregroundColor(.primary)
//                        .font(Font.system(size: 96, weight: .thin))
//                    +
//                    Text("\n ")
//                    +
//                    Text("Mostly Clear")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.secondary)
                    Text("H:24°    L:18°")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.top, 51)
        }
    }
    private var attributedString: AttributedString{
        var string = AttributedString("19°" + "\n " + "Mostly Clear")
        if let temp = string.range(of: "19°"){
            string[temp].foregroundColor = .primary
            string[temp].font = .system(size: 96, weight: .thin)
        }
        if let pipe = string.range(of: " | "){
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        if let weather = string.range(of: "Mostly Clear"){
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}