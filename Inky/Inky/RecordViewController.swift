//
//  RecordViewController.swift
//  Inky
//
//  Created by Ronin Cunningham on 2019-11-30.
//  Copyright © 2019 JEAR. All rights reserved.
//

import Foundation
import UIKit
import Speech
import AVFoundation

class RecordViewController: UIViewController, AVAudioPlayerDelegate {
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var transcriptionTextField: UITextView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var summaryButton: UIButton!
    
    var audioPlayer: AVAudioPlayer!
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        activitySpinner.isHidden = true
        summaryButton.isHidden = true
        
////        SETTING UP SESSION (swift guy tutorial)
//        recordingSession = AVAudioSession.sharedInstance()
       }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
        activitySpinner.stopAnimating()
        activitySpinner.isHidden = true
        
//        ACTIVATE SUMMARIZE SEQUENCE
        summarize()
    }
    
    func summarize() {
        summaryButton.isHidden = false
    }
    
    
    
    func requestSpeechAuth() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                if let path = Bundle.main.url(forResource: "recording", withExtension: "m4a") { //INSERT RECORDING HERE
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        self.audioPlayer.delegate = self
                        sound.play()
                    } catch {
                        print("error ")
                    }
                    
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) { (result, error) in
                        if let error = error {
                            print("there was an error: \(error)")
                        } else {
                            self.transcriptionTextField.text = result?.bestTranscription.formattedString //SEND TEXT TO WHATEVER U WANT
                        }
                    }
                    
                } //COLLECT RECORDED FILE HERE
            }
        }
    }
    
    @IBAction func playBtnPressed(_ sender: Any) {
        summaryButton.isHidden = true
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        
//        IF STARTING, BEGIN RECORDING
        
        
//        IF STOPPING, BEGIN ANALYZING
        requestSpeechAuth()
    }
    
    @IBAction func summaryBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "summaryFromRecordingSegue", sender: self)
    }
}
