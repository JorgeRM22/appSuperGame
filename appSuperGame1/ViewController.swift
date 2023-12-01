//
//  ViewController.swift
//  appSuperGame1
//
//  Created by Jorge Reyes on 13/11/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var textoNum: UITextField!
    
    @IBOutlet weak var labelMensaje: UILabel!
    
    @IBOutlet weak var labelIntentos: UILabel!
    
    @IBOutlet weak var labelNivel: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var imgLevel: UIImageView!
    
    var numRandom = 0
    var intento = 0
    var Nivel = 0
    var NextLevel: AVAudioPlayer?
    var GameOver: AVAudioPlayer?
    var End: AVAudioPlayer?
    
    //---------------------------------------------------------------------------
    @IBAction func BotonJugar(_ sender: UIButton) {
        //if let numeroIngresado = Int(textoNum.text ?? "") {
        if textoNum.text == String(numRandom) {
                //labelMensaje.text = "¡GANASTE!👏🏻"
            if Nivel < 2{
                Ganaste()
                NextLevel?.play()
            }else{
                JuegoGanado()
                End?.play()
            }
                Nivel+=1
                self.view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            
            let img = UIImage(named: "Ganaste")
            imagen.image = img;
            
            // Reproducir el audio
            /*
            if Nivel < 2{
                NextLevel?.play()
            }else{
                End?.play()
            }
            */
            
        } else if textoNum.text! < String(numRandom) {
                labelMensaje.text = "Pista: El número es mayor. 🤫"
                //alertaMayor()
                intento -= 1
                Fallido()
            } else {
                labelMensaje.text = "Pista: El número es menor. 🤫"
                //alertaMenor()
                intento -= 1
                Fallido()
            }
    }
    //---------------------------------------------------------------------------
    
    //---------------------------------------------------------------------------
    func Fallido() {
        if intento == 0 {
            labelMensaje.text = "PERDISTE!😵"
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.1873934567, blue: 0.1275837123, alpha: 1)
            alerta()
            let perdiste = UIImage(named: "gameover copy")
            imagen.image = perdiste
            GameOver?.play()
            
        } else {
            //labelMensaje.text = "PERDISTE"
            labelIntentos.text = String(intento)
            textoNum.text = ""
        }
    }
    //---------------------------------------------------------------------------
    
    //---------------------------------------------------------------------------
    func alerta(){
        let alerta = UIAlertController(title: "😭PERDISTE🥲", message: "Te quedaste sin vidas💔", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Juega de nuevo", style: .default)
        {
            //(UIAlertAction) in self.inicializar()
            _ in // Se ignora el argumento, ya que no se está utilizando
            if self.Nivel == 0{
                self.inicializar()
            }else if self.Nivel == 1 {
                self.inicializarLevel2()
            }else if self.Nivel == 2{
                self.inicializarLevel3()
            }
        }
        alerta.addAction(jugarOtraVez)
        self.present(alerta, animated: true, completion: nil)
        
    }
    //---------------------------------------------------------------------------
    
    /* No fue practico su uso
    func alertaMenor(){
        let alerta = UIAlertController(title: "🔎Pista🔍", message: "El numero a adivinar es menor", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Ok", style: .default)
        {
            _ in
            //(UIAlertAction) in self.inicializar()
        }
        alerta.addAction(jugarOtraVez)
        self.present(alerta, animated: true, completion: nil)
    }
    
    //Funcion para pista numero mayor
    func alertaMayor(){
        let alerta = UIAlertController(title: "🔎Pista🔍", message: "El numero a adivinar es mayor", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Ok", style: .default)
        {
            _ in
            //(UIAlertAction) in self.inicializar()
        }
        alerta.addAction(jugarOtraVez)
        self.present(alerta, animated: true, completion: nil)
    }
    */
    
    //---------------------------------------------------------------------------
    func Ganaste(){
        let alerta = UIAlertController(title: "Felicitaciones!!", message: "🎉🥳Lo tienes, ve al siguiente nivel!!🎉🥳", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Siguiente nivel", style: .default)
        {
            _ in // Se ignora el argumento, ya que no se está utilizando
            if self.Nivel == 1 {
                self.inicializarLevel2()
            }else if self.Nivel == 2{
                self.inicializarLevel3()
            }else{
                self.inicializar()
            }
        }
        
        alerta.addAction(jugarOtraVez)
        self.present(alerta, animated: true, completion: nil)
    }
    //---------------------------------------------------------------------------
    
    func JuegoGanado(){
        let alerta = UIAlertController(title: "Felicitaciones!!", message: "🎉🥳Has ganado el juego!!🎉🥳", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Jugar de nuevo", style: .default)
        {
            _ in // Se ignora el argumento, ya que no se está
                self.inicializar()
        }
        
        alerta.addAction(jugarOtraVez)
        self.present(alerta, animated: true, completion: nil)
    }
    
    //---------------------------------------------------------------------------
    //Nivel 1
    func inicializar() //Reiniciar o resetear
    {
        
        numRandom = Int(arc4random_uniform(10))
        textoNum.text = ""
        
        intento = 5
        //let emoji = "❤️"
        //let resultado = "Intento " + String(intento) + emoji
        //let mensaje = String(format: " : ", intento, emoji)
        
        labelIntentos.text = String(intento)
        //labelNivel.text = "Nivel #1"
        let imgLev = UIImage(named: "signo")
        imgLevel.image = imgLev
        labelMensaje.text = "Numero del 0-9"
        let img = UIImage(named: "guess")
        imagen.image = img
        let color = UIColor(red: 0.0, green: 0.70, blue: 0.0, alpha: 1.0)
        self.view.backgroundColor = color
    }
    //---------------------------------------------------------------------------
    
    //---------------------------------------------------------------------------
    //Nivel 2
    func inicializarLevel2() //Reiniciar o resetear
    {
        numRandom = Int(arc4random_uniform(11)+10)
        textoNum.text = ""
        intento = 5
        labelIntentos.text = String(intento)
        //labelNivel.text = "Nivel #2"
        let imgLev = UIImage(named: "signo-2")
        imgLevel.image = imgLev
        labelMensaje.text = "Numero del 10-20"
        let img = UIImage(named: "guess")
        imagen.image = img
        let color = UIColor(red: 0.0, green: 0.70, blue: 0.0, alpha: 1.0)
        self.view.backgroundColor = color
    }
    //---------------------------------------------------------------------------
    
    //---------------------------------------------------------------------------
    //Nivel 3
    func inicializarLevel3() //Reiniciar o resetear
    {
        numRandom = Int(arc4random_uniform(21)+10)
        textoNum.text = ""
        intento = 5
        labelIntentos.text = String(intento)
        //labelNivel.text = "Nivel #3"
        let imgLev = UIImage(named: "signo-3")
        imgLevel.image = imgLev
        labelMensaje.text = "Numero del 20-30"
        let color = UIColor(red: 0.0, green: 0.70, blue: 0.0, alpha: 1.0)
        self.view.backgroundColor = color
    }
    //---------------------------------------------------------------------------
    
    func finJuego()
    {
        self.inicializar()
    }
    
    
    //---------------------------------------------------------------------------
    @IBAction func botonOtro(_ sender: UIButton) {
        //inicializar()
        self.viewDidLoad()
    }
    //---------------------------------------------------------------------------
    
    //---------------------------------------------------------------------------
    @IBAction func botonAdios(_ sender: UIButton) {
        UIControl().sendAction(#selector(NSXPCConnection.suspend),to:UIApplication.shared, for: nil)
    }
    //---------------------------------------------------------------------------
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if Nivel == 0{
            inicializar()
        }else if Nivel == 1{
            inicializarLevel2()
        }else if Nivel == 2{
            inicializarLevel3()
        }else{
            finJuego()
        }
        
        
        //Cargar el audio nextlevel
        do {
                if let audioPath = Bundle.main.path(forResource: "nextlevel", ofType: "mp3") {
                    let url = URL(fileURLWithPath: audioPath)
                    NextLevel = try AVAudioPlayer(contentsOf: url)
                }
            } catch {
                print("Error al cargar el archivo de audio")
        }
        
        //Cargar el audio gameover
        do {
            if let audioPath = Bundle.main.path(forResource: "gameover", ofType: "mp3"){
                let url = URL(fileURLWithPath: audioPath)
                GameOver = try AVAudioPlayer(contentsOf: url)
            }
        }catch {
            print("Error al cargar el archivo de audio")
        }
        
        //Cargar audio End
        do {
            if let audioPath = Bundle.main.path(forResource: "end", ofType: "mp3"){
                let url = URL(fileURLWithPath: audioPath)
                End = try AVAudioPlayer(contentsOf: url)
            }
        }catch {
            print("Error al cargar el archivo de audio")
        }
        
        //Animacion del imageview
        /*
        UIView.animate(withDuration: 0.5) {
            self.imagen.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) // Escala a 1.5x
        }
        */
        
    }
    
    
    
    
    
/*

 Tarea domingo
 1) Supergame modificado, utilizando su creatividad
 2) App sobrecarga de operadores
 3) ?
 
*/


}

