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
    
    
     func parseJSON(jsonData: Data) -> HydrangeaList? {
        do {
            let data = try JSONDecoder().decode(HydrangeaList.self, from: jsonData)
            return data
        } catch {
            logging("Error JSONDecoder : \(error)")
        }
        return nil
    }
    
}
