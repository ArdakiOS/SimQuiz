//
//  QuizVM.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//

import Foundation

class QuizVM : ObservableObject {
    @Published var lvl1 : [QuizModel] = [QuizModel(prg: 1,
                                                   questions: [
                                                    questionModel(question: "Money is recommended:",
                                                                  answers: [
                                                                    "to save for a \"rainy day\"",
                                                                    "immediately spend",
                                                                    "to lend at interest",
                                                                    "invest to generate income"],
                                                                  correctAns: "invest to generate income"),
                                                    questionModel(question: "The optimal amount of money saved:",
                                                                  answers: [
                                                                    "10%-40% of monthly income",
                                                                    "50% of monthly income",
                                                                    "maximum savings",
                                                                    "more than 50% of monthly income"]
                                                                  , correctAns: "10%-40% of monthly income"),
                                                    questionModel(question: "The concept of \"risky currencies\" means:"
                                                                  , answers: [
                                                                    "currencies of the exporting countries of raw materials",
                                                                    "currencies of developing countries",
                                                                    "currencies whose issue does not meet international standards",
                                                                    "currencies whose banknotes do not have the maximum degree of protection"]
                                                                  , correctAns: "currencies of the exporting countries of raw materials"),
                                                    questionModel(question: "What is the main task of assigning the Stoploss level?",
                                                                  answers: [
                                                                    "to get additional profit",
                                                                    "limit risks",
                                                                    "open a deal",
                                                                    "all three options are correct" ]
                                                                  , correctAns: "limit risks"),
                                                    questionModel(question: "Before making a deal, you need to know:"
                                                                  , answers: [
                                                                    "the price at which you need to close the deal when making a profit",
                                                                    "the price at which it is necessary to close the transaction when receiving losses",
                                                                    "maximum working time of the transaction",
                                                                    "all the answers are correct"]
                                                                  , correctAns: "all the answers are correct")
                                                   ]),
                                         QuizModel(prg: 1,
                                                   questions: [
                                                    questionModel(question: "Market participants who are interested in lowering the value of the currency of the currency are called:",
                                                                  answers: [
                                                                    "owls",
                                                                    "bears",
                                                                    "hares",
                                                                    "bulls"
                                                                  ],
                                                                  correctAns: "bears"),
                                                    questionModel(question: "The protective currency is:",
                                                                  answers: [
                                                                    "a currency that has comprehensive protection against counterfeiting",
                                                                    "currency backed by gold",
                                                                    "a currency that strengthens during periods of anxiety and uncertainty in the market",
                                                                    "the currency held on a bank deposit"
                                                                  ],
                                                                  correctAns: "a currency that strengthens during periods of anxiety and uncertainty in the market"),
                                                    questionModel(question: "The amount of investment in the Lamm account:",
                                                                  answers: [
                                                                    "depends on the terms of the offer",
                                                                    "can be any",
                                                                    "at least $1,000",
                                                                    "no more than $5,000"
                                                                  ],
                                                                  correctAns: "depends on the terms of the offer"
                                                                 ),
                                                    questionModel(question: "The income of a broker working under the agency model is:",
                                                                  answers: [
                                                                    "the loss of the client",
                                                                    "percentage of the client's profit",
                                                                    "spread and swap",
                                                                    "all of the above"
                                                                  ],
                                                                  correctAns: "spread and swap"
                                                                 ),
                                                    questionModel(question: "The strongest fundamental factor in the Forex market is considered to be:",
                                                                  answers: [
                                                                    "macroeconomic statistics",
                                                                    "monetary policy of the world's central banks",
                                                                    "statements of political figures",
                                                                    "all factors are equivalent"
                                                                  ],
                                                                  correctAns: "monetary policy of the world's central banks"
                                                                 ),
                                                   ]),
                                         QuizModel(prg: 1,
                                                   questions: [
                                                    questionModel(question: "The divergence of monetary policies is called:",
                                                                  answers: [
                                                                    "escalation",
                                                                    "differential",
                                                                    "convergence",
                                                                    "divergence"
                                                                  ],
                                                                  correctAns: "divergence"
                                                                 ),
                                                    questionModel(question: "When hedging, a reverse position is opened to",
                                                                  answers: [
                                                                    "get a buy signal",
                                                                    "get a sell signal",
                                                                    "protect the main transaction",
                                                                    "fix the main transaction"
                                                                  ],
                                                                  correctAns: "protect the main transaction"
                                                                 ),
                                                    questionModel(question: "Which sessions are the most aggressive?",
                                                                  answers: [
                                                                    "American and Asian",
                                                                    "American and European",
                                                                    "Asian and European",
                                                                    "Australian and Japanese"
                                                                  ],
                                                                  correctAns: "American and European"
                                                                 ),
                                                    questionModel(question: "What is the main task of the Takeprofit level post-promotion?",
                                                                  answers: [
                                                                    "to get additional profit",
                                                                    "limit risks",
                                                                    "close the deal",
                                                                    "all three options are correct"
                                                                  ],
                                                                  correctAns: "close the deal"
                                                                 ),
                                                    questionModel(question: "What does not apply to the main postulates of technical analysis?",
                                                                  answers: [
                                                                    "prices depend on supply and demand",
                                                                    "history repeats itself",
                                                                    "asset price movements take into account all factors",
                                                                    "prices move in a directional way"
                                                                  ],
                                                                  correctAns: "prices depend on supply and demand"
                                                                 ),
                                                   ]),
                                         QuizModel(prg: 1,
                                                   questions: [
                                                    questionModel(question: "What are the tools of mathematical analysis of the Forex market called?",
                                                                  answers: [
                                                                    "technical indicators",
                                                                    "fundamental indicators",
                                                                    "forecast values",
                                                                    "mixed values"
                                                                  ],
                                                                  correctAns: "technical indicators"
                                                                 ),
                                                    questionModel(question: "What is the main principle of the Forex market?",
                                                                  answers: [
                                                                    "stock exchange",
                                                                    "currency sale",
                                                                    "exchange of one currency for another",
                                                                    "all the answers are correct"
                                                                  ],
                                                                  correctAns: "exchange of one currency for another"
                                                                 ),
                                                    questionModel(question: "The price offered by the market maker for the purchase is called:",
                                                                  answers: [
                                                                    "Bid",
                                                                    "Ask",
                                                                    "lot",
                                                                    "shoulder"
                                                                  ],
                                                                  correctAns: "Bid"
                                                                 ),
                                                    questionModel(question: "Which regional market is not part of Forex?",
                                                                  answers: [
                                                                    "European",
                                                                    "American",
                                                                    "Australian",
                                                                    "Japanese"
                                                                  ],
                                                                  correctAns: "Japanese"
                                                                 ),
                                                    questionModel(question: "What is the name of a standard contract in the Forex market?",
                                                                  answers: [
                                                                    "pot",
                                                                    "notes",
                                                                    "shoulder",
                                                                    "lot"
                                                                  ],
                                                                  correctAns: "lot"
                                                                 )]
                                                  )
    ]
    @Published var totalPrg = 1
    
    init() {
        load()
    }
    
    func save() {
        let encoder = JSONEncoder()
        do {
            let encodedData = try encoder.encode(lvl1)
            UserDefaults.standard.setValue(encodedData, forKey: "lvl")
        }
        catch {
            print("Error in QUIZVM Encoder")
        }
        
        UserDefaults.standard.setValue(totalPrg, forKey: "lvlPrg")
    }
    
    func load() {
        let decoder = JSONDecoder()
        do{
            if let encodedData = UserDefaults.standard.data(forKey: "lvl"){
                let decodedData = try decoder.decode([QuizModel].self, from: encodedData)
                DispatchQueue.main.async {
                    self.lvl1 = decodedData
                    self.totalPrg = UserDefaults.standard.integer(forKey: "lvlPrg")
                }
            }
        }
        catch{
            print("Error in QUIZVM Decoder")
        }
        
    }
    
}


