//
//  CharactersViewCollection.swift
//  RickAndMortySurf
//
//  Created by Максим Зыкин on 17.07.2024.
//

import UIKit

class CharactersCollectionView: UIViewController {

   lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeLayout()
    )
    
    private var viewModel: CharactersCollectionViewControllerModelProtocol! {
        didSet {
            viewModel.fetchCharacters {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        viewModel = CharactersCollectionViewControllerModel()
        collectionView.dataSource = self
        setup()
        setupNavigationBar()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(363),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(96))
        
       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        }

    private func setup() {
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.cellID)
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupNavigationBar() {
        title = "Rick & Morty"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarApperanse = UINavigationBarAppearance()
        navBarApperanse.configureWithOpaqueBackground()
        navBarApperanse.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarApperanse.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarApperanse.backgroundColor = .black
        
        navigationController?.navigationBar.standardAppearance = navBarApperanse
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApperanse
    }
}

extension CharactersCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.cellID, for: indexPath) as! CharactersCollectionViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
}
 
extension CharactersCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DetailView()
        let info = viewModel.viewModelForSelectedRow(at: indexPath)
        
        detail.namePerson.text = info.nameLabel
        DispatchQueue.global().async {
            guard let imageData = info.image else { return }
            DispatchQueue.main.async {
                detail.imagePerson.image = UIImage(data: imageData)
            }
        }
        detail.statusPerson.text = info.statusLabel
        detail.speciesPerson.text = info.speciesLabel
        detail.genderPerson.text = info.genderLabel
        detail.originPerson.text = info.locationLabel
        detail.name = info.nameLabel
        
        navigationController?.pushViewController(detail, animated: true)
    }
}
