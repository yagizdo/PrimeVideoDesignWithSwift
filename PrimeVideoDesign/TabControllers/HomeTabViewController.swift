//
//  HomeTabViewController.swift
//  PrimeVideoDesign
//
//  Created by Yılmaz Yağız Dokumacı on 26.01.2023.
//

import UIKit

class HomeTabViewController: UIViewController {

    @IBOutlet weak var continueWatchCollectionView: UICollectionView!
    
    @IBOutlet weak var imageSliderCollectionView: UICollectionView!
    
    @IBOutlet weak var amazonOriginalsCollectionView: UICollectionView!
    
    @IBOutlet weak var turkishSeriesCollectionView: UICollectionView!
    
    @IBOutlet weak var topMoviesCollectionView: UICollectionView!
    
    @IBOutlet weak var recommendedTVCollectionView: UICollectionView!
    
    
    @IBOutlet weak var pageDots: UIPageControl!
    
    @IBOutlet weak var amazonOriginalsTitle: UILabel!
    
    @IBOutlet weak var turkishSeriesTitle: UILabel!
    
    @IBOutlet weak var topMoviesTitle: UILabel!
    
    
    @IBOutlet weak var recommendedMoviesCollectionView: UICollectionView!
    
    @IBOutlet weak var homeScrollView: UIScrollView!
    
    var sliderImages = ["bobsburgersslider","familyguyslider","theboysslider","americandadthumbnail"]
    var continueWatchThumbnails = ["bobsburgersthumbnail","b99thumbnail","familyguy3","thetestThumbnail","wildcatThumbnail"]
    var amazonOriginalsThumbnails = ["jackryanThumbnail","recepivedik7thumbnail","thetestThumbnail","wildcatThumbnail"]
    var turkishSeriesThumbnails = ["organizeislerthumbnail","dayithumbnail","muslumthumbnail","organizeislerthumbnail"]
    var recommendedMoviesThumbnails = ["tedthumbnail","recepivedik7thumbnail","theofficethumbnail","thetestThumbnail","wildcatThumbnail"]
    var topMoviesThumbnails = ["ironman1thumbnail","americanpsychothumbnail","thewolfwallstreetthumbnail","avengersthumbnail"]
    var recommendedTVThumbnails = ["spongebobthumbnail","theofficethumbnail","b99thumbnail","himymthumbnail"]

    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageSliderCollectionView.delegate = self
        imageSliderCollectionView.dataSource = self
        imageSliderCollectionView.isPagingEnabled = true
        
        continueWatchCollectionView.dataSource = self
        continueWatchCollectionView.delegate = self
        
        amazonOriginalsCollectionView.delegate = self
        amazonOriginalsCollectionView.dataSource = self
        
        turkishSeriesCollectionView.delegate = self
        turkishSeriesCollectionView.dataSource = self
        
        recommendedMoviesCollectionView.dataSource = self
        recommendedMoviesCollectionView.delegate = self
        
        topMoviesCollectionView.delegate = self
        topMoviesCollectionView.dataSource = self
        
        recommendedTVCollectionView.dataSource = self
        recommendedTVCollectionView.delegate = self
        
        updateImageSliderCellLayout()
        updatecontinueWatchCellLayout()
        
        pageDots.numberOfPages = sliderImages.count
        pageDots.currentPage = imageIndex
        
        let arrowImage = UIImage(named:"nextIcon")
    
        amazonOriginalsTitle.add(image: arrowImage!, text: "Amazon Originals and Exclusives",isLeading: false)
        
        turkishSeriesTitle.add(image: arrowImage!, text: "Turkish Movies and Series",isLeading: false)
        
        topMoviesTitle.add(image: arrowImage!, text: "Top Movies",isLeading: false)
        
        Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(scrollingSetup), userInfo: nil, repeats: true)
        
    }
    
    // This code for scroll view
    // Scroll view doesnt scroll without this code
    override func viewWillLayoutSubviews(){
    super.viewWillLayoutSubviews()
    homeScrollView.contentSize = CGSize(width: 375, height: 1200)
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
    
    func updateImageSliderCellLayout() {
        let cellDesign = UICollectionViewFlowLayout()
        
        cellDesign.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        cellDesign.minimumLineSpacing = 0
        cellDesign.minimumInteritemSpacing = 0
        cellDesign.scrollDirection = .horizontal

        imageSliderCollectionView.collectionViewLayout = cellDesign
    }
    
    func updatecontinueWatchCellLayout() {
        let cellDesign = UICollectionViewFlowLayout()
        
        cellDesign.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        cellDesign.minimumLineSpacing = 15
        cellDesign.minimumInteritemSpacing = 0
        cellDesign.scrollDirection = .horizontal
        
        let screenWidth = UIScreen.main.bounds.width
        
        cellDesign.itemSize = CGSize(width: 174, height: 100)
        
        
        
        continueWatchCollectionView.collectionViewLayout = cellDesign
    }

}

extension HomeTabViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == imageSliderCollectionView {
            return sliderImages.count
        } else if collectionView == continueWatchCollectionView {
            return continueWatchThumbnails.count
        } else if collectionView == amazonOriginalsCollectionView {
            return amazonOriginalsThumbnails.count
        } else if collectionView == turkishSeriesCollectionView {
            return turkishSeriesThumbnails.count
        } else if collectionView == recommendedMoviesCollectionView {
            return recommendedMoviesThumbnails.count
        } else if collectionView == topMoviesCollectionView {
            return topMoviesThumbnails.count
        } else if collectionView == recommendedTVCollectionView {
            return recommendedTVThumbnails.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == imageSliderCollectionView {
            let cell = imageSliderCollectionView.dequeueReusableCell(withReuseIdentifier: "imageSliderCell", for: indexPath) as! ImageSliderCellCollectionViewCell
            
            cell.sliderImageView.image = UIImage(named: sliderImages[indexPath.row])
            
            return cell
            
            
        } else if collectionView == continueWatchCollectionView {
            let cell = continueWatchCollectionView.dequeueReusableCell(withReuseIdentifier: "continueWatchCell", for: indexPath) as! ContinueWatchCollectionViewCell
            
            cell.continueWatchImage.image = UIImage(named: continueWatchThumbnails[indexPath.row])
            return cell
            
            
        } else if collectionView == amazonOriginalsCollectionView {
            let cell = amazonOriginalsCollectionView.dequeueReusableCell(withReuseIdentifier: "amazonOriginalsCell", for: indexPath) as! AmazonOriginalsCollectionViewCell
            
            cell.amazonOriginalsImage.image = UIImage(named: amazonOriginalsThumbnails[indexPath.row])
            return cell
        } else if collectionView == turkishSeriesCollectionView {
            let cell = turkishSeriesCollectionView.dequeueReusableCell(withReuseIdentifier: "turkishSeriesCell", for: indexPath) as! TurkishSeriesCollectionViewCell
            
            cell.turkishSeriesImage.image = UIImage(named: turkishSeriesThumbnails[indexPath.row])
            return cell
        } else if collectionView == recommendedMoviesCollectionView {
            let cell = recommendedMoviesCollectionView.dequeueReusableCell(withReuseIdentifier: "recommendedMoviesCell", for: indexPath) as! RecommendedMoviesCollectionViewCell
            
            cell.recommendedMoviesImage.image = UIImage(named: amazonOriginalsThumbnails[indexPath.row])
            return cell
        } else if collectionView == topMoviesCollectionView {
            let cell = topMoviesCollectionView.dequeueReusableCell(withReuseIdentifier: "topMoviesCell", for: indexPath) as! TopMoviesCollectionViewCell
            
            cell.topMoviesImage.image = UIImage(named: topMoviesThumbnails[indexPath.row])
            return cell
        } else if collectionView == recommendedTVCollectionView {
            let cell = recommendedTVCollectionView.dequeueReusableCell(withReuseIdentifier: "recommendedTVCell", for: indexPath) as! recommendedTVCollectionViewCell
            
            cell.recommendedTVCell.image = UIImage(named: recommendedTVThumbnails[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == imageSliderCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else if collectionView == continueWatchCollectionView {
            return CGSize(width: 174, height: 100)
        } else if collectionView == amazonOriginalsCollectionView {
            return CGSize(width: 174, height: 100)
        } else if collectionView == turkishSeriesCollectionView {
            return CGSize(width: 174, height: 100)
        } else if collectionView == recommendedMoviesCollectionView {
            return CGSize(width: 174, height: 100)
        } else if collectionView == topMoviesCollectionView {
            return CGSize(width: 174, height: 100)
        } else if collectionView == recommendedTVCollectionView {
            return CGSize(width: 174, height: 100)
        }
        
        return CGSize.zero
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex:CGFloat = self.imageSliderCollectionView.contentOffset.x / self.imageSliderCollectionView.frame.size.width
           pageDots.currentPage = Int(currentIndex)
        self.imageIndex = Int(currentIndex)
    }
    
    
}
