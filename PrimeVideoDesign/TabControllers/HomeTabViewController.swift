//
//  HomeTabViewController.swift
//  PrimeVideoDesign
//
//  Created by Yılmaz Yağız Dokumacı on 26.01.2023.
//

import UIKit

class HomeTabViewController: UIViewController {

    
    @IBOutlet weak var imageSliderCollectionView: UICollectionView!
    
    
    @IBOutlet weak var pageDots: UIPageControl!
    
    var sliderImages = ["img1","img1","img1","img1","img1"]
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageSliderCollectionView.delegate = self
        imageSliderCollectionView.dataSource = self
        
        pageDots.numberOfPages = sliderImages.count
        pageDots.currentPage = imageIndex
        
        Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(scrollingSetup), userInfo: nil, repeats: true)
        
    }
    
    @objc func scrollingSetup() {
        
        if imageIndex < sliderImages.count - 1 {
            imageIndex += 1
        } else {
            imageIndex = 0
        }
        
        pageDots.numberOfPages = sliderImages.count
        pageDots.currentPage = imageIndex
        imageSliderCollectionView.scrollToItem(at: IndexPath(item: imageIndex, section: 0), at: .right, animated: true)
    }

}

extension HomeTabViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageSliderCollectionView.dequeueReusableCell(withReuseIdentifier: "imageSliderCell", for: indexPath) as! ImageSliderCellCollectionViewCell
        
        cell.sliderImageView.image = UIImage(named: sliderImages[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
