//
//  StatusBar.swift
//  Virtual-Pet_App
//
//  Created by Madison Mitchell on 3/7/23.
//

import SwiftUI

struct StatusBar: View {
//    var level: String
    var percentage: Double
    
    var body: some View {
        GeometryReader { geometry in
//            HStack(alignment: .center) {
//                Text(level)
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: geometry.size.width)
                    Rectangle()
                        .foregroundColor(Color.green)
                        .frame(width: geometry.size.width * CGFloat(percentage / 100))
                }
                .cornerRadius(5.0)
            }
//        }
        .frame(height: 10)
        .frame(width: UIScreen.main.bounds.width * 0.2)
    }
}
