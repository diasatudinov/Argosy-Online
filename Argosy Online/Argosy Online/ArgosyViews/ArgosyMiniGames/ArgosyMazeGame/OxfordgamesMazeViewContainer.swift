//
//  OxfordgamesMazeViewContainer.swift
//  Argosy Online
//
//  Created by Dias Atudinov on 16.05.2025.
//


import SwiftUI
import SpriteKit


struct OxfordgamesMazeViewContainer: UIViewRepresentable {
    @StateObject var user = OxfordgamesUser.shared
    var scene: OxfordgamesMazeScene
    @Binding var isWin: Bool
    func makeUIView(context: Context) -> SKView {
        let skView = SKView(frame: UIScreen.main.bounds)
        skView.backgroundColor = .clear
        scene.scaleMode = .resizeFill
        scene.isWinHandler = {
            isWin = true
            user.updateUserMoney(for: 40)
        }
        skView.presentScene(scene)
        
        return skView
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
        uiView.frame = UIScreen.main.bounds
    }
}
