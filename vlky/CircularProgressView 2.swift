//
//  circular progress view.swift
//  vlky
//
//  Created by Lindsey Choo on 16/11/22.
//

import SwiftUI

struct circular_progress_view: View {
    
   @State var progress: Int
    
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.blue)
            Circle()
                .trim(from: 0, to: CGFloat(progress))
                          .stroke(style: .init(lineWidth: 20,
                                               lineCap: .round,
                                               lineJoin: .round))
                          .foregroundColor(.red)
                          .rotationEffect(Angle(degrees: 270))
                          .animation(.easeOut, value: progress)
        }
    }
}

struct circular_progress_view_Previews: PreviewProvider {
    static var previews: some View {
        circular_progress_view(progress: 3)
    }
}
