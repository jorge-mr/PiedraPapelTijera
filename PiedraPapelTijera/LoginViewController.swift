//
//  LoginViewController.swift
//  PiedraPapelTijera
//
//  Created by Jorge MR on 30/08/17.
//  Copyright © 2017 Lab Informatica Biomedica. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var jugadorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Para ocultar el teclado
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pasaNombre"{
            let destinationViewController = segue.destination as! ViewController
            if let nombreJugador = jugadorTextField.text{
                destinationViewController.nombreJugador = nombreJugador
            }else{
                destinationViewController.nombreJugador = "Jugador"
            }
        }
    }
    
    func dismissKeyboard() {
        jugadorTextField.resignFirstResponder()
    }
    
    //Agregar el delegado en la cabecera
    //Agregar el delegate con clicderecho en el textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

}
