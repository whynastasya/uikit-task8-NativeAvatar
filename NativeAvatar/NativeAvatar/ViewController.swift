//
//  ViewController.swift
//  afs
//
//  Created by nastasya on 23.05.2023.
//

import UIKit

class ViewController: UIViewController {

    private let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal))
    private let scrollView = UIScrollView()
    private let hidenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
    }

    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
     
        title = "Native avatar"
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant:  -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
            ])
        view.addSubview(scrollView)
        scrollView.backgroundColor = .black
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 200)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        hidenView.frame = CGRectMake(300, -10, 100, 40)
        hidenView.backgroundColor = .black
        navigationController?.navigationBar.addSubview(hidenView)
        navigationController?.navigationBar.isTranslucent = false
    }
}


private struct Const {
    /// Image height/width for Large NavBar state
    static let ImageSizeForLargeState: CGFloat = 40
    /// Margin from right anchor of safe area to right anchor of Image
    static let ImageRightMargin: CGFloat = 16
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
    static let ImageBottomMarginForLargeState: CGFloat = 12
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
    static let ImageBottomMarginForSmallState: CGFloat = 6
    /// Image height/width for Small NavBar state
    static let ImageSizeForSmallState: CGFloat = 0
    /// Height of NavBar for Small state. Usually it’s just 44
    static let NavBarHeightSmallState: CGFloat = 44

    static let NavBarHeightLargeState: CGFloat = 96.5
}
