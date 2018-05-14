//
//  Compra.swift
//  HelloKituraPackageDescription
//
//  Created by aluno on 17/03/18.
//

import Foundation

class Compra{
    var id: Int?
    var valor: Float = 0
    var tipo: String = ""
    var descricao: String = ""
    
    init?(json: [String:Any]){
        if let descricao = json["descricao"] as? String,
            let valor = json["valor"] as? Float,
            let tipo = json["tipo"] as? String{
            self.descricao = descricao
            self.tipo = tipo
            self.valor = valor
        }
        
    }


    func asMap()  -> [String:Any]{
        var map: [String:Any] = [:]
        map["id"] = id
        map["descricao"] = descricao
        map["valor"] = valor
        map["tipo"] = tipo
        return map
    }
    
    
}
