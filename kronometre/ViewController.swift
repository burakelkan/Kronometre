//
//  ViewController.swift
//  kronometre
//
//  Created by Yusuf Burak Elkan on 2.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var saat: UILabel!
    @IBOutlet weak var basla: UILabel!
    
    var saniye = 0
    var saat1 = Timer()
    var git = false
    var durdur1 = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func deis(_ sender: UIButton) {
        self.editButtonItem.title = "burak"
    }
    @IBAction func başlat(_ sender: UIButton) {
        self.editButtonItem.title = "burak"
        if git == false{
          runtimer()
        }
    }
    
    func runtimer(){
       saat1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        git = true
   }

    @IBAction func durdur(_ sender: UIButton) {
       
        if self.durdur1 == false{
            saat1.invalidate()
            self.durdur1 = true
            basla.text = String("Başla")
        }else{
            runtimer()
            self.durdur1 = false
            basla.text = String("Dur")
        }
    }
    
    @IBAction func sifirla(_ sender: UIButton) {
        saat1.invalidate()
        saniye = 0
        saat.text = timeString(time: TimeInterval(saniye))
        git = false
    }
    

    @objc func updateTimer(){
    if saniye < 0{
        saat1.invalidate()
    }else{
        saniye += 1
        saat.text = timeString(time: TimeInterval(saniye))
    }
}
    func timeString(time:TimeInterval)-> String{
        let saatler = Int(time) / 3600
        let dakika = Int(time) / 60 % 60
        let saniye = Int(time) % 60
        return String(format: "%02i:%02i:%02i", saatler, dakika, saniye)
    }
    func viewDidload(){
        super.viewDidLoad()
    }
}
