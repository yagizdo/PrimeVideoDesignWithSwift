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
    
    var sliderImages = ["familyguyslider","bobsburgersslider","theboysslider","jackryanslider"]
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageSliderCollectionView.delegate = self
        imageSliderCollectionView.dataSource = self
        imageSliderCollectionView.isPagingEnabled = true
        
        let cellDesign = UICollectionViewFlowLayout()
        
        cellDesign.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        cellDesign.minimumLineSpacing = 0
        cellDesign.minimumInteritemSpacing = 0
        cellDesign.scrollDirection = .horizontal
        
        let screenWidth = UIScreen.main.bounds.width
        
        let cellWidth = (screenWidth) / 1
        
        cellDesign.itemSize = CGSize(width: cellWidth, height: cellWidth)
        
        imageSliderCollectionView.collectionViewLayout = cellDesign
        
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex:CGFloat = self.imageSliderCollectionView.contentOffset.x / self.imageSliderCollectionView.frame.size.width
           pageDots.currentPage = Int(currentIndex)
        self.imageIndex = Int(currentIndex)
    }
    
    
}
