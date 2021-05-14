//
//  IconsService.swift
//  CustomIcons
//
//  Created by Alina Ene on 14/05/2021.
//

import Foundation

final class IconsService: ObservableObject {
    
    @Published var icons = [Icon]()
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchIcons() {
        fetchRemoteIcons { (icons: Icons?) in
            DispatchQueue.main.async {
                if let list = icons {
                    self.icons = list.icons
                } else {
                    self.fetchLocalIcons()
                }
            }
        }
    }
    
    func fetchRemoteIcons(completion: @escaping ((Icons?) -> Void)) {
        networkService.loadJson(fromURLString: "https://irapps.github.io/wzpsolutions/tests/ios-custom-icons/IconsData.json") {  (result: Result<Icons, Error>) in
            switch result {
            case .success(let icons):
                completion(icons)
            case .failure(let error):
                print("Request failed: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
    func fetchLocalIcons() {
        if let localData = self.readLocalFile(forName: "data") {
            if let list: Icons = networkService.parse(jsonData: localData) {
                icons = list.icons
            }
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
    
}
