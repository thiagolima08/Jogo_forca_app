//
//  Forca.swift
//  Jogo Forca
//
//  Created by Thiago da Silva Lima on 08/05/21.
//

import Foundation

class Forca {
    var palavra: Array<Character>
    var status: Array<Character>
    var dica: String
    var tentativas: Int
    var letrasDigitadas: Array<Character>
    
    init(palavra: String, dica: String) {
        self.palavra = Array(palavra.lowercased())
        self.dica = dica
        self.tentativas = 0
        self.letrasDigitadas = Array()
        self.status = Array(repeating: "_", count: self.palavra.count)
    }
    
    func jogadaValida(letra: Character) -> Bool {
            return !self.letrasDigitadas.contains(letra) && self.palavra.contains(letra) && self.tentativas < 10
        }
        
    func jogar(letra: Character){
            if (self.jogadaValida(letra: letra)){
                self.letrasDigitadas.append(letra)
                for i in 0..<self.palavra.count{
                    if (self.palavra[i] ==  letra){
                        self.status[i] = letra
                    }
                }
            }else{
                self.tentativas += 1
            }
        }
        
    func terminou() -> Bool {
            return self.palavra == self.status || self.tentativas >= 10
        }
        
    func resultado() -> String {
            if (self.terminou()){
                if (self.palavra == self.status){
                    return "Ganhou"
                }else{
                    return "Perdeu"
                }
            }else{
                return "Jogo não terminou"
            }
        }
    
}
