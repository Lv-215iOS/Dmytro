//
//  InputController.swift
//  Calc
//
//  Created by adminaccount on 12/14/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit
import AVFoundation

protocol InputProtocol {
    var buttonTouched: ((String) -> ())? {get set}
}

class InputController: UIInputViewController {
    @IBOutlet weak var btnPow: UIButton!
    @IBOutlet weak var btnFact: UIButton!
    @IBOutlet weak var btnTgh: UIButton!
    @IBOutlet weak var btnCtgh: UIButton!
    @IBOutlet weak var btnCosh: UIButton!
    @IBOutlet weak var btnSinh: UIButton!
    @IBOutlet weak var btnSin: UIButton!
    @IBOutlet weak var bthCtg: UIButton!
    @IBOutlet weak var btnLog: UIButton!
    @IBOutlet weak var btnLn: UIButton!
    @IBOutlet weak var btnPi: UIButton!
    @IBOutlet weak var btnE: UIButton!
    @IBOutlet weak var btnCos: UIButton!
    @IBOutlet weak var btnTg: UIButton!
    @IBOutlet weak var btnRand: UIButton!
    @IBOutlet weak var btnLeftBracket: UIButton!
    @IBOutlet weak var btnRightBracket: UIButton!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnMPlus: UIButton!
    @IBOutlet weak var btnMRead: UIButton!
    @IBOutlet weak var btnMMinus: UIButton!
    @IBOutlet weak var btnMClean: UIButton!
    @IBOutlet weak var btnMul: UIButton!
    @IBOutlet weak var btnDiv: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnMod: UIButton!
    @IBOutlet weak var btnSqrt: UIButton!
    @IBOutlet weak var btnPlusMinus: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnDot: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var soundOn: UIButton!
    @IBOutlet weak var soundOff: UIButton!
    @IBOutlet weak var graphics: UIButton!
    @IBOutlet weak var btnGraphEqual: UIButton!
    
    var viewController: ViewController? = nil
    var myFrame = CGPoint(x: 0, y: 0)
    var xySize = 0.0
    var screenSize = UIScreen.main.bounds
    var x = 0.0
    var y = 0.0
    var buttonTouched: ((String) -> ())? = nil
    let curve = Curve()
    var isGraphic = false
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let music = Bundle.main.path(forResource: "sound", ofType: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: music! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
    }
    
    @IBAction func touchButton(_ sender: UIButton) {
        if soundOff.isHidden {
            if audioPlayer.currentTime < audioPlayer.duration / 3 {
                audioPlayer.play()
            }
            while audioPlayer.currentTime < audioPlayer.duration / 3 {
            }
            if audioPlayer.currentTime > audioPlayer.duration / 3 {
                audioPlayer.stop()
                audioPlayer.currentTime = 0
            }
        }
        
        if sender.currentTitle == "📈" {
            isGraphic = isGraphic ? false : true
            sender.alpha = sender.alpha == 1 ? 0.3 : 1
            btnMClean.isHidden = btnMClean.isHidden ? false : true
            btnMRead.isHidden = btnMRead.isHidden ? false : true
            btnMPlus.isHidden = btnMPlus.isHidden ? false : true
            btnMMinus.isHidden = btnMMinus.isHidden ? false : true
            btnGraphEqual.isHidden = btnMMinus.isHidden ? false : true
            sender.transform = isGraphic ? CGAffineTransform(scaleX: 0.9, y: 0.9) : CGAffineTransform(scaleX: 1, y: 1)
            return
        }
        if sender.currentTitle! == "🔈" || sender.currentTitle! == "🔇" {
            soundOn.isHidden = soundOn.isHidden ? false : true
            soundOff.isHidden = soundOff.isHidden ? false : true
            return
        }
        
        buttonTouched?(sender.currentTitle!)
        UIView.animate(withDuration: 0.3,
                       animations: {
                        sender.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
                        sender.setTitleColor(UIColor.blue, for: .normal)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.3) {
                            sender.transform = CGAffineTransform.identity
                            sender.setTitleColor(UIColor.black, for: .normal)
                        }
        })
    }
    
    override func viewWillLayoutSubviews() {
        myFrame = CGPoint(x: view.frame.width, y: view.frame.height)
        let screenWidth = Double(myFrame.x)
        let screenHeight = Double(myFrame.y)
        
        self.view.setNeedsDisplay()
        if screenWidth > screenHeight && screenWidth != 768 {
            xySize = sqrt(screenWidth * screenWidth + screenHeight * screenHeight)/12.7
            verticalPosition(screenWidth: screenWidth, screenHeight: screenHeight, radius: xySize)
        } else {
            xySize = sqrt(screenWidth * screenWidth + screenHeight * screenHeight)/9.5
            horizontalPosition(screenWidth: screenWidth, screenHeight: screenHeight, radius: xySize)
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        let screenWidth = Double(myFrame.x)
        let screenHeight = Double(myFrame.y)
        switch UIDevice.current.orientation.isLandscape {
        case true:
            verticalPosition(screenWidth: screenWidth, screenHeight: screenHeight, radius: xySize)
        case false:
            horizontalPosition(screenWidth: screenWidth, screenHeight: screenHeight, radius: xySize)
        }
    }
    
    
    
    weak var btn: UIButton!
    
    var l: CALayer {
        btn.setTitleColor(UIColor .black, for: UIControlState.highlighted)
        return btn.layer
    }
    
    func setUpLayer(border: Bool = true) {
        if border {
            l.borderColor = UIColor.black.cgColor
        } else {
            l.borderColor = UIColor.clear.cgColor
            l.shadowColor = UIColor.yellow.cgColor
        }
        l.borderWidth = 1.5
        l.cornerRadius = CGFloat(xySize/2)
    }
    
    func setButton(x: Double, y: Double, btn: UIButton) {
        btn.frame = CGRect(x: x, y: y, width: xySize, height: xySize)
    }
    
    func horizontalPosition(screenWidth: Double, screenHeight: Double, radius: Double) {
        btn3.frame.origin = CGPoint(x:-1000, y:-100)
        btn4.frame.origin = CGPoint(x:-1000, y:-100)
        btn5.frame.origin = CGPoint(x:-1000, y:-100)
        btn6.frame.origin = CGPoint(x:-1000, y:-100)
        btn7.frame.origin = CGPoint(x:-1000, y:-100)
        btn8.frame.origin = CGPoint(x:-1000, y:-100)
        btn9.frame.origin = CGPoint(x:-1000, y:-100)
        btnBack.frame.origin = CGPoint(x:-1000, y:-100)
        btnMClean.frame.origin = CGPoint(x:-100, y:-100)
        btnMMinus.frame.origin = CGPoint(x:-1000, y:-100)
        btnMPlus.frame.origin = CGPoint(x:-1000, y:-100)
        btnMRead.frame.origin = CGPoint(x:-1000, y:-100)
        btnDot.frame.origin = CGPoint(x:-1000, y:-100)
        btnAdd.frame.origin = CGPoint(x:-1000, y:-100)
        btnDiv.frame.origin = CGPoint(x:-1000, y:-100)
        btnMod.frame.origin = CGPoint(x:-1000, y:-100)
        btnMul.frame.origin = CGPoint(x:-1000, y:-100)
        btnEqual.frame.origin = CGPoint(x:-1000, y:-100)
        btnSqrt.frame.origin = CGPoint(x:-1000, y:-100)
        btnPow.frame.origin = CGPoint(x:-1000, y:-100)
        btnFact.frame.origin = CGPoint(x:-1000, y:-100)
        btnTgh.frame.origin = CGPoint(x:-1000, y:-100)
        btnCtgh.frame.origin = CGPoint(x:-1000, y:-100)
        btnCosh.frame.origin = CGPoint(x:-1000, y:-100)
        btnSinh.frame.origin = CGPoint(x:-1000, y:-100)
        btnSin.frame.origin = CGPoint(x:-1000, y:-100)
        bthCtg.frame.origin = CGPoint(x:-1000, y:-100)
        btnLog.frame.origin = CGPoint(x:-1000, y:-100)
        btnLn.frame.origin = CGPoint(x:-1000, y:-100)
        btnPi.frame.origin = CGPoint(x:-1000, y:-100)
        btnE.frame.origin = CGPoint(x:-1000, y:-100)
        btnCos.frame.origin = CGPoint(x:-1000, y:-100)
        btnTg.frame.origin = CGPoint(x:-1000, y:-100)
        btnRand.frame.origin = CGPoint(x:-1000, y:-100)
        btnLeftBracket.frame.origin = CGPoint(x:-1000, y:-100)
        btnRightBracket.frame.origin = CGPoint(x:-1000, y:-100)
        btn0.frame.origin = CGPoint(x:-1000, y:-100)
        btn1.frame.origin = CGPoint(x:-1000, y:-100)
        btn2.frame.origin = CGPoint(x:-1000, y:-100)
        btn3.frame.origin = CGPoint(x:-1000, y:-100)
        btn4.frame.origin = CGPoint(x:-1000, y:-100)
        btn5.frame.origin = CGPoint(x:-1000, y:-100)
        btn6.frame.origin = CGPoint(x:-1000, y:-100)
        btn7.frame.origin = CGPoint(x:-1000, y:-100)
        btn8.frame.origin = CGPoint(x:-1000, y:-100)
        btn9.frame.origin = CGPoint(x:-1000, y:-100)
        btnMClean.frame.origin = CGPoint(x:-1000, y:-100)
        btnMPlus.frame.origin = CGPoint(x:-1000, y:-100)
        btnMMinus.frame.origin = CGPoint(x:-1000, y:-100)
        btnC.frame.origin = CGPoint(x:-1000, y:-100)
        btnMRead.frame.origin = CGPoint(x:-1000, y:-100)
        btnMul.frame.origin = CGPoint(x:-1000, y:-100)
        btnDiv.frame.origin = CGPoint(x:-1000, y:-100)
        btnMod.frame.origin = CGPoint(x:-1000, y:-100)
        btnSqrt.frame.origin = CGPoint(x:-1000, y:-100)
        btnAdd.frame.origin = CGPoint(x:-1000, y:-100)
        btnMinus.frame.origin = CGPoint(x:-1000, y:-100)
        btnPlusMinus.frame.origin = CGPoint(x:-1000, y:-100)
        btnEqual.frame.origin = CGPoint(x:-1000, y:-100)
        btnDot.frame.origin = CGPoint(x:-1000, y:-100)
        btnBack.frame.origin = CGPoint(x:-1000, y:-100)
        soundOn.frame.origin = CGPoint(x:-1000, y:-100)
        soundOff.frame.origin = CGPoint(x:-1000, y:-100)
        graphics.frame.origin = CGPoint(x:-1000, y:-100)
        btnGraphEqual.frame.origin = CGPoint(x:-1000, y:-100)
        
        btn = btnGraphEqual
        setUpLayer(border: false)
        
        btn = soundOn
        setUpLayer(border: false)
        
        btn = soundOff
        setUpLayer(border: false)

        btn = btn0
        setUpLayer(border: false)
        
        btn = btn1
        setUpLayer(border: false)
        
        btn = btn2
        setUpLayer(border: false)
        
        btn = btn3
        setUpLayer(border: false)
        
        btn = btn4
        setUpLayer(border: false)
        
        btn = btn5
        setUpLayer(border: false)
        
        btn = btn6
        setUpLayer(border: false)
        
        btn = btn7
        setUpLayer(border: false)
        
        btn = btn8
        setUpLayer(border: false)
        
        btn = btn9
        setUpLayer(border: false)
        
        btn = btnMClean
        setUpLayer(border: false)
        
        btn = btnMPlus
        setUpLayer(border: false)
        
        btn = btnMMinus
        setUpLayer(border: false)
        
        btn = btnC
        setUpLayer(border: false)
        
        btn = btnMRead
        setUpLayer(border: false)
        
        btn = btnMul
        setUpLayer(border: false)
        
        btn = btnDiv
        setUpLayer(border: false)
        
        btn = btnMod
        setUpLayer(border: false)
        
        btn = btnSqrt
        setUpLayer(border: false)
        
        btn = btnAdd
        setUpLayer(border: false)
        
        btn = btnMinus
        setUpLayer(border: false)
        
        btn = btnPlusMinus
        setUpLayer(border: false)
        
        btn = btnEqual
        setUpLayer(border: false)
        
        btn = btnDot
        setUpLayer(border: false)
        
        btn = btnBack
        setUpLayer(border: false)
        
        btn = graphics
        setUpLayer(border: false)
        
        setButton(x: 0.81 * screenWidth, y: 0.85 * screenHeight, btn: btnGraphEqual)
        
        setButton(x: -0.02 * screenWidth, y: 0.14 * screenHeight, btn: graphics)
        
        setButton(x: -0.02 * screenWidth, y: 0.03 * screenHeight, btn: soundOn)
        setButton(x: -0.02 * screenWidth, y: 0.03 * screenHeight, btn: soundOff)
        
        setButton(x: 0.81 * screenWidth, y: 0.85 * screenHeight, btn: btnEqual)
        setButton(x: 0.61 * screenWidth, y: 0.84 * screenHeight, btn: btnAdd)
        setButton(x: 0.77 * screenWidth, y: 0.69 * screenHeight, btn: btnMinus)
        
        setButton(x: 0.42 * screenWidth, y: 0.85 * screenHeight, btn: btnMul)
        setButton(x: 0.45 * screenWidth, y: 0.69 * screenHeight, btn: btnDiv)
        setButton(x: 0.59 * screenWidth, y: 0.57 * screenHeight, btn: btnMod)
        setButton(x: 0.81 * screenWidth, y: 0.53 * screenHeight, btn: btnSqrt)
        
        setButton(x: 0.23 * screenWidth, y: 0.85 * screenHeight, btn: btnMClean)
        setButton(x: 0.25 * screenWidth, y: 0.68 * screenHeight, btn: btnMRead)
        setButton(x: 0.36 * screenWidth, y: 0.51 * screenHeight, btn: btnMPlus)
        setButton(x: 0.58 * screenWidth, y: 0.4 * screenHeight, btn: btnMMinus)
        setButton(x: 0.81 * screenWidth, y: 0.38 * screenHeight, btn: btnC)
        
        setButton(x: 0.04 * screenWidth, y: 0.85 * screenHeight, btn: btnPlusMinus)
        setButton(x: 0.05 * screenWidth, y: 0.69 * screenHeight, btn: btn0)
        setButton(x: 0.1 * screenWidth, y: 0.53 * screenHeight, btn: btn1)
        setButton(x: 0.22 * screenWidth, y: 0.39 * screenHeight, btn: btn2)
        setButton(x: 0.39 * screenWidth, y: 0.29 * screenHeight, btn: btn3)
        setButton(x: 0.6 * screenWidth, y: 0.24 * screenHeight, btn: btn4)
        setButton(x: 0.81 * screenWidth, y: 0.22 * screenHeight, btn: btnBack)
        
        setButton(x: 0.01 * screenWidth, y: 0.34 * screenHeight, btn: btnDot)
        setButton(x: 0.13 * screenWidth, y: 0.23 * screenHeight, btn: btn5)
        setButton(x: 0.28 * screenWidth, y: 0.15 * screenHeight, btn: btn6)
        setButton(x: 0.45 * screenWidth, y: 0.1 * screenHeight, btn: btn7)
        setButton(x: 0.63 * screenWidth, y: 0.07 * screenHeight, btn: btn8)
        setButton(x: 0.81 * screenWidth, y: 0.06 * screenHeight, btn: btn9)
    }
    
    func verticalPosition(screenWidth: Double, screenHeight: Double, radius: Double) {
        btn3.frame.origin = CGPoint(x:-100, y:-100)
        btn4.frame.origin = CGPoint(x:-100, y:-100)
        btn5.frame.origin = CGPoint(x:-100, y:-100)
        btn6.frame.origin = CGPoint(x:-100, y:-100)
        btn7.frame.origin = CGPoint(x:-100, y:-100)
        btn8.frame.origin = CGPoint(x:-100, y:-100)
        btn9.frame.origin = CGPoint(x:-100, y:-100)
        btnBack.frame.origin = CGPoint(x:-100, y:-100)
        btnMClean.frame.origin = CGPoint(x:-100, y:-100)
        btnMMinus.frame.origin = CGPoint(x:-100, y:-100)
        btnMPlus.frame.origin = CGPoint(x:-100, y:-100)
        btnMRead.frame.origin = CGPoint(x:-100, y:-100)
        btnDot.frame.origin = CGPoint(x:-100, y:-100)
        btnAdd.frame.origin = CGPoint(x:-100, y:-100)
        btnDiv.frame.origin = CGPoint(x:-100, y:-100)
        btnMod.frame.origin = CGPoint(x:-100, y:-100)
        btnMul.frame.origin = CGPoint(x:-100, y:-100)
        btnEqual.frame.origin = CGPoint(x:-100, y:-100)
        btnSqrt.frame.origin = CGPoint(x:-100, y:-100)
        btnPow.frame.origin = CGPoint(x:-100, y:-100)
        btnFact.frame.origin = CGPoint(x:-100, y:-100)
        btnTgh.frame.origin = CGPoint(x:-100, y:-100)
        btnCtgh.frame.origin = CGPoint(x:-100, y:-100)
        btnCosh.frame.origin = CGPoint(x:-100, y:-100)
        btnSinh.frame.origin = CGPoint(x:-100, y:-100)
        btnSin.frame.origin = CGPoint(x:-100, y:-100)
        bthCtg.frame.origin = CGPoint(x:-100, y:-100)
        btnLog.frame.origin = CGPoint(x:-100, y:-100)
        btnLn.frame.origin = CGPoint(x:-100, y:-100)
        btnPi.frame.origin = CGPoint(x:-100, y:-100)
        btnE.frame.origin = CGPoint(x:-100, y:-100)
        btnCos.frame.origin = CGPoint(x:-100, y:-100)
        btnTg.frame.origin = CGPoint(x:-100, y:-100)
        btnRand.frame.origin = CGPoint(x:-100, y:-100)
        btnLeftBracket.frame.origin = CGPoint(x:-100, y:-100)
        btnRightBracket.frame.origin = CGPoint(x:-100, y:-100)
        btn0.frame.origin = CGPoint(x:-100, y:-100)
        btn1.frame.origin = CGPoint(x:-100, y:-100)
        btn2.frame.origin = CGPoint(x:-100, y:-100)
        btn3.frame.origin = CGPoint(x:-100, y:-100)
        btn4.frame.origin = CGPoint(x:-100, y:-100)
        btn5.frame.origin = CGPoint(x:-100, y:-100)
        btn6.frame.origin = CGPoint(x:-100, y:-100)
        btn7.frame.origin = CGPoint(x:-100, y:-100)
        btn8.frame.origin = CGPoint(x:-100, y:-100)
        btn9.frame.origin = CGPoint(x:-100, y:-100)
        btnMClean.frame.origin = CGPoint(x:-100, y:-100)
        btnMPlus.frame.origin = CGPoint(x:-100, y:-100)
        btnMMinus.frame.origin = CGPoint(x:-100, y:-100)
        btnC.frame.origin = CGPoint(x:-100, y:-100)
        btnMRead.frame.origin = CGPoint(x:-100, y:-100)
        btnMul.frame.origin = CGPoint(x:-100, y:-100)
        btnDiv.frame.origin = CGPoint(x:-100, y:-100)
        btnMod.frame.origin = CGPoint(x:-100, y:-100)
        btnSqrt.frame.origin = CGPoint(x:-100, y:-100)
        btnAdd.frame.origin = CGPoint(x:-100, y:-100)
        btnMinus.frame.origin = CGPoint(x:-100, y:-100)
        btnPlusMinus.frame.origin = CGPoint(x:-100, y:-100)
        btnEqual.frame.origin = CGPoint(x:-100, y:-100)
        btnDot.frame.origin = CGPoint(x:-100, y:-100)
        btnBack.frame.origin = CGPoint(x:-100, y:-100)
        soundOn.frame.origin = CGPoint(x:-100, y:-100)
        soundOff.frame.origin = CGPoint(x:-100, y:-100)
        graphics.frame.origin = CGPoint(x:-100, y:-100)
        btnGraphEqual.frame.origin = CGPoint(x:-100, y:-100)
        
        btn = btnGraphEqual
        setUpLayer(border: false)
        
        btn = graphics
        setUpLayer(border: false)
        
        btn = soundOn
        setUpLayer(border: false)
        
        btn = soundOff
        setUpLayer(border: false)
        
        btn = btn0
        setUpLayer()
        
        btn = btn1
        setUpLayer()
        
        btn = btn2
        setUpLayer()
        
        btn = btn3
        setUpLayer()
        
        btn = btn4
        setUpLayer()
        
        btn = btn5
        setUpLayer()
        
        btn = btn6
        setUpLayer()
        
        btn = btn7
        setUpLayer()
        
        btn = btn8
        setUpLayer()
        
        btn = btn9
        setUpLayer()
        
        btn = btnDot
        setUpLayer()
        
        btn = btnAdd
        setUpLayer()
        
        btn = btnMinus
        setUpLayer()
        
        btn = btnMul
        setUpLayer()
        
        btn = btnDiv
        setUpLayer()
        
        btn = btnMod
        setUpLayer()
        
        btn = btnEqual
        setUpLayer()
        
        btn = btnRand
        setUpLayer()
        
        btn = btnSqrt
        setUpLayer()
        
        btn = btnBack
        setUpLayer()
        
        btn = btnC
        setUpLayer()
        
        btn = btnSin
        setUpLayer()
        
        btn = btnSqrt
        setUpLayer()
        
        btn = btnLeftBracket
        setUpLayer()
        
        btn = btnRightBracket
        setUpLayer()
        
        btn = btnLog
        setUpLayer()
        
        btn = btnLn
        setUpLayer()
        
        btn = btnPow
        setUpLayer()
        
        btn = btnFact
        setUpLayer()
        
        btn = btnE
        setUpLayer()
        
        btn = btnPi
        setUpLayer()
        
        btn = btnMClean
        setUpLayer()
        
        btn = btnMRead
        setUpLayer()
        
        btn = btnMPlus
        setUpLayer()
        
        btn = btnMMinus
        setUpLayer()
        
        btn = btnCos
        setUpLayer()
        
        btn = btnTg
        setUpLayer()
        
        btn = btnSinh
        setUpLayer()
        
        btn = btnCosh
        setUpLayer()
        
        btn = btnTgh
        setUpLayer()
        
        setButton(x: 0.01 * screenWidth, y: 0.53 * screenHeight, btn: btnGraphEqual)
        
        setButton(x: 0.91, y: 0, btn: graphics)
        
        setButton(x: 0, y: 0, btn: soundOn)
        setButton(x: 0, y: 0, btn: soundOff)
        
        setButton(x: 0.01 * screenWidth, y: 0.31 * screenHeight, btn: btnDot)
        setButton(x: 0.01 * screenWidth, y: 0.53 * screenHeight, btn: btnEqual)
        
        setButton(x: 0.06 * screenWidth, y: 0.12 * screenHeight, btn: btn0)
        setButton(x: 0.13 * screenWidth, y: 0.24 * screenHeight, btn: btn1)
        setButton(x: 0.19 * screenWidth, y: 0.41 * screenHeight, btn: btn2)
        setButton(x: 0.13 * screenWidth, y: 0.58 * screenHeight, btn: btn3)
        setButton(x: 0.06 * screenWidth, y: 0.7 * screenHeight, btn: btn4)
        
        setButton(x: 0.14 * screenWidth, y: 0.02 * screenHeight, btn: btnAdd)
        setButton(x: 0.21 * screenWidth, y: 0.14 * screenHeight, btn: btnMinus)
        setButton(x: 0.27 * screenWidth, y: 0.3 * screenHeight, btn: btnMul)
        setButton(x: 0.27 * screenWidth, y: 0.52 * screenHeight, btn: btnDiv)
        setButton(x: 0.21 * screenWidth, y: 0.67 * screenHeight, btn: btnMod)
        setButton(x: 0.14 * screenWidth, y: 0.79 * screenHeight, btn: btnFact)
        
        setButton(x: 0.91 * screenWidth, y: 0.31 * screenHeight, btn: btnC)
        setButton(x: 0.91 * screenWidth, y: 0.53 * screenHeight, btn: btnBack)
        
        setButton(x: 0.86 * screenWidth, y: 0.12 * screenHeight, btn: btn5)
        setButton(x: 0.79 * screenWidth, y: 0.24 * screenHeight, btn: btn6)
        setButton(x: 0.73 * screenWidth, y: 0.41 * screenHeight, btn: btn7)
        setButton(x: 0.79 * screenWidth, y: 0.58 * screenHeight, btn: btn8)
        setButton(x: 0.86 * screenWidth, y: 0.71 * screenHeight, btn: btn9)
        
        setButton(x: 0.78 * screenWidth, y: 0.02 * screenHeight, btn: btnSqrt)
        setButton(x: 0.71 * screenWidth, y: 0.14 * screenHeight, btn: btnPow)
        setButton(x: 0.65 * screenWidth, y: 0.3 * screenHeight, btn: btnLeftBracket)
        setButton(x: 0.65 * screenWidth, y: 0.52 * screenHeight, btn: btnRightBracket)
        setButton(x: 0.71 * screenWidth, y: 0.67 * screenHeight, btn: btnLog)
        setButton(x: 0.78 * screenWidth, y: 0.79 * screenHeight, btn: btnLn)
        
        
        setButton(x: 0.37 * screenWidth, y: 0.02 * screenHeight, btn: btnRand)
        setButton(x: 0.46 * screenWidth, y: 0.02 * screenHeight, btn: btnPi)
        setButton(x: 0.55 * screenWidth, y: 0.02 * screenHeight, btn: btnE)
        
        setButton(x: 0.32 * screenWidth, y: 0.79 * screenHeight, btn: btnMClean)
        setButton(x: 0.41 * screenWidth, y: 0.79 * screenHeight, btn: btnMRead)
        setButton(x: 0.51 * screenWidth, y: 0.79 * screenHeight, btn: btnMPlus)
        setButton(x: 0.6 * screenWidth, y: 0.79 * screenHeight, btn: btnMMinus)
        
        setButton(x: 0.37 * screenWidth, y: 0.59 * screenHeight, btn: btnSin)
        setButton(x: 0.46 * screenWidth, y: 0.59 * screenHeight, btn: btnCos)
        setButton(x: 0.55 * screenWidth, y: 0.59 * screenHeight, btn: btnTg)
        
        setButton(x: 0.41 * screenWidth, y: 0.41 * screenHeight, btn: btnSinh)
        setButton(x: 0.51 * screenWidth, y: 0.41 * screenHeight, btn: btnCosh)
        
        setButton(x: 0.46 * screenWidth, y: 0.24 * screenHeight, btn: btnTgh)
    }
}
