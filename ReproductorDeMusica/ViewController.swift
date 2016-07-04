//
//  ViewController.swift
//  ReproductorDeMusica
//
//  Created by Avril  Hernández on 29/06/16.
//  Copyright © 2016 AHB. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var portada: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    var nombreCancion: String! = ""
    var extensionCancion: String! = ""
    
    var canciones : Array<Array<String>> = Array<Array<String>>()
    
    //Manejador
    private var reproductor :  AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        canciones.append(["I love me - Meghan trainor"])
        canciones.append(["Clumsy - Fergie"])
        canciones.append(["Hey Jude - Glee Cast"])
        canciones.append(["Counting Stars - One Republic"])
        canciones.append(["Ça plane pour moi - Plastic Bertrand"])
        canciones.append(["Light it up - Major Lazer"])
        self.titulo.text = ""
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return canciones.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.canciones[row][0]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       reproduceCancion(row)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func play() {
        if titulo.text! != ""{
            if !reproductor.playing{
                reproductor.play()
            }
        }
    }

    @IBAction func pause() {
        if titulo.text! != ""{
            if reproductor.playing{
                reproductor.pause()
            }
        }
    }
    
    @IBAction func stop() {
        if titulo.text! != ""{
            if reproductor.playing{
                reproductor.stop()
                reproductor.currentTime = 0.0
            }
        }
    }
    
    @IBAction func shuffle() {
        let cancion = Int(arc4random()) % 6
        reproduceCancion(cancion)
    }
    
    @IBAction func volumen(sender: UISlider) {
        reproductor.volume = sender.value
    }
    
    func reproduceCancion(numeroCancion: Int){
        
        switch numeroCancion{
        case 0:
            nombreCancion = "I Love Me"
            extensionCancion = "mp3"
            self.titulo.text = "I Love Me"
            self.portada.image = UIImage(named: "iloveme")
        case 1:
            nombreCancion = "Clumsy"
            extensionCancion = "mp3"
            self.titulo.text = "Clumsy"
            self.portada.image = UIImage(named: "clumsy")
        case 2:
            nombreCancion = "Hey Jude"
            extensionCancion = "mp3"
            self.titulo.text = "Hey Jude"
            self.portada.image = UIImage(named: "gleeBeatles")
        case 3:
            nombreCancion = "Counting Stars"
            extensionCancion = "mp3"
            self.titulo.text = "Counting Stars"
            self.portada.image = UIImage(named: "native")
        case 4:
            nombreCancion = "Ça plane pour moi"
            extensionCancion = "mp3"
            self.titulo.text = "Ça plane pour moi"
            self.portada.image = UIImage(named: "planePourMoi")
        case 5:
            nombreCancion = "Light It Up"
            extensionCancion = "mp3"
            self.titulo.text = "Light It Up"
            self.portada.image = UIImage(named: "lightitup")
        default:
            print("default")
        }
        
        let cancionURL = NSBundle.mainBundle().URLForResource(nombreCancion, withExtension: extensionCancion)
        
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: cancionURL!)
            reproductor.play()
        }catch{
            print("Error al cargar el archivo de la canción.")
        }
    }
    
}

