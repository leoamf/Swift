import Foundation
import Kitura
import SwiftyJSON
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
 

public let projectPath = ConfigurationManager.BasePath.project.path
public let health = Health()

public class App {
    let router = Router()
    let cloudEnv = CloudEnv()
    var compras : [Int:Compra]  = [:]
    var indice = 1
    
    public init() throws {
        router.all(middleware:BodyParser())
        // Run the metrics initializer
        initializeMetrics(router: router)
    }

    func postInit() throws {
        // Endpoints
        initializeHealthRoutes(app: self)
        
        router.post("/compra") {
            request, response, next in
            if let data = request.body?.asJSON,
                let compra = Compra(json:data){
                let chave = self.indice
                self.indice += 1
                compra.id = chave
                self.compras[chave] = compra
                response.send(JSON(compra.asMap()).description)
            }
            next()
        }
        
        
        router.put("/compra/:id") {
            request, response, next in
            if let chaveStr = request.parameters["id"],
                let chave = Int(chaveStr),
                let data = request.body?.asJSON,
                let compra = Compra(json:data) {
                self.compras[chave] = compra
                response.send(JSON(compra.asMap()).description)
            }
            next()
        }
        
        router.delete("/compra/:id") {
            request, response, next in
            if let chaveStr = request.parameters["id"],
                let chave = Int(chaveStr) {
                let compra = self.compras[chave]
                self.compras[chave] = nil
                response.send(JSON(compra?.asMap() ?? [:]).description)
            }
            next()
        }
        
        router.get("/compra") {
            request, response, next in
            var result: [Any] = []
            for valor in self.compras.values{
                result.append(valor.asMap())
            }
            response.send(JSON(result).description)
            next()
        }
    }

    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: cloudEnv.port, with: router)
        Kitura.run()
    }
}
