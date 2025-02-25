

import Foundation
import AVFoundation

class AudioPlayer: ObservableObject {
    static let shared = AudioPlayer()
    private var audioPlayer: AVAudioPlayer?

    @Published var isAudioEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isAudioEnabled, forKey: "isMusicOn")
            if isAudioEnabled {
                playAudio()
            } else {
                stopAudio()
            }
        }
    }

    private init() {
        let isInited = !UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        if isInited {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            UserDefaults.standard.set(true, forKey: "isMusicOn")
        }

        self.isAudioEnabled = UserDefaults.standard.bool(forKey: "isMusicOn")
        if isAudioEnabled {
            playAudio()
        }
    }

    func playAudio() {
        if isAudioEnabled {
            guard let url = Bundle.main.url(forResource: "mainTheme", withExtension: "mp3") else {
                return
            }
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.volume = 0.2
                audioPlayer?.play()
            } catch {
            }
        }
    }

    func stopAudio() {
        audioPlayer?.stop()
    }
}


class AudioSoundPlayer: ObservableObject {
    static let shared = AudioSoundPlayer()
    private var audioPlayer: AVAudioPlayer?

    @Published var isSoundEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isSoundEnabled, forKey: "isSoundOn")
        }
    }

    init() {
        let isInited = !UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        if isInited {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            UserDefaults.standard.set(true, forKey: "isSoundOn")
        }

        self.isSoundEnabled = UserDefaults.standard.bool(forKey: "isSoundOn")
    }

    func playSound() {
        if isSoundEnabled {
            guard let url = Bundle.main.url(forResource: "slide", withExtension: "mp3") else {
                return
            }
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.volume = 0.05
                audioPlayer?.play()
            } catch {
            }
        }
    }
}
