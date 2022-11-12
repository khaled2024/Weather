//
//  HomeView.swift
//  Weather
//
//  Created by KhaleD HuSsien on 11/11/2022.
//

import SwiftUI
import BottomSheet
struct HomeView: View {
    ///ENUM Botton sheet position
    enum BottomSheetPosition: CGFloat,CaseIterable {
        case top = 0.83  // 702/844
        case middle = 0.385 // 325/844
    }
    //MARK: - VARS & Outlets
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var BottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged: Bool = false
    var BottonSheetTranslationProrated: CGFloat{
        (BottomSheetTranslation - BottomSheetPosition.middle.rawValue)/(BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    //MARK: - Body
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height +
                geometry.safeAreaInsets.top +
                geometry.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36
                ZStack{
                    //MARK: - Background
                    Color.background.ignoresSafeArea()
                    //MARK: - Background Image
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: -BottonSheetTranslationProrated * imageOffset)
                    //MARK: - House image
                    Image("House")
                        .frame(maxHeight: .infinity,alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -BottonSheetTranslationProrated * imageOffset)
                    //MARK: - Current Weather
                    VStack(spacing: -10 * (1-BottonSheetTranslationProrated)){
                        Text("Cairo")
                            .font(.largeTitle)
                        VStack{
                            Text(attributedString)
                            Text("H:24°    L:18°")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .opacity(1-BottonSheetTranslationProrated)
                        }
                        Spacer()
                    }
                    .padding(.top, 51)
                    .offset(y: -BottonSheetTranslationProrated * 46)
                    //MARK: - Bottom sheet position
                    BottomSheetView(position: $bottomSheetPosition) {
//                        Text(BottonSheetTranslationProrated.formatted())
                    } content: {
                        ForcastView(BottonSheetTranslationProrated: BottonSheetTranslationProrated)
                    }
                    .onBottomSheetDrag { translation in
                        BottomSheetTranslation = translation / screenHeight
                        withAnimation(.easeInOut) {
                            if bottomSheetPosition == BottomSheetPosition.top{
                                hasDragged = true
                            }else{
                                hasDragged = false
                            }
                        }
                    }
                    //MARK: - TabBar
                    Tabbar(action: {
                        bottomSheetPosition = .top
                    })
                    .offset(y: BottonSheetTranslationProrated * 115)
                }
            }
            .navigationBarHidden(true)
        }
    }
    private var attributedString: AttributedString{
        var string = AttributedString("19°" + (hasDragged ? " | " : "\n ") + "Mostly Clear")
        if let temp = string.range(of: "19°"){
            string[temp].foregroundColor = hasDragged ? .secondary : .primary
            string[temp].font = .system(size: (96 - (BottonSheetTranslationProrated * (96-20))), weight: hasDragged ? .semibold : .thin)
        }
        if let pipe = string.range(of: " | "){
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary.opacity(BottonSheetTranslationProrated)
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
