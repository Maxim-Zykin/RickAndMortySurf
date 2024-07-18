//
//  DetailView.swift
//  RickAndMortySurf
//
//  Created by Максим Зыкин on 17.07.2024.
//

import UIKit

class DetailView: UIViewController {
    
    var character: RickAndMorty!
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let viewStatusPerson: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4834849834, green: 0.4850062132, blue: 0.5295128226, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()
    
     var imagePerson: UIImageView = {
         var image = UIImageView()
         image.frame.size = CGSize(width: 320, height: 320)
         image.layer.cornerRadius = 16
         image.layer.masksToBounds = true
         return image
    }()
    
    var name = ""
    
    var namePerson = CustomLabel(text: "", textAlignment: .center, size: 18, color: .white, font: .bold)
    
    var statusPerson = CustomLabel(text: "", textAlignment: .center, size: 18, color: .white, font: .regular)
    
    var speciesPerson = CustomLabel(text: "", size: 18, color: .white, font: .regular)
    
    var genderPerson = CustomLabel(text: "", size: 18, color: .white, font: .regular)
    
    var originPerson = CustomLabel(text: "", size: 18, color: .white, font: .regular)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        colorStatusPerson()
        title = name
    }
    
    private func colorStatusPerson() {
        if statusPerson.text == "Alive" {
            viewStatusPerson.backgroundColor = #colorLiteral(red: 0.08092453331, green: 0.5874572992, blue: 0.2782821953, alpha: 1)
        } else if statusPerson.text == "Dead" {
            viewStatusPerson.backgroundColor = #colorLiteral(red: 0.8392156863, green: 0.137254902, blue: 0, alpha: 1)
        } else {
            viewStatusPerson.backgroundColor = #colorLiteral(red: 0.4834849834, green: 0.4850062132, blue: 0.5295128226, alpha: 1)
        }
    }
    
    private func setupUI() {
        
        view.backgroundColor = .black
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            ])
    
        self.view.addSubview(viewStatusPerson)
        self.view.addSubview(imagePerson)
        self.view.addSubview(namePerson)
        self.view.addSubview(statusPerson)
        self.view.addSubview(speciesPerson)
        self.view.addSubview(genderPerson)
        self.view.addSubview(originPerson)

        
        namePerson.translatesAutoresizingMaskIntoConstraints = false
        imagePerson.translatesAutoresizingMaskIntoConstraints = false
        statusPerson.translatesAutoresizingMaskIntoConstraints = false
        speciesPerson.translatesAutoresizingMaskIntoConstraints = false
        genderPerson.translatesAutoresizingMaskIntoConstraints = false
        originPerson.translatesAutoresizingMaskIntoConstraints = false
        viewStatusPerson.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            imagePerson.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imagePerson.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            imagePerson.widthAnchor.constraint(equalToConstant: 320),
            imagePerson.heightAnchor.constraint(equalToConstant: 320),
            
            viewStatusPerson.topAnchor.constraint(equalTo: imagePerson.bottomAnchor, constant: 20),
            viewStatusPerson.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            viewStatusPerson.widthAnchor.constraint(equalToConstant: 320),
            viewStatusPerson.heightAnchor.constraint(equalToConstant: 42),
        
            statusPerson.centerYAnchor.constraint(equalTo: viewStatusPerson.centerYAnchor),
            statusPerson.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            statusPerson.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            speciesPerson.topAnchor.constraint(equalTo: statusPerson.bottomAnchor, constant: 20),
            speciesPerson.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 34),
            speciesPerson.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            genderPerson.topAnchor.constraint(equalTo: speciesPerson.bottomAnchor, constant: 10),
            genderPerson.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 34),
            genderPerson.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            originPerson.topAnchor.constraint(equalTo: genderPerson.bottomAnchor, constant: 10),
            originPerson.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 34),
            originPerson.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            originPerson.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
        ])
    }
}

