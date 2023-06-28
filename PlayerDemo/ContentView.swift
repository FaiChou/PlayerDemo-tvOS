//
//  ContentView.swift
//  PlayerDemo
//
//  Created by 周辉 on 2023/6/27.
//

import SwiftUI
import AVKit

let url = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"
let url2 = "https://bj29-hz.cn-hangzhou.data.alicloudccp.com/EiYRoI61%2F990625012%2F645f11616e2238d4190f47deb0d60097e7ed4ad6"
let mkv = "https://cn-beijing-data.aliyundrive.net/fJnG38yS%2F73003%2F649acc52bc4664e704d64dac8e2fb85ef6ed9211%2F649acc525bd3"
let m4v = "https://cn-beijing-data.aliyundrive.net/YMPoUb1v%2F73003%2F649acc52d6a65a8ad49c469581d5e4505cc32ba4%2F649acc52d0d43"
let mp4 = "https://cn-beijing-data.aliyundrive.net/aLw4zh5w%2F73003%2F649acc52fbfa326e684c4be8b66c4282d8ccd2fb%2F649acc521f3e78"
let mov = "https://cn-beijing-data.aliyundrive.net/PRiMNvHH%2F73003%2F649acc521a845802f38b43c1a3b2bf3b404c224e%2F649acc52c8fd619"
let m3u8 = "https://ccp-bj29-video-preview.oss-enet.aliyuncs.com/lt/95033D597621D306C5D26655AD7BF1CD8E7FDF1C_230343471__sha1_bj29"

struct ContentView: View {
    @State var player: AVPlayer?
    var body: some View {
        VideoPlayer(player: player)
            .onAppear {
                let url = URL(string: mov)!
                let asset = AVURLAsset(url: url, options: ["AVURLAssetOutOfBandMIMETypeKey": "video/mp4"])
                player = AVPlayer(playerItem: AVPlayerItem(asset: asset))
            }
        HStack {
            Button("Play") {
                player?.play()
            }
            Button("Pause") {
                player?.pause()
            }
        }
    }
}

