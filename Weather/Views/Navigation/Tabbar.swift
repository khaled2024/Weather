//
//  Tabbar.swift
//  Weather
//
//  Created by KhaleD HuSsien on 11/11/2022.
//

import SwiftUI

struct Tabbar: View {
    var action: ()->Void
    var body: some View {
        ZStack{
            //MARK: -  ARC SHAPE
            Arc()
                .fill(Color.tabBarBackground)
                .frame(height: 88)
                .overlay{
                    // arc border
                    Arc()
                        .stroke(Color.tabBarBorder,lineWidth: 0.5)
                }
            HStack{
                //MARK: - Expand Button
                Button {
                    action()
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                Spacer()
                //MARK: - Navigation Button
                NavigationLink {
                    Text("List ")
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }
            }
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
        }
        .frame(maxHeight: .infinity,alignment: .bottom).ignoresSafeArea()
    }
}
struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar(action: {})
            .preferredColorScheme(.dark)
    }
}
