//
//  ProfileView.swift
//  NIBMParking
//
//  Created by Shanuri Vimansa on 2021-11-15.
//

import SwiftUI
import RappleProgressHUD

struct ProfileView: View {
    
    @StateObject var vm = ProfileVM()
    
    
    
    @State var isLogoutSuccess = false
    
    
    var body: some View {
        
        ZStack {
            //colorBackground
            VStack {
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 20) {
                            
                            Spacer()
                            
                            CustomLabelAndNotEditableTextField(labelTxt:"Name", valueText: $vm.name)
                            CustomLabelAndNotEditableTextField(labelTxt:"Email", valueText: $vm.email)
                            CustomLabelAndNotEditableTextField(labelTxt:"NIC", valueText: $vm.nic)
                            CustomLabelAndNotEditableTextField(labelTxt:"Contact Number", valueText: $vm.contactNumber)
                            CustomLabelAndNotEditableTextField(labelTxt:"Register Number", valueText: $vm.regNo)
                            CustomLabelAndNotEditableTextField(labelTxt:"Vehicle Number", valueText: $vm.vehicleNo)
                            
                            
                      
                                Button(action: {
                                    
                                    vm.logOutCurrentUser { success in
                                        if success{
                                            isLogoutSuccess = true
                                            Authenticated.send(false)
                                        }
                                    }
                                }){
                                    
                                    Text("Log Out")
                                        .foregroundColor(Color.white)
                                        .padding()
                                        .frame(width: 220, height: 48)
                                        .background(colorBackground)
                                        .cornerRadius(24)
                                }
                            
                            Spacer()
                        }
                        .frame(minHeight: geometry.size.height)
                        .padding(.all,20)
                        
                        
                    }
                    .frame(width: geometry.size.width)
                }
            }//VStack
        }//Ztsack
        .onAppear{
            RappleActivityIndicatorView.startAnimating()
            vm.getUserData { status in
                RappleActivityIndicatorView.stopAnimation()
                if status{
                    print("success")
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
