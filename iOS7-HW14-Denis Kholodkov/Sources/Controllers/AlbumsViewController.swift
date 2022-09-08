//
//  ThirdTabBarController.swift
//  iOS7-HW14-Denis Kholodkov
//
//  Created by Денис Холодков on 06.09.2022.
//

import UIKit

class AlbumsViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier)
           collectionView.register(FirstCell.self, forCellWithReuseIdentifier: FirstCell.identifier)
       //    collectionView.register(SecondCell.self, forCellWithReuseIdentifier: SecondCell.identifier)
       //    collectionView.register(ThirdCell.self, forCellWithReuseIdentifier: ThirdCell.identifier)
       //    collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.identifier)
           navigationController?.navigationBar.prefersLargeTitles = true
           collectionView.translatesAutoresizingMaskIntoConstraints = false
           collectionView.delegate = self
           collectionView.dataSource = self
           return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Альбомы"
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy(){
        view.addSubview(collectionView)
    }

    private func setupLayout(){
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
           return UICollectionViewCompositionalLayout { sectionIndex, _ in

               switch sectionIndex {
               case 0:
                   let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                         heightDimension: .fractionalHeight(1))

                   let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                   layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 0)

                   let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200),
                                                          heightDimension: .absolute(470))

                   let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                  // layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)

                   let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                   layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                   layoutSection.orthogonalScrollingBehavior = .groupPaging

                   return layoutSection
//               case 1:
//                   let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                         heightDimension: .fractionalHeight(1))
//                   let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//                   layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
//
//                   let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                          heightDimension: .absolute(44))
//                   let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
//
//                   let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//                   layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 10, bottom: 50, trailing: 10)
//
//                   return layoutSection
               default:
                   let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                         heightDimension: .fractionalHeight(1))
                   let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                   layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)

                   let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                                          heightDimension: .fractionalWidth(1 / 1.8 * 2))
                   let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                   layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)

                   let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                   layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                   layoutSection.orthogonalScrollingBehavior = .groupPaging

                   return layoutSection
               }
           }
       }
   }

extension AlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Model.arrayModels.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.arrayModels[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCell.identifier, for: indexPath) as? FirstCell else { return UICollectionViewCell()}
            cell.configuration(model: Model.arrayModels[indexPath.section][indexPath.row])
         return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCell.identifier, for: indexPath) as? FirstCell else { return UICollectionViewCell()}
            cell.configuration(model: Model.arrayModels[indexPath.section][indexPath.row])
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch indexPath.section {
        case 0:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else { return UICollectionReusableView() }
            header.labelTitle.text = "Мои альбомы"
            header.labelRaightTitle.text = "Все"
            return header
        default:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else { return UICollectionReusableView() }
            header.labelTitle.text = "Мои альбомы"
            header.labelRaightTitle.text = "Все"
            return header
        }
    }
}
