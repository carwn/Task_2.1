//
//  ViewController+collectionView.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 16.05.2022.
//

import UIKit

extension ImagesViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        files.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        let file = files[indexPath.row]
        cell.configure(file: file) { [weak self] in
            guard let self = self else { return }
            do {
                try self.fileManager.removeFile(name: file.title)
                self.reloadFiles()
            } catch {
                self.showError(error)
            }
        }
        return cell
    }
}

extension ImagesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = Constants.itemsInset * (Constants.itemsPerRow + 1)
        let availableWidth = collectionView.bounds.width - paddingSpace
        let widthPerItem = availableWidth / Constants.itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.itemsInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: Constants.itemsInset,
                     left: Constants.itemsInset,
                     bottom: Constants.itemsInset,
                     right: Constants.itemsInset)
    }
}

extension ImagesViewController {
    enum Constants {
        static let itemsPerRow: CGFloat = 3
        static let itemsInset: CGFloat = 15
    }
}
