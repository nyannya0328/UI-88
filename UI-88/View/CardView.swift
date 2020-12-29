//
//  CardView.swift
//  UI-88
//
//  Created by にゃんにゃん丸 on 2020/12/29.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var model : CaroselViewModel
    var card : card
    
    var animation : Namespace.ID
    var body: some View {
        VStack{
            
            Text("Monday 29 Dec")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(Color.white.opacity(0.8))
                .padding()
                .frame(maxWidth: .infinity,alignment: .leading)
                .shadow(radius: 5)
                .padding(.top,10)
                .matchedGeometryEffect(id: "Date\(card.id)", in: animation)
            
            
            HStack{
                
              
                Text(card.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 250, alignment: .leading)
                    .matchedGeometryEffect(id: "Text\(card.id)", in: animation)
                
                Spacer()
                
            }
            .padding()
            
            Spacer(minLength: 0)
            
            HStack{
               
                if !model.showcontent{
                    Spacer(minLength: 0)
                    
                    Text("Read More")
                        Image(systemName: "arrow.right")
                }
                
            }
            .foregroundColor(.white)
            .padding()
            
            
            
            
            
            
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .background(
            
            card.cardcolor.cornerRadius(25)
                .matchedGeometryEffect(id: "bgcolor\(card.id)", in: animation)
                
        
        )
        .onTapGesture {
            withAnimation(.spring()){
                
                model.selectedcolor = card
                model.showcard.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    withAnimation(.easeIn){
                        
                        
                        model.showcontent = true
                        
                    }
                   
                    
                    
                }
                
            }
            
        }
    }
}

