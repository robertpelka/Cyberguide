//
//  Constants.swift
//  Cyberguide
//
//  Created by Robert Pelka on 10/12/2020.
//

struct K {
    struct Segues {
        static let loginSegue = "LoginToMain"
        static let registerSegue = "RegisterToMain"
    }
    struct Colors {
        static let yellow = "BrandYellow"
        static let blue = "BrandBlue"
        static let red = "BrandRed"
    }
    struct Firestore {
        static let collectionName = "advices"
        static let textField = "advice"
        static let votesField = "votes"
    }
    struct Cell {
        static let cellIdentifier = "ReusableCell"
        static let cellNibName = "AdviceCell"
    }
}
