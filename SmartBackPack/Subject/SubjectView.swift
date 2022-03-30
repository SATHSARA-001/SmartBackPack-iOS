//
//  SubjectView.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import SwiftUI
import Firebase

struct SubjectView: View {
    
    @StateObject var vm = SubjectVM()
    
    var ref: DatabaseReference! = Database.database().reference()
    
    var body: some View {
        
        ZStack{
            //colorBackground
            VStack {
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 20) {
                            
                            Spacer()
                            VStack(alignment: .center, spacing: 5) {
                                
                                
                                Button(action: {
                                    
                                    
                                    
                                }){
                                    
                                    Image("VIP")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                }
                        
                                Text("QR Code Scanned Success")
                                    .foregroundColor(Color.gray)
                                    .font(.footnote)
                            }
                            
                            CustomLabelAndNotEditableTextField(labelTxt:"Name", valueText: $vm.name)
                            CustomLabelAndNotEditableTextField(labelTxt:"QR", valueText: $vm.qrCode)
                            
                            Button(action: {
                                
                                vm.saveUserInDataBase()
                                
                            }){
                                
                                Text("Save")
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
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView()
    }
}
