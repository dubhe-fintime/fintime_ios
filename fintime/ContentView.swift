//
//  ContentView.swift
//  fintime
//
//  Created by dubhe on 2/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: "http://www.fin-time.com")!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
