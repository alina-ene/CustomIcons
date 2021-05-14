//
//  IconsService.swift
//  CustomIcons
//
//  Created by Alina Ene on 14/05/2021.
//

import Foundation

final class IconsService: ObservableObject {
    
    @Published var icons = [Icon]()
    
    func fetchIcons() {
        
        if let localData = self.readLocalFile(forName: "data") {
            self.parse(jsonData: localData)
        }
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(Icons.self,
                                                       from: jsonData)
            icons = decodedData.icons
            print("Description: ", decodedData)
        } catch {
            print("decode error")
        }
    }
    
}
