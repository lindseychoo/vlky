//
//  FeedbackResponseView.swift
//  vlky
//
//  Created by T Krobot on 25/11/22.
//

import SwiftUI

struct FeedbackResponseView: View {
    
    var isClicked: Bool
    
    var body: some View {
        VStack {
            Text("You got this this blah blah")
        }
    }
}

struct FeedbackResponseView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackResponseView(isClicked: true)
    }
}
