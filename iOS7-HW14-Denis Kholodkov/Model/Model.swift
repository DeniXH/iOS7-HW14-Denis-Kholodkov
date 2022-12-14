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
         Model(image: "photo7", label: "Skype", labelNumber: "000")],

        [Model(image: "photo_people", label: "Недавние", labelNumber: "000"),
         Model(image: "photo3", label: "Избранные", labelNumber: "000"),
         Model(image: "photo4", label: "Instagram", labelNumber: "000"),
         Model(image: "photo5", label: "WhatsApp", labelNumber: "000")],

        [Model(image: "video", label: "Видео", labelNumber: "000"),
         Model(image: "person.crop.square", label: "Селфи", labelNumber: "000"),
         Model(image: "livephoto", label: "Фото Live Photos", labelNumber: "000"),
         Model(image: "cube", label: "Портреты", labelNumber: "000"),
         Model(image: "timelapse", label: "Таймлапс", labelNumber: "000"),
         Model(image: "slowmo", label: "Замедленно", labelNumber: "000"),
         Model(image: "camera.viewfinder", label: "Снимки экрана", labelNumber: "000")],

        [Model(image: "square.and.arrow.down", label: "Импортированные", labelNumber: "000"),
         Model(image: "eye.slash", label: "Скрытые", labelNumber: "000"),
         Model(image: "trash", label: "Недавно удалённые", labelNumber: "000")]
    ]
}
