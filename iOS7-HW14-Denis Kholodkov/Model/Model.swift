//
//  Model.swift
//  iOS7-HW14-Denis Kholodkov
//
//  Created by Денис Холодков on 08.09.2022.
//

import Foundation

struct Model {
    var image: String
    var label: String
    var labelNumber: String
}

extension Model {
    static var arrayModels = [
        [Model(image: "photo2", label: "Недавние", labelNumber: "000"),
         Model(image: "photo3", label: "Избранные", labelNumber: "000"),
         Model(image: "photo4", label: "Instagram", labelNumber: "000"),
         Model(image: "photo5", label: "WhatsApp", labelNumber: "000"),
         Model(image: "photo6", label: "SnapChat", labelNumber: "000"),
         Model(image: "photo7", label: "Skype", labelNumber: "000"),]
    ]
}
