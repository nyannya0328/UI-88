//
//  Home.swift
//  UI-88
//
//  Created by にゃんにゃん丸 on 2020/12/29.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var model : CaroselViewModel
    
    var width = UIScreen.main.bounds.width
    @Namespace var animation
    var body: some View {
        
        ZStack{
            VStack{
                
                HStack{
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                        
                        
                        
                    })
                    
                    Text("Text")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.leading)
                    
                    Spacer()
                }
                
                .padding()
                ZStack{
                    
                    ForEach(model.cards.indices.reversed(),id:\.self){index in
                        
                        HStack{
                            CardView(card: model.cards[index], animation: animation)
                                .frame(width: getWidth(index: index), height: getHight(index: index))
                              
                                .offset(x: getoffset(index: index))
                                .rotationEffect(.init(degrees: getcardRotation(index: index)))
                            
                            Spacer(minLength: 0)
                            
                        }
                        .frame(height: 400)
                        .contentShape(Rectangle())
                        .offset(x: model.cards[index].offset)
                        .gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
                            onChange(value: value, index: index)
                            
                           
                           
                        }).onEnded({ (value) in
                            onEnd(value: value, index: index)
                        }))
                      
                        
                    }
                    
                }
                .padding(.top,25)
                .padding(.horizontal,30)
                
                Button(action: ResetView, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.green)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                       
                })
                .padding(.top,55)
                
                
                
                
                Spacer()
            }
            
            if model.showcard{
                
              DetailView(animation: animation)
            }
        
        }
       
    }
    
    func ResetView(){
        for index in model.cards.indices{
            
            withAnimation(.spring()){
                
                model.cards[index].offset = 0
                model.swipedcard = 0
            }
            
        }
        
        
    }
    
    func getcardRotation(index :Int) -> Double{
        
        let boxwidth = Double(width / 3)
        let offset = Double(model.cards[index].offset)
        let angle : Double = 5
        
        return (offset / boxwidth) * angle
        
        
    }
    func onChange(value:DragGesture.Value,index : Int){
        
        if value.translation.width < 0{
            model.cards[index].offset = value.translation.width
           
                  
        }
        
        
    }
    func onEnd(value:DragGesture.Value,index : Int){
        
        withAnimation{
            if -value.translation.width > width / 3{
                
                model.cards[index].offset = -width
                model.swipedcard += 1
                
            }
            else{model.cards[index].offset = 0}
             
        }
        
        
        
        
    }
    
    
    
    
    func getHight(index : Int) -> CGFloat{
        
        let height : CGFloat = 400
        let cardheight = index-model.swipedcard <= 2 ? CGFloat(index - model.swipedcard) * 35 : 70
        return height - cardheight
        
        
    }
    
    func getWidth(index : Int) -> CGFloat{
        let boxwidth = UIScreen.main.bounds.width - 60 - 60
      
        return boxwidth
        
        
    }
    
    func getoffset(index : Int) -> CGFloat{
        return index-model.swipedcard <= 2 ? CGFloat(index - model.swipedcard) * 30 : 60
     
        
    
        
    }
}

