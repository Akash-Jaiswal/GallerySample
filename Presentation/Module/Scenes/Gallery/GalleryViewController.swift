//
//  ViewController.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import UIKit
protocol IGalleryViewable {
    func getPhotosSuccess(viewModel: GalleryPresnetationModel)
    func getPhotosFailure(viewModel: GalleryPresnetationModel)
}
class GalleryViewController: UIViewController {
    private var pageNo = 1
    var galleryModel = GalleryPresnetationModel()
    var photoArray = [Photo]()
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: ImageCollectionViewCell.reuseID, bundle: nil), forCellWithReuseIdentifier: ImageCollectionViewCell.reuseID)
        }
    }
    
    private var searchBarController: UISearchController!
    private var numberOfColumns: CGFloat = APIConstants.defaultColumnCount
    private var isFirstTimeActive = true
    var interactor: GalleryInteractor?
    var presenter: GalleryPresenter?
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    // MARK: Setup
    private func setup() {
        interactor = GalleryInteractor()
        presenter = GalleryPresenter()
        interactor?.presenter = presenter
        presenter?.viewController = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getPhotos()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//MARK:- UICollectionViewDataSource
extension GalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseID, for: indexPath) as! ImageCollectionViewCell
        cell.model = photoArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (photoArray.count - 1) {
            loadNextPage()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: PhotoViewController.reuseID) as! PhotoViewController
        if let image = ((collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell)?.imageView.image) {
            vc.photo = image
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    private func loadNextPage() {
        if pageNo < galleryModel.pages ?? 0 {
            pageNo += 1
            getPhotos(showloader: false)
        }
    }
    func getPhotos(showloader: Bool = true) {
        if showloader == true {
            self.view.activityStartAnimating()
        }
        interactor?.getPhotos(pageNo: pageNo)
    }
}

//MARK:- UICollectionViewDelegateFlowLayout
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 10)/numberOfColumns, height: (collectionView.bounds.width - 20)/numberOfColumns)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension GalleryViewController: IGalleryViewable {
    func getPhotosSuccess(viewModel: GalleryPresnetationModel) {
        self.view.activityStopAnimating()
        galleryModel = viewModel
        if let photos = viewModel.photos {
            photoArray.append(contentsOf: photos)
        }
        collectionView.reloadData()
    }
    
    func getPhotosFailure(viewModel: GalleryPresnetationModel) {
        self.view.activityStopAnimating()
    }
}
