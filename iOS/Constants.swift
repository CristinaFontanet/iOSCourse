//
//  Constants.swift
//  Exemple xaxi guai d'arxiu de constants
//
//  Created by Miguel Berrocal Gómez on 20/01/16.
//

import Foundation
import UIKit


struct Constants {
    
    struct Server { //Constants de la màquina
        
        static let baseHost = "http://mySuperServer"
        static let port = ":3000"
        static let baseURL = baseHost+port
    }
    
    struct EndPoints { //Constants de la API
        
        struct Reviews {
            static let baseURL = Constants.Server.baseURL+"/reviews/"
        }
        
        struct RelatedItems {
            static let baseURL = Constants.Server.baseURL+"/relatedItems/"
        }
    }

    struct Colors { //Constants de Colors
        
        struct Reviews {
            static let positiveReviewStarColor = UIColor(red: 100.0/255.0, green: 184.0/255.0, blue: 99.0/255.0, alpha: 1.0)
            static let neutralReviewStarColor = UIColor(red: 205.0/255.0, green: 144.0/255.0, blue: 32.0/255.0, alpha: 1.0)
            static let negativeReviewStarColor = UIColor(red: 196.0/255.0, green: 90.0/255.0, blue: 70.0/255.0, alpha: 1.0)
        }
        
        static let headerColor = UIColor(red: 0.0/255.0, green: 44.0/255.0, blue: 74.0/255.0, alpha: 1.0)
    }
}

//Exemple per accedir

Constants.Colors.headerColor
Constants.EndPoints.Reviews.baseURL