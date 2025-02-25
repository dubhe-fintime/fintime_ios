//
//  webview.swift
//  fintime
//
//  Created by dubhe on 2/25/25.
//

import SwiftUI
import WebKit

// 1. WebView 구조체 정의
struct WebView: UIViewRepresentable {
    let url: URL
    
    // 2. makeUIView() 메서드: WKWebView를 생성
    func makeUIView(context: Context) -> WKWebView {
        print("url >>> " + url.absoluteString)
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    // 3. updateUIView() 메서드: 뷰가 업데이트될 때 호출 (필요시 추가 설정)
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
