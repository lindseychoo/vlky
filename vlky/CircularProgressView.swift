//
//  circular progress view.swift
//  vlky
//
//  Created by Lindsey Choo on 16/11/22.
//

import SwiftUI

struct circular_progress_view: View {
    
    @Binding var numTaskCompleted: Int
    var progress: CGFloat
    
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.blue)
                .opacity(0.3)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: .init(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270))
        }
    }
}

struct circular_progress_view_Previews: PreviewProvider {
    static var previews: some View {
        circular_progress_view(numTaskCompleted: .constant(0), progress: 0.25)
    }
}
