//
//  ParsingData.swift
//  HydrangeaGB
//
//  Created by KKK on 15.05.2022.
//
import UIKit

class ParsingDataJson {
    
    private let fileName = "Hydrangea"
    
    static let instance = ParsingDataJson()
    private init(){}
    
    
    func getInfoFile() -> Data? {
        guard
            let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: bundlePath), options: .mappedIfSafe)
        else { logging("Error"); return nil }
        
        return jsonData
        
    }
    
    
     func parseJSON(jsonData: Data) -> HydrangeaModel? {
        do {
            var data = try JSONDecoder().decode(HydrangeaModel.self, from: jsonData)
            data.lists.sort(by: { $0.name < $1.name })
            return data
        } catch {
            logging("Error JSONDecoder : \(error)")
        }
        return nil
    }
    
}
