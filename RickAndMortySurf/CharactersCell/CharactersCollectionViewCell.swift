//
//  CharactersCollectionViewCell.swift
//  RickAndMortySurf
//
//  Created by Максим Зыкин on 17.07.2024.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
   
    static let cellID = "charactersCell"
    
    var viewC: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        return view
    }()
    
    let image = UIImageView()
    
    var name: UILabel! = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = ""
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    var statusPerson = CustomLabel(text: "", size: 12, numberOfLines: 2, font: .bold)
    var species = CustomLabel(text: "", size: 12, color: .white, font: .bold)
    var gender = CustomLabel(text: "", size: 12, color: .white, font: .regular)
    
    var viewModel: CharactersCollectionViewModelCellProtocol! {
        didSet {
            self.name.text = viewModel.name
            self.statusPerson.text = viewModel.statusPerson
            if statusPerson.text == "Alive" {
                statusPerson.textColor = UIColor(red: 71/255, green: 198/255, blue: 11/22, alpha: 255/255)
            } else if statusPerson.text == "Dead" {
                statusPerson.textColor = .red
            } else {
                statusPerson.textColor = .darkGray
            }
            
            self.gender.text = viewModel.gender
            self.species.text = viewModel.species
            DispatchQueue.global().async {
                guard let imageData = self.viewModel.image else { return }
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        image.frame = CGRect(x: 12, y: 15, width: 84, height: 64)
    }

    private func setupUI() {
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        
        contentView.addSubview(viewC)
        contentView.addSubview(image)
        contentView.addSubview(name)
        contentView.addSubview(statusPerson)
        contentView.addSubview(species)
        contentView.addSubview(gender)
    
        
        viewC.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        statusPerson.translatesAutoresizingMaskIntoConstraints = false
        species.translatesAutoresizingMaskIntoConstraints = false
        gender.translatesAutoresizingMaskIntoConstraints = false

        viewC.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        viewC.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        viewC.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewC.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        image.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

        name.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        name.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 100).isActive = true
        name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        statusPerson.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10).isActive = true
        statusPerson.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 100).isActive = true
        statusPerson.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        species.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10).isActive = true
        species.leadingAnchor.constraint(equalTo: statusPerson.leadingAnchor, constant: 40).isActive = true
        
        gender.topAnchor.constraint(equalTo: statusPerson.bottomAnchor, constant: 10).isActive = true
        gender.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 100).isActive = true
        gender.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
    }
}
