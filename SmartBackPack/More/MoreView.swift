//
//  MoreView.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import SwiftUI

struct MoreView: View {
    @StateObject var vm = MoreVM()
    @State var isBookindViewIsActive = false
    @State var isReminderViewIsActive = false
    
    
    var body: some View {
        ZStack {
            //colorBackground
            VStack {
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 20) {
                            
                            Spacer()
                            
                            NavigationLink(destination:
                                            ProfileView()
                                           , isActive: $isBookindViewIsActive){
                                
                                ProductCard(imageString: "VIP", textString: "Profile")
                                    .onTapGesture {
                                        print("profile")
                                        isBookindViewIsActive.toggle()
                                    }
                            }
                            
                            //                            ProductCard(imageString: "VIP", textString: "Modify Password")
                            //                                .onTapGesture {
                            //                                    print("profile")
                            //                                }
                            //                            ProductCard(imageString: "VIP", textString: "About Us")
                            //                                .onTapGesture {
                            //                                    print("profile")
                            //                                }
                            
                            NavigationLink(destination:
                                            ReminderView()
                                           , isActive: $isReminderViewIsActive){
                                
                                ProductCard(imageString: "VIP", textString: "Edit Reminder")
                                    .onTapGesture {
                                        isReminderViewIsActive.toggle()
                                        print("profile")
                                    }
                            }
                            
      
                                
                                ProductCard(imageString: "VIP", textString: "Log out")
                                    .onTapGesture {
                                        vm.logOutCurrentUser { status in
                                            print("")
                                        }
                                    }
                                
                            
                            
                            
                            Spacer()
                            
                            
                        }
                        .padding(.all,20)
                        .frame(minHeight: geometry.size.height)
                    }
                    .frame(width: geometry.size.width)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
