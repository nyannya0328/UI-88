//
//  Model.swift
//  UI-88
//
//  Created by にゃんにゃん丸 on 2020/12/29.
//

import SwiftUI

struct card: Identifiable {
    var id = UUID().uuidString
    var cardcolor : Color
    var offset : CGFloat = 0
    var title : String
}

