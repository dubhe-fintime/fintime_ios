//
//  webview.swift
//  fintime
//
//  Created by dubhe on 2/25/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        // WKWebViewConfiguration 생성
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true // JavaScript 활성화
        
        let config = WKWebViewConfiguration()
        config.preferences = preferences
        
        // WKWebView 생성
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator // navigationDelegate 설정
        
        // 요청 보내기
        let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
    // Coordinator 객체 생성
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        // 링크 클릭을 처리하는 메서드
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url, navigationAction.targetFrame == nil {
                // target="_blank" 링크 처리: 새 창을 열고 외부에서 열기
                UIApplication.shared.open(url)
                decisionHandler(.cancel) // 기본 동작을 취소
                return
            }
            
            // 기본 동작 허용 (링크 이동)
            decisionHandler(.allow)
        }

        // 네트워크 오류 등 실패 시 처리
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            print("Navigation failed: \(error.localizedDescription)")
        }

        // 웹 페이지 로딩 완료 시 처리
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Page finished loading.")
        }
    }
}
