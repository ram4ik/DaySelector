//
//  ContentView.swift
//  DaySelector
//
//  Created by Ramill Ibragimov on 25.11.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI


struct Navigation: View {
    var body: some View {
        HStack(spacing: 48) {
            Image(systemName: "chevron.left")
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .foregroundColor(.navigationColor)
                .padding(.leading, 48)
            Text("December")
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .foregroundColor(.navigationColor)
            Spacer()
        }
        .padding(.top, 32)
        .padding(.bottom, 48)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Navigation()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
