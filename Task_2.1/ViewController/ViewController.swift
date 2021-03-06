//
//  ViewController.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 15.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private(set) var files: [File] = [] {
        didSet {
            collectionView.reloadData()
            updateUI()
        }
    }
    
    let fileManager = MyFileManager()
    let reuseIdentifier = String(describing: ImageCollectionViewCell.self)
    
    private lazy var imageSaver = ImageSaver(delegate: self, fileManager: self.fileManager)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.allowsSelection = false
        [spinner, emptyLabel, collectionView].forEach { $0.isHidden = true }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadFiles()
    }
    
    func reloadFiles() {
        spinner.isHidden = false
        spinner.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            do {
                guard let self = self else { return }
                let files = try self.fileManager.files()
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.spinner.isHidden = true
                    self.files = files
                }
            } catch {
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    self.spinner.isHidden = true
                    self.showError(error)
                    self.files = []
                }
            }
        }
    }
    
    func showError(_ error: Error) {
        present(UIAlertController.infoAlert(title: "Error", message: error.localizedDescription), animated: true)
    }
    
    private func updateUI() {
        let hasFiles = !files.isEmpty
        emptyLabel.isHidden = hasFiles
        collectionView.isHidden = !hasFiles
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        imageSaver.start()
    }
}

