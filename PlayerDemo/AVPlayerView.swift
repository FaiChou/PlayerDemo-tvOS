//
//  AVPlayerView.swift
//  PlayerDemo
//
//  Created by 周辉 on 2023/6/27.
//


import SwiftUI
import UIKit
import AVKit

let PLAYBACK_RATES = [
    0.5,
    0.75,
    1.0,
    1.25,
    1.5,
    1.75,
    2.0
]

struct AVPlayerView: UIViewControllerRepresentable {
    @State private var playbackSpeed: Double = 1.0
    var player: AVPlayer?
    func customTransportBarItems(controller: AVPlayerViewController) -> UIMenu {
        let speedActions = PLAYBACK_RATES.map { value in
            UIAction(title: String(value), state: self.playbackSpeed == value ? .on : .off) { action in
                self.playbackSpeed = value
                controller.player?.rate = Float(value)
                action.state = .on
            }
        }
        let submenu = UIMenu(title: "播放速度",
                             options: [.displayInline, .singleSelection],
                             children: speedActions)
        return UIMenu(title: "Rate", image: UIImage(systemName: "speedometer"), children: [submenu])
    }
    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        playerController.player = player
        playerController.transportBarCustomMenuItems = [self.customTransportBarItems(controller: playerController)]
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerController = AVPlayerViewController()
        return playerController
    }
}
