//
//  TabBarController.swift
//  iOS7-HW14-Denis Kholodkov
//
//  Created by Денис Холодков on 06.09.2022.
//

import UIKit

class TabBarController: UITabBarController {

// MARK:- Varibles

    private var firstScrenBarIcon = UITabBarItem(title: "First",
                                                image: UIImage(systemName: "house"),
                                                selectedImage: UIImage(systemName: "house.fill"))
    private var secondScreenBarIcon = UITabBarItem(title: "Second",
                                                 image: UIImage(systemName: "trash"),
                                                 selectedImage: UIImage(systemName:"trash.fill"))
    private var thirdScreenBarIcon = UITabBarItem(title: "Third",
                                                         image: UIImage(systemName: "square.and.arrow.up"),
                                                         selectedImage: UIImage(systemName: "square.and.arrow.up.fill"))
    private var fourthScreenBarIcon = UITabBarItem(title: "Fourth",
                                                          image: UIImage(systemName: "folder"),
                                                          selectedImage: UIImage(systemName: "folder .fill"))

    override func viewDidLoad(){
        super.viewDidLoad()
      //  tabBarController
        setupTabBarController()
        setupTabBarViewControllers()
    }

    func setupTabBarController() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
    }


    func makeTabBarElements(controller: UIViewController, icon: UITabBarItem) -> UIViewController {
        controller.tabBarItem = icon
        return controller
    }

    func setupTabBarViewControllers() {

        let first = makeTabBarElements(controller: FirstViewController(), icon: firstScrenBarIcon)
        let second = makeTabBarElements(controller: SecondViewController(), icon: secondScreenBarIcon)
        let third = makeTabBarElements(controller: ThirdViewController(), icon: thirdScreenBarIcon)
        let fourth = makeTabBarElements(controller: FourthViewController(), icon: fourthScreenBarIcon)


            let controllers = [first, second, third, fourth]
            self.setViewControllers(controllers, animated: true)
    }
}
