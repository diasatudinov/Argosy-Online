
import SwiftUI

struct ArgosyMainMenu: View {
    @State private var showGame = false
    @State private var showShop = false
    @State private var showAchievement = false
    @State private var showMiniGames = false
    @State private var showSettings = false
    
    @StateObject var achievementVM = AchievementsViewModelSG()
    @StateObject var settingsVM = OxfordgamesSettingsViewModel()
    //    @StateObject var shopVM = OxfordgamesStoreViewModel()
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 15) {
                HStack(alignment: .top) {
                    
                    
                    Spacer()
                    
                    OxfordgamesCoinBg()
                    
                    
                }
                
                Spacer()
                
                Button {
                    showGame = true
                } label: {
                    Image(.playIconArgosy)
                        .resizable()
                        .scaledToFit()
                        .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 210:105)
                }
                
                Button {
                    showShop = true
                } label: {
                    Image(.shopIconArgosy)
                        .resizable()
                        .scaledToFit()
                        .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 210:105)
                }
                
                Button {
                    showAchievement = true
                } label: {
                    Image(.achievementsIconArgosy)
                        .resizable()
                        .scaledToFit()
                        .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 210:105)
                }
                
                Button {
                    showSettings = true
                } label: {
                    Image(.settingsIconArgosy)
                        .resizable()
                        .scaledToFit()
                        .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 210:105)
                }
                
                
                Button {
                    showMiniGames = true
                } label: {
                    Image(.miniGamesIconArgosy)
                        .resizable()
                        .scaledToFit()
                        .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 160:80)
                }
                
                Spacer()
                
            }.padding()
            
        }
        .background(
            ZStack {
                Image(.appBgArgosy)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
        )
        .fullScreenCover(isPresented: $showGame) {
            //            OxfordgamesChooseLevelView(shopVM: shopVM)
        }
        .fullScreenCover(isPresented: $showMiniGames) {
            //            OxfordgamesMiniGamesView()
        }
        .fullScreenCover(isPresented: $showAchievement) {
            AchievementsViewSG(viewModel: achievementVM)
        }
        .fullScreenCover(isPresented: $showShop) {
            //            OxfordgamesStoreView(viewModel: shopVM)
        }
        .fullScreenCover(isPresented: $showSettings) {
            OxfordgamesSettingsView(settingsVM: settingsVM)
        }
        
        
        
        
    }
    
}

#Preview {
    ArgosyMainMenu()
}
