//
//  LikesCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by Тимур Ахметов on 11.05.2022.
//

import Foundation
import UIKit
import SDWebImage

class LikesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "LikesCollectionViewCell"
    
    private let checkMark: UIImageView = {
       let image = UIImage(named: "checkMark")
        let imageView = UIImageView(image: image)
        imageView.alpha = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    var myImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override var isSelected: Bool {
        didSet {
            updateSelectedState()
        }
    }
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"] 
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            myImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupImageView()
        updateSelectedState()
       
        setupCheckmarkImage()
    }
    
    func setupImageView() {
        addSubview(myImageView)
        myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        myImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func set(photo: UnsplashPhoto) {
        let photoUrl = photo.urls["full"]
        guard let photoURL = photoUrl, let url = URL(string: photoURL) else { return }
        myImageView.sd_setImage(with: url, completed: nil)
    }
    
    private func setupCheckmarkImage() {
        addSubview(checkMark)
        checkMark.bottomAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: -8).isActive = true
        checkMark.trailingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: -8).isActive = true
    }
    
    private func updateSelectedState() {
        myImageView.alpha = isSelected ? 0.7 : 1
        checkMark.alpha = isSelected ? 1 : 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
