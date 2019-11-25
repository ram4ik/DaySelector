//
//  DaySelector.swift
//  DaySelector
//
//  Created by Ramill Ibragimov on 25.11.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct Day: Identifiable {
    let id: Int
    let text: String
}

struct DayView: View {
    let day: Day
    
    @Binding var selectedID: Int
    
    var selected: Bool {
        selectedID == day.id
    }
    
    var textColor: Color {
        selected ? .white : Color.white.opacity(0.3)
    }
    
    var body: some View {
        Text(day.text)
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            .foregroundColor(.white)
            .colorMultiply(textColor)
            .animation(.easeInOut)
            .offset(x: 0, y: -2)
            .frame(width: 70, height: 50, alignment: .leading)
            .onTapGesture {
                self.selectedID = self.day.id
        }
    }
}

struct DaySelector: View {
    let days = [
        Day(id: 0, text: "Today"),
        Day(id: 1, text: "Fri 18"),
        Day(id: 2, text: "Sat 19"),
        Day(id: 3, text: "Sun 20"),
        Day(id: 4, text: "Mon 21"),
        Day(id: 5, text: "Tue 22"),
    ]
    
    @State var selectedID: Int = 2
    
    var offset: CGFloat {
        CGFloat(32 + 78 * selectedID)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ZStack(alignment: .leading) {
                HStack {
                    ForEach(days) { day in
                        DayView(day: day, selectedID: self.$selectedID)
                    }
                }
                .padding(.leading, 32)
                .padding(.vertical, 10)
                
                Rectangle()
                    .frame(width: 20, height: 2)
                    .cornerRadius(1)
                    .offset(x: offset, y: 16)
                    .foregroundColor(.white)
                    .animation(.spring())
            }
        }
        .background(Color.scrollColor)
        .cornerRadius(14)
        .shadow(radius: 20)
        .padding(.horizontal, 24)
    }
}

struct DaySelector_Previews: PreviewProvider {
    static var previews: some View {
        DaySelector()
    }
}
