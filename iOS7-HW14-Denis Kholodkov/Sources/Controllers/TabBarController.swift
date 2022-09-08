//
//  TabBarController.swift
//  iOS7-HW14-Denis Kholodkov
//
//  Created by Денис Холодков on 06.09.2022.
//

import UIKit

class TabBarController: UITabBarController {

// MARK:- Varibles

    private var mediaLibraryScrenBarIcon = UITabBarItem(title: "Медиатека",
                                                image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                                selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
    private var forYouScreenBarIcon = UITabBarItem(title: "Для Вас",
                                                 image: UIImage(systemName: "heart.text.square.fill"),
                                                 selectedImage: UIImage(systemName:"heart.text.square.fill"))
    private var albumsScreenBarIcon = UITabBarItem(title: "Альбомы",
                                                         image: UIImage(systemName: "rectangle.stack.fill"),
                                                         selectedImage: UIImage(systemName: "rectangle.stack.fill"))
    private var searchScreenBarIcon = UITabBarItem(title: "Поиск",
                                                          image: UIImage(systemName: "magnifyingglass"),
                                                          selectedImage: UIImage(systemName: "magnifyingglass"))

    override func viewDidLoad(){
        super.viewDidLoad()
        setupTabBarController()
        setupTabBarViewControllers()
    }

    func setupTabBarController() {
        tabBar.tintColor = .systemBlue 
        tabBar.backgroundColor = .white
    }


    func makeTabBarElements(controller: UIViewController, icon: UITabBarItem) -> UIViewController {
        controller.tabBarItem = icon
        return controller
    }

    func setupTabBarViewControllers() {
        let mediaLibrary = makeTabBarElements(controller: MediaLibraryViewController(), icon: mediaLibraryScrenBarIcon)
        let forYou = makeTabBarElements(controller: ForYouViewController(), icon: forYouScreenBarIcon)
        let albums = makeTabBarElements(controller: AlbumsViewController(), icon: albumsScreenBarIcon)
        let search = makeTabBarElements(controller: SearchViewController(), icon: searchScreenBarIcon)

            let controllers = [mediaLibrary, forYou, albums, search]
            self.setViewControllers(controllers, animated: true)
    }
}
