//
//  ViewController.swift
//  Jogo Forca
//
//  Created by Thiago da Silva Lima on 08/05/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var lbDica: UILabel!
    @IBOutlet weak var lbQtdLetras: UILabel!
    @IBOutlet weak var lbLetrasDigitadas: UILabel!
    @IBOutlet weak var lbTentativas: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var tfLetra: UITextField!
    var forca: Forca!
    @IBOutlet weak var ivImagemForca: UIImageView!
    
    @IBAction func jogar(_ sender: Any) {
        let letra = Character(self.tfLetra.text!)
        self.forca.jogar(letra: letra)
        self.atualizar()
        if (self.forca.terminou()){
            let rvc = self.storyboard?.instantiateViewController(identifier: "view_resultado") as! ResultadoViewController
                   rvc.resultado = self.forca.resultado()
            self.present(rvc, animated: true, completion: nil)
            self.zerar()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.forca = Forca(palavra: "THIAGO", dica: "NOME")
        self.atualizar()
    }
    
    func zerar(){
        self.forca.tentativas = 0;
        self.tfLetra.text = "";
        self.forca.letrasDigitadas = Array();
        self.atualizar()
    }
    
    func atualizar() {
        self.lbDica.text = self.forca.dica
        self.lbQtdLetras.text = "Quantidade: \(self.forca.palavra.count) letras."
        self.lbLetrasDigitadas.text = String(self.forca.letrasDigitadas)
        self.lbTentativas.text = "Tentativas restantes: \(10 - self.forca.tentativas)"
        self.atualizarImagem()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(true)
            self.atualizar()
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(true)
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(true)
        }
    
    func atualizarImagem() {
        switch self.forca.tentativas {
            case 10:
                self.ivImagemForca.image = UIImage(named: "10")
            case 9:
                self.ivImagemForca.image = UIImage(named: "9")
            case 8:
                self.ivImagemForca.image = UIImage(named: "8")
            case 7:
                self.ivImagemForca.image = UIImage(named: "7")
            case 6:
                self.ivImagemForca.image = UIImage(named: "6")
            case 5:
                self.ivImagemForca.image = UIImage(named: "5")
            case 4:
                self.ivImagemForca.image = UIImage(named: "4")
            case 3:
                self.ivImagemForca.image = UIImage(named: "3")
            case 2:
                self.ivImagemForca.image = UIImage(named: "2")
            case 1:
                self.ivImagemForca.image = UIImage(named: "1")
            default:
                self.ivImagemForca.image = UIImage(named: "0")
            }
        }
    
}

