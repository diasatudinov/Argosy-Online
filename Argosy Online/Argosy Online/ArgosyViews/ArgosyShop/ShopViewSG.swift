//
//  ShopViewSG.swift
//  Argosy Online
//
//  Created by Dias Atudinov on 15.05.2025.
//


import SwiftUI


struct ShopViewSG: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var user = OxfordgamesUser.shared
    @State var section: StoreSection = .skin
    @ObservedObject var viewModel: StoreViewModelSG
    @State var skinIndex: Int = 0
    @State var backIndex: Int = 0
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    HStack {
                    }
                    
                    HStack {
                        HStack(alignment: .top) {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                                
                            } label: {
                                Image(.backIconArgosy)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 100:50)
                            }
                            
                            Spacer()
                            
                            OxfordgamesCoinBg()
                            
                        }.padding([.horizontal])
                    }
                }
                
                Image(.shopTextArgosy)
                    .resizable()
                    .scaledToFit()
                    .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 150:75)
                
                ZStack {
                    Image(.skinBgArgosy)
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Button {
                            if skinIndex > 0 {
                                skinIndex -= 1
                            }
                        } label: {
                            Image(.arrowShopArgosy)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 100:50)
                                .scaleEffect(x: -1,y: 1)
                        }
                        Spacer()
                        
                        achievementItem(item: viewModel.shopTeamItems.filter({ $0.section == .skin })[skinIndex])
                        
                        Spacer()
                        
                        Button {
                            if skinIndex < viewModel.shopTeamItems.filter({ $0.section == .skin }).count - 1 {
                                skinIndex += 1
                            }
                        } label: {
                            Image(.arrowShopArgosy)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 100:50)
                            
                        }
                    }.offset(y: 40)
                }.frame(width: OxfordgamesDeviceManager.shared.deviceType == .pad ? 640:320, height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 580:290)
                
                ZStack {
                    Image(.backBgArgosy)
                        .resizable()
                        .scaledToFit()
                    
                    HStack(spacing: 40) {
                        Button {
                            if backIndex > 0 {
                                backIndex -= 1
                            }
                        } label: {
                            Image(.arrowShopArgosy)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 100:50)
                                .scaleEffect(x: -1,y: 1)
                        }
                        
                        Spacer()
                        
                        achievementItem(item: viewModel.shopTeamItems.filter({ $0.section == .backgrounds })[backIndex])
                        
                        Spacer()
                        
                        Button {
                            if backIndex < viewModel.shopTeamItems.filter({ $0.section == .backgrounds }).count - 1 {
                                backIndex += 1
                            }
                        } label: {
                            Image(.arrowShopArgosy)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 100:50)
                        }
                    }.offset(y: OxfordgamesDeviceManager.shared.deviceType == .pad ? 50:40)
                    
                }.frame(width: OxfordgamesDeviceManager.shared.deviceType == .pad ? 640:320, height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 580:290)
            }
        }.background(
            ZStack {
                Image(.appBgArgosy)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
        )
    }
    
    @ViewBuilder func achievementItem(item: Item) -> some View {
        
        
        VStack {
            Image(item.icon)
                .resizable()
                .scaledToFit()
                .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 280:140)
            
            if item.section == .skin {
                if viewModel.boughtItems.contains(where: { $0.name == item.name }) {
                    VStack {
                        Spacer()
                        ZStack {
                            
                            if let currentItem = viewModel.currentPersonItem, currentItem.name == item.name {
                                Image(.arrowShopArgosy)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 100:50)
                                    .rotationEffect(.degrees(90))
                            }
                            
                        }
                    }
                } else {
                    VStack {
                        Spacer()
                        ZStack {
                            Image(.priceArgosy)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 100:50)
                            
                            
                        }
                    }
                }
            } else {
                if viewModel.boughtItems.contains(where: { $0.name == item.name }) {
                    VStack {
                        ZStack {
                            
                            if let currentItem = viewModel.currentBgItem, currentItem.name == item.name {
                                Image(.arrowShopArgosy)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 100:50)
                                    .rotationEffect(.degrees(90))
                            }
                            
                        }
                    }
                } else {
                    VStack {
                        ZStack {
                            Image(.priceArgosy)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 100:50)
                            
                            
                        }
                    }
                }
            }
            
        }.frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 414:207)
            .onTapGesture {
                if item.section == .skin {
                    if viewModel.boughtItems.contains(where: { $0.name == item.name }) {
                        viewModel.currentPersonItem = item
                    } else {
                        if !viewModel.boughtItems.contains(where: { $0.name == item.name }) {
                            
                            if user.money >= item.price {
                                user.minusUserMoney(for: item.price)
                                viewModel.boughtItems.append(item)
                            }
                        }
                    }
                } else {
                    if viewModel.boughtItems.contains(where: { $0.name == item.name }) {
                        viewModel.currentBgItem = item
                    } else {
                        if !viewModel.boughtItems.contains(where: { $0.name == item.name }) {
                            
                            if user.money >= item.price {
                                user.minusUserMoney(for: item.price)
                                viewModel.boughtItems.append(item)
                            }
                        }
                    }
                }
            }
        
        
    }
    
}


#Preview {
    ShopViewSG(viewModel: StoreViewModelSG())
}
