//
//  ViewController.swift
//  CollectionView_Label
//
//  Created by TJ on 2022/06/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataInit()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    func dataInit(){
        
        dataArray.append("wolf.png")
        dataArray.append("pig.png")
        dataArray.append("fox.png")
        dataArray.append("dog.png")
        dataArray.append("wolf.png")
        dataArray.append("pig.png")
        dataArray.append("fox.png")
        dataArray.append("dog.png")
        dataArray.append("wolf.png")
        dataArray.append("pig.png")
        dataArray.append("fox.png")
        dataArray.append("dog.png")
 
        
        
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
   // Cell의 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .lightGray
        cell.imageView.image = UIImage(named: dataArray[indexPath.row])

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        
//        if filterData[indexPath.row].bookmark == nil {
//            detailViewController.results?.bookmark = false
//        }
        detailViewController.imageName = dataArray[indexPath.row]
//        detailViewController.results?.isStar = false

    
    
        self.show(detailViewController, sender: nil)
   
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1 // 3등분하여 간격이 1이므로 1을 빼줌
        let size = CGSize(width: width, height: width)
    return size
    
    }
    
}

