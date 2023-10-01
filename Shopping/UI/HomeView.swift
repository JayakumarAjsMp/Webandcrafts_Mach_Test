//
//  HomeView.swift
//  Shopping
//
//  Created by INI SYSTEMS on 01/10/23.
//

import SwiftUI

var designWidth: CGFloat = 375
var designHeight: CGFloat = 812
var screenWidth = UIScreen.main.bounds.size.width
var screenHeight = UIScreen.main.bounds.size.height

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    @State private var search = ""
    @State private var shoppingHomeData: ShoppingHome?
    
    var body: some View {
        ZStack {
            if shoppingHomeData != nil {
                VStack {
                    HStack {
                        Image.search
                            .resizable()
                            .frame(width: 20*screenHeight/designHeight, height: 20*screenHeight/designHeight)
                            .foregroundColor(Color.gray)
                        TextField("Search", text: $search)
                        Image.scanner
                            .resizable()
                            .frame(width: 20*screenHeight/designHeight, height: 20*screenHeight/designHeight)
                            .foregroundColor(Color.gray)
                    }
                    .padding(.horizontal, 10*screenWidth/designWidth)
                    .frame(height: 60*screenHeight/designHeight)
                    .background(
                        Color.background
                    )
                    .shadow(radius: 1)
                    .padding(.horizontal, 20*screenWidth/designWidth)
                    .padding(.top, 30*screenHeight/designHeight)
                    Group {
                        if let categories = viewModel.shoppingHomeData?.homeData?.first(where: { $0.type?.caseInsensitiveCompare("category") == .orderedSame })?.values {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(categories, id: \.id) { category in
                                        Button(action: {
                                            
                                        }) {
                                            VStack {
                                                ZStack {
                                                    Circle()
                                                        .foregroundColor(Color.random().opacity(0.4))
                                                    AsyncImageView(url: category.imageURL)
                                                        .frame(width: 36*screenHeight/designHeight, height: 36*screenHeight/designHeight)
                                                }
                                                Text(category.name ?? "")
                                                    .font(.sfProDisplayMedium(13*screenHeight/designHeight))
                                            }
                                        }
                                        .frame(width: 70*screenHeight/designHeight, height: 70*screenHeight/designHeight)
                                    }
                                }
                            }
                        }
                        if let banners = viewModel.shoppingHomeData?.homeData?.first(where: { $0.type?.caseInsensitiveCompare("banners") == .orderedSame })?.values {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(banners, id: \.self) { banner in
                                        Button(action: {
                                            
                                        }) {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 6)
                                                    .foregroundColor(Color.background)
                                                AsyncImageView(url: banner.bannerURL)
                                            }
                                        }
                                        .frame(width: 330*screenWidth/designWidth, height: 180*screenHeight/designHeight)
                                    }
                                }
                            }
                        }
                        if let products = viewModel.shoppingHomeData?.homeData?.first(where: { $0.type?.caseInsensitiveCompare("products") == .orderedSame })?.values {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(products, id: \.self) { product in
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 6)
                                                .foregroundColor(Color.background)
                                            .shadow(radius: 1)
                                            VStack {
                                                HStack {
                                                    if let offer = product.offer, offer > 0 {
                                                        ZStack {
                                                            Rectangle()
                                                                .fill(Color.red)
                                                            Text("\(offer)% OFF")
                                                                .font(.sfProDisplayBold(10*screenWidth/designWidth))
                                                                .foregroundColor(.background)
                                                        }
                                                        .frame(width: 46*screenWidth/designWidth, height: 12*screenHeight/designHeight)
                                                    }
                                                    Spacer()
                                                    Button(action: {
                                                        
                                                    }) {
                                                        Image.heart
                                                            .resizable()
                                                            .foregroundColor(Color.gray)
                                                    }
                                                    .frame(width: 16*screenHeight/designHeight, height: 16*screenHeight/designHeight)
                                                    .padding(.horizontal, 6*screenWidth/designWidth)
                                                }
                                                .padding(.vertical, 8*screenHeight/designHeight)
                                                AsyncImageView(url: product.image)
                                                    .frame(width: 90*screenHeight/designHeight, height: 90*screenHeight/designHeight)
                                                VStack(alignment: .leading, spacing: 0) {
                                                    Group {
                                                        HStack {
                                                            ZStack {
                                                                Rectangle()
                                                                    .fill(Color.yellow)
                                                                Image.truck
                                                                    .resizable()
                                                                    .foregroundColor(Color.black)
                                                                    .padding(2*screenHeight/designHeight)
                                                            }
                                                            .frame(width: 16*screenWidth/designWidth, height: 16*screenHeight/designHeight)
                                                            Spacer()
                                                        }
                                                        .padding(.vertical,  10*screenHeight/designHeight)
                                                        Text(product.actualPrice ?? "")
                                                            .strikethrough()
                                                            .font(.sfProDisplayRegular(12*screenWidth/designWidth))
                                                            .foregroundColor(.gray)
                                                        Text(product.offerPrice ?? "")
                                                            .font(.sfProDisplayBold(15*screenWidth/designWidth))
                                                        Text(product.name ?? "")
                                                            .font(.sfProDisplayRegular(12*screenWidth/designWidth))
                                                            .minimumScaleFactor(0.14)
                                                            .frame(height: 34*screenHeight/designHeight)
                                                            .lineLimit(2)
                                                            .foregroundColor(.gray)
                                                    }
                                                    .padding(.horizontal, 20*screenWidth/designWidth)
                                                }
                                                Spacer()
                                                Button(action: {
                                                    
                                                }) {
                                                    Text("ADD")
                                                        .foregroundColor(.background)
                                                }
                                                .frame(width: 112*screenWidth/designWidth, height: 30*screenHeight/designHeight)
                                                .background(Color.green)
                                                .cornerRadius(4*screenHeight/designHeight)
                                                Spacer()
                                            }
                                        }
                                        .padding(5*screenHeight/designHeight)
                                        .frame(width: 160*screenWidth/designWidth, height: 286*screenHeight/designHeight)
                                        .padding(.vertical, 10*screenHeight/designHeight)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 6*screenWidth/designWidth)
                    .padding(.top, 10*screenHeight/designHeight)
                    Spacer()
                    HStack {
                        Button(action: {
                            
                        }) {
                            HStack {
                                Spacer()
                                VStack {
                                    Image.home
                                        .resizable()
                                        .frame(width: 16*screenHeight/designHeight, height: 16*screenHeight/designHeight)
                                    Text("Home")
                                        .font(.sfProDisplaySemiBold(10*screenWidth/designWidth))
                                }
                                Spacer()
                            }
                        }
                        .foregroundColor(.black)
                        Button(action: {
                            
                        }) {
                            HStack {
                                Spacer()
                                VStack {
                                    Image.categories
                                        .resizable()
                                        .frame(width: 16*screenHeight/designHeight, height: 16*screenHeight/designHeight)
                                    Text("Categories")
                                        .font(.sfProDisplaySemiBold(10*screenWidth/designWidth))
                                }
                                Spacer()
                            }
                        }
                        Button(action: {
                            
                        }) {
                            HStack {
                                Spacer()
                                VStack {
                                    Image.offer
                                        .resizable()
                                        .frame(width: 16*screenHeight/designHeight, height: 16*screenHeight/designHeight)
                                    Text("Offers")
                                        .font(.sfProDisplaySemiBold(10*screenWidth/designWidth))
                                }
                                Spacer()
                            }
                        }
                        Button(action: {
                            
                        }) {
                            HStack {
                                Spacer()
                                VStack {
                                    Image.cart
                                        .resizable()
                                        .frame(width: 16*screenHeight/designHeight, height: 16*screenHeight/designHeight)
                                    Text("Cart")
                                        .font(.sfProDisplaySemiBold(10*screenWidth/designWidth))
                                }
                                Spacer()
                            }
                        }
                        Button(action: {
                            
                        }) {
                            HStack {
                                Spacer()
                                VStack {
                                    Image.account
                                        .resizable()
                                        .frame(width: 16*screenHeight/designHeight, height: 16*screenHeight/designHeight)
                                    Text("Account")
                                        .font(.sfProDisplaySemiBold(10*screenWidth/designWidth))
                                }
                                Spacer()
                            }
                        }
                    }
                    .foregroundColor(.gray)
                }
            } else {
                VStack {
                    Spacer()
                    Text("Loading ...")
                    Spacer()
                }
            }
        }
        .foregroundColor(.black)
        .onChange(of: viewModel.shoppingHomeData, perform: { newValue in
            shoppingHomeData = newValue
        })
        .onAppear {
            viewModel.fetchHomeData()
        }
        .background(Color.background.edgesIgnoringSafeArea(.all))
    }
    
}

struct AsyncImageView: View {
    
    let url: String?
    
    let imageDownloader = ImageDownloadManager()
    
    @State private var image: UIImage?
    
    var body: some View {
        ZStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            }
        }
        .onAppear {
            Task {
                do {
                    image = try await imageDownloader.downloadImage(from: url)
                } catch {
                    print(error)
                }
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
