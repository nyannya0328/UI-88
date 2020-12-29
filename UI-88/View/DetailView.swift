//
//  DetailView.swift
//  UI-88
//
//  Created by にゃんにゃん丸 on 2020/12/29.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var model : CaroselViewModel
    var animation : Namespace.ID
    var body: some View {
        ZStack{
            VStack{
                
                
                Text("Monday 29 Dec")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white.opacity(0.8))
                    .padding()
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .shadow(radius: 5)
                    .padding(.top,10)
                    .matchedGeometryEffect(id: "Date\(model.selectedcolor.id)", in: animation)
                
                
                HStack{
                    
                  
                    Text(model.selectedcolor.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 250, alignment: .leading)
                        .matchedGeometryEffect(id: "Text\(model.selectedcolor.id)", in: animation)
                    
                    
                    
                }
                
                if model.showcontent{
                    
                    Text(model.content)
                        .font(.system(size: 50, weight: .heavy))
                        .foregroundColor(.yellow)
                        .padding(.top,35)
                       
                    
                }
               
        
                
                Spacer(minLength: 0)
                
                
                
                
                
                
            }
            
            
            
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            
            model.selectedcolor.cardcolor
                .cornerRadius(25)
                .matchedGeometryEffect(id: "bgcolor\(model.selectedcolor.id)", in: animation)
                .ignoresSafeArea(.all, edges: .bottom)
                )
        
        VStack{
            
            Spacer(minLength: 0)
            
            if model.showcontent{
                
                Button(action: closeView, label: {
                    Image(systemName: "arrow.down")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.purple)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .clipShape(Circle())
                        .padding(5)
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                    
                })
                .padding(.bottom,5)
                
            }
            
            
        }
    
}
    
    func closeView(){
        withAnimation(.spring()){
            model.showcard.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                withAnimation(.easeIn){
                    
                    
                    model.showcontent = false
                    
                }
            
            
        }
        
       
        
        
        
        
        
    }
    }
}
