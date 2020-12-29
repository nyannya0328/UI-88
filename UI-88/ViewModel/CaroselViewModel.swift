//
//  CaroselViewModel.swift
//  UI-88
//
//  Created by にゃんにゃん丸 on 2020/12/29.
//

import SwiftUI

class CaroselViewModel: ObservableObject {
    
    @Published var cards = [
        
        card(cardcolor: Color.red, title: "RED"),
        card(cardcolor: Color.blue, title: "Blue"),
        card(cardcolor: Color.purple, title: "PURPLE"),
        card(cardcolor: Color.orange, title: "ORANGE"),
        card(cardcolor: Color.pink, title: "PINK"),
    ]
    
    @Published var swipedcard = 0
    
    @Published var showcard = false
    @Published var selectedcolor = card(cardcolor: .clear, title: "")
    
    var content = "ABCDEFG"
    
    @Published var showcontent = false
    
}


