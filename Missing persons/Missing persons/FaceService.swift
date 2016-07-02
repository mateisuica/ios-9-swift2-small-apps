//
//  FaceService.swift
//  Missing persons
//
//  Created by Matei Suica on 02/07/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import Foundation
import ProjectOxfordFace

class FaceService {
    static let instange = FaceService()
    
    let client = MPOFaceServiceClient(subscriptionKey: "684dbca261ce4d169a7f40ca35772870")
}