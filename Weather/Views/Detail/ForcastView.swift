//
//  ForcastView.swift
//  Weather
//
//  Created by KhaleD HuSsien on 11/11/2022.
//

import SwiftUI

struct ForcastView: View {
    var body: some View {
        ScrollView{
            
        }
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
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