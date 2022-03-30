//
//  SubjectView.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import SwiftUI
import Firebase
import CodeScanner

struct SubjectView: View {
    
    @StateObject var vm = SubjectVM()
    @State var isForgotPasswordScreenIsActive = false
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
                                    
                                    vm.isShowingScanner = true
                                    
                                }){
                                    
                                    Image("VIP")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                }
                        
                                Text("QR Code Scanned Success")
                                    .foregroundColor(Color.gray)
                                    .font(.footnote)
                            }
                            
                            CustomLabelAndNotEditableTextField(labelTxt:"QR", valueText: $vm.qrCode)
                                .disabled(true)
                            CustomLabelAndNotEditableTextField(labelTxt:"Name", valueText: $vm.name)
                         
                            
                            Button(action: {
                                
                                vm.saveUserInDataBase()
                                
                            }){
                                
                                Text("Add Book")
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .frame(width: 220, height: 48)
                                    .background(colorBackground)
                                    .cornerRadius(24)
                            }
                            
                            NavigationLink(destination:
                                            ViewBooksVC()
                                           , isActive: $isForgotPasswordScreenIsActive){
                                
                            Button(action: {
                                
                                isForgotPasswordScreenIsActive.toggle()
                               // vm.saveUserInDataBase()
                                
                            }){
                                
                                Text("View Added Books")
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .frame(width: 220, height: 48)
                                    .background(colorBackground)
                                    .cornerRadius(24)
                            }
                            
                        }
                            
                            Spacer()
                            
                        }
                        .frame(minHeight: geometry.size.height)
                        .padding(.all,20)
                        
                        
                    }
                    .frame(width: geometry.size.width)
                }
            }//VStack
            
            CustomAlert(isShowAlert: $vm.isShowAlert, alertTitle: vm.alertTitle, alertMessage:vm.alertMessage)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        
        .sheet(isPresented: $vm.isShowingScanner) {
            CodeScannerView(codeTypes: [.qr], simulatedData: "Paul hudson\npaul@hackingwithswift.com", completion: vm.handleScan)
            
        }
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView()
    }
}
