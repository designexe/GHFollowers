//
//  FollowerListViewController.swift
//  GHFollowers
//
//  Created by Tim Irrgang on 12.12.21.
//

import UIKit

class FollowerListVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var username: String!
    var followers: [Follower] = []
    var page: Int = 1
    var hasMoreFollower = true
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers(username: username, page: page)
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(view: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    

    
    func getFollowers(username: String, page: Int){
        showLoadingView()
        NetworkManager.shared.getFollowers(username: username, page: page) {[weak self] result in
           
            guard let self = self else { return }
            self.dismissLoadingView()

            switch result {
                case.failure(let error):
                    self.presentGFAlertOnMainThread(title: "Fehler", message: error.rawValue, buttonTitle: "ok")
                
                case.success(let followers):
                if followers.count < 100 {self.hasMoreFollower = false}
                self.followers.append(contentsOf: followers)
                
                if self.followers.isEmpty {
                    let message = "This user dosent have any Followers. Go follow them 😯"
                    DispatchQueue.main.async {
                        self.showEmptyStateView(with: message, in: self.view)
                        return
                    }
                }
                self.updateData()
            }
        }
    }
    
    func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(followers)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}

extension FollowerListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeigth = scrollView.contentSize.height
        let heigth = scrollView.frame.size.height
        
        if offsetY > contentHeigth - heigth {
            guard hasMoreFollower else { return }
            page += 1
            getFollowers(username: username, page: page)
        }
    }
}
