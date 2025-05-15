import SwiftUI

struct OxfordgamesSettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var settingsVM: OxfordgamesSettingsViewModel
    var body: some View {
        ZStack {
            
            VStack {
                
                
                
                ZStack {
                    Image(.settingsBgArgosy)
                        .resizable()
                        .scaledToFit()
                    HStack(spacing: 10) {
                        
                        Button {
                            withAnimation {
                                settingsVM.soundEnabled.toggle()
                            }
                        } label: {
                            
                            Image(settingsVM.soundEnabled ? .soundOnArgosy:.soundOffArgosy)
                                .resizable()
                                .scaledToFit()
                                .frame(width: OxfordgamesDeviceManager.shared.deviceType == .pad ? 200:100, height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 140:70)
                        }
                        
                        
                        Button {
                            withAnimation {
                                settingsVM.musicEnabled.toggle()
                            }
                        } label: {
                            
                            Image(settingsVM.musicEnabled ? .musicOnArgosy:.musicOffArgosy)
                                .resizable()
                                .scaledToFit()
                                .frame(width: OxfordgamesDeviceManager.shared.deviceType == .pad ? 200:100,height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 140:70)
                        }
                        
                        
                    }
                    
                    
                }.frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 342:171)
            }
            VStack {
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
                    }.padding([.horizontal, .top])
                }.padding(.bottom, 40)
                
                Image(.settingsTextArgosy)
                    .resizable()
                    .scaledToFit()
                    .frame(height: OxfordgamesDeviceManager.shared.deviceType == .pad ? 210:105)
                Spacer()
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
    
}

#Preview {
    OxfordgamesSettingsView(settingsVM: OxfordgamesSettingsViewModel())
}
