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
        
        dataArray.append("유비")
        dataArray.append("관우")
        dataArray.append("장비")
        dataArray.append("조조")
        dataArray.append("여포")
        dataArray.append("동탁")
        dataArray.append("초선")
        dataArray.append("손견")
        dataArray.append("장양")
        dataArray.append("손책")
        
        
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
        cell.lblHuman.text = dataArray[indexPath.row]
        cell.lblHuman.backgroundColor = UIColor.yellow
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(dataArray[indexPath.row])
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

