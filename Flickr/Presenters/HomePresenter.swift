//
//  HomePresenter.swift
//  Flickr
//
//  Created by Fady Derias on 3/26/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import Foundation

protocol HomePresenterViewDelegate: class {
    func didLoadPhotos(photos: [FLPhoto])
    func didLoadMorePhotos(photos: [FLPhoto])
    func serverError()
    func networkConnectionError()
}

class HomePresenter: NSObject {
    
    private let photosManager = FLPhotosManager()
    private weak var homePresenterViewDelegate: HomePresenterViewDelegate?
    private var pageCount = 0
    private var searchText = ""
    
    func addHomePresenterViewDelegate(withHomePresenterViewDelegate delegate: HomePresenterViewDelegate) {
        self.homePresenterViewDelegate = delegate
    }
    
    func loadMorePhotos() {
        self.pageCount += 1
        self.loadPhotos()
    }
    
    func loadPhotos(withText text: String) {
        if (!text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            self.searchText = text
            self.pageCount = 0
            self.loadPhotos()
        }
    }
    
    private func loadPhotos() {
        self.photosManager.fetchPhotosBySearch(page: self.pageCount, searchText: self.searchText, success: { (photosResult) in
            self.processPhotos(photos: photosResult.photosList.photos)
        }) { (error) in
            self.processError(error: error)
        }
    }
    
    private func processPhotos(photos: [FLPhoto]) {
        if (self.pageCount > 0) {
            self.homePresenterViewDelegate?.didLoadMorePhotos(photos: photos)
        } else {
            self.homePresenterViewDelegate?.didLoadPhotos(photos: photos)
        }
    }
    
    private func processError(error: FLError) {
        if (self.pageCount > 0) {
            self.pageCount -= 1
        }
        
        if (error == .jsonParseError || error == .responseError) {
            self.homePresenterViewDelegate?.serverError()
        } else {
            self.homePresenterViewDelegate?.networkConnectionError()
        }
    }
}
