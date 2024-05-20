//
//  SwiftUIView.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 26.04.2024.
//

import SwiftUI
import Charts

struct GraphView: View {
    @Binding var candleData: [candleGraphModel]
    var body: some View {
        VStack{
            Chart{
                ForEach(candleData.indices, id: \.self){ candle in
                    
                    RectangleMark(x: .value("", candle + 1), yStart: .value("", candleData[candle].open), yEnd: .value("", candleData[candle].close), width: 12)
                        .foregroundStyle(candleData[candle].open < candleData[candle].close ? .green : .red)
                    
                    RectangleMark(x: .value("", candle + 1), yStart: .value("", candleData[candle].low), yEnd: .value("", candleData[candle].high), width: 3)
                        .foregroundStyle(candleData[candle].open < candleData[candle].close ? .green : .red)
                }
            }
            .padding(.trailing)
            .frame(width: 325, height: 220)
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .chartYScale(domain: .automatic(includesZero: false))

        }
    }
}



struct candleGraphModel {
    let open : Int
    let close : Int
    let high : Int
    let low : Int
}
