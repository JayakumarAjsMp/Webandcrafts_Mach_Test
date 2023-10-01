//
//  HomeViewModel.swift
//  Shopping
//
//  Created by INI SYSTEMS on 01/10/23.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var shoppingHomeData: ShoppingHome?
    
    private var cancellable: AnyCancellable?
    
    func fetchHomeData() {
        let apiManager = APIManager.default
        apiManager.fetchDataFromAPI(api: "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0", completion: { data, error in
            if let error = error {
                print("Fetch error \(error)")
            } else if let data = data {
                do {
                    let decodedObject = try JSONDecoder().decode(ShoppingHome.self, from: data)
                    DispatchQueue.main.async {
                        self.shoppingHomeData = decodedObject
                    }
                } catch let error {
                    print("Decode error \(error)")
                }
            }
        })
    }
    
}

class ImageCaching {
    
    private var cachedImage = [URL: UIImage]()
    
    func cachingImage(image: UIImage, for url: URL) {
        cachedImage[url] = image
    }
    
    func image(for url: URL) -> UIImage? {
        return cachedImage[url]
    }
    
}

class ImageDownloadManager {
    
    private let imageCached = ImageCaching()
    
    func downloadImage(from urlString: String?) async throws -> UIImage {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            throw NSError(domain: "InvalidImageURL", code: 0)
        }
        if let catchedImage = imageCached.image(for: url) {
            return catchedImage
        }
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "InvalidImageData", code: 1)
        }
        imageCached.cachingImage(image: image, for: url)
        return image
    }
    
}
