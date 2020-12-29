//
//  ContentView.swift
//  UI-88
//
//  Created by にゃんにゃん丸 on 2020/12/29.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = CaroselViewModel()
    var body: some View {
       Home()
        .environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
