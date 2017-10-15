//
//  ViewController.swift
//  PiedraPapelTijera
//
//  Created by Jorge MR on 29/08/17.
//  Copyright © 2017 Lab Informatica Biomedica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var piedraJugador: UIButton!
    @IBOutlet weak var tijerasJugador: UIButton!
    @IBOutlet weak var papelJugador: UIButton!
    @IBOutlet weak var manoMaquina: UIButton!
    @IBOutlet weak var marcadorJugador: UILabel!
    @IBOutlet weak var marcadorMaquina: UILabel!
    var victorias = 0
    var derrotas = 0
    var nombreJugador = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marcadorJugador.text = nombreJugador + ": 0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func movimiento(_ sender: UIButton) {
        let movJugador = sender.tag
        let movMaquina = Int(arc4random_uniform(3)+1)
        var tituloAlerta = ""
        var mensajeAlerta = ""
        
        print("random -- \(movMaquina) ::  Jugador -- \(movJugador)")
        if movJugador == movMaquina {
            manoMaquina.setTitle(sender.title(for: .normal), for: .normal)
            tituloAlerta = "¡Ops!"
            mensajeAlerta = "Empate"
        }else {
            switch movJugador {
            case 1: //Piedra
                if movMaquina == 2 {
                    manoMaquina.setTitle("✋🏼", for: .normal)
                    tituloAlerta = "¡Tsss!"
                    mensajeAlerta = "Perdiste"
                    derrotas += 1
                }else { //movMaquina == 3
                    manoMaquina.setTitle("✌🏼", for: .normal)
                    tituloAlerta = "¡Woww!"
                    mensajeAlerta = "Ganaste"
                    victorias += 1
                }
                break
            case 2:
                if movMaquina == 1 {
                    manoMaquina.setTitle("👊🏼", for: .normal)
                    tituloAlerta = "¡Woww!"
                    mensajeAlerta = "Ganaste"
                    victorias += 1
                }else{ //movMaquina == 3
                    manoMaquina.setTitle("✌🏼", for: .normal)
                    tituloAlerta = "¡Tsss!"
                    mensajeAlerta = "Perdiste"
                    derrotas += 1
                }
                break
            case 3:
                if movMaquina == 1 {
                    manoMaquina.setTitle("👊🏼", for: .normal)
                    tituloAlerta = "¡Tsss!"
                    mensajeAlerta = "Perdiste"
                    derrotas += 1
                }else { //movMaquina == 2
                    manoMaquina.setTitle("✋🏼", for: .normal)
                    tituloAlerta = "¡Woww!"
                    mensajeAlerta = "Ganaste"
                    victorias += 1
                }
                break
            default:
                break
            }
        }
        
        if sender.tag == 1 { //piedra
            papelJugador.alpha = 0.3
            tijerasJugador.alpha = 0.3
            piedraJugador.alpha = 1.0
            //print("piedra")
            //papelJugador.setTitle("😡", for: .normal)
        }else if sender.tag == 2 { //papel
            papelJugador.alpha = 1.0
            tijerasJugador.alpha = 0.3
            piedraJugador.alpha = 0.3
        }else {//tijeras
            papelJugador.alpha = 0.3
            tijerasJugador.alpha = 1.0
            piedraJugador.alpha = 0.3
        }
        //let movJugador = sender.tag
        /*let movimientoMaquina = 1 //arc4random_uniform(2)+1
        if movimientoMaquina == sender.tag {
            print("empate")
        }else if movimientoMaquina == 1 && movJugador == 3 {
            print("gano")
        }else if movimientoMaquina == 1 && movJugador == 2 {
            print("perdio")
        }*/
        marcadorJugador.text = nombreJugador + ": \(victorias)"
        marcadorMaquina.text = "Máquina: \(derrotas)"
        
        
        let alertController = UIAlertController(title:  tituloAlerta, message: mensajeAlerta, preferredStyle: .alert)  //.actionSheet es para una alerta tipo footer
        //Accion de cancelar para la alerta (botón en alerta)
        //let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        //agregar la accion de cancelar a la alerta
        //alertController.addAction(cancelAction)
       
        //Accion de favorito (boton en alerta)
        let favoriteAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        //Agregar la acción (boton) a la alerta
        alertController.addAction(favoriteAction)
        //Presentar la alerta al usuario
        self.present(alertController, animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

