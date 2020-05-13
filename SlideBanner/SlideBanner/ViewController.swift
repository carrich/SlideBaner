//
//  ViewController.swift
//  SlideBanner
//
//  Created by Ngoduc on 5/13/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollview: UIScrollView!
    var images: [String] = ["1","2","3"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var time1 = Timer()
    var pageIndexCurrent = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.currentPage = 0
        pageControl.numberOfPages = images.count
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        for index in 0..<images.count {
            frame.origin.x = scrollview.frame.size.width * CGFloat(index) + 20
            frame.size = CGSize(width: scrollview.frame.size.width - 80, height: scrollview.frame.size.height - 50)
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: images[index])
            imgView.contentMode = .scaleAspectFit
          

            self.scrollview.addSubview(imgView)
        }
        scrollview.contentSize = CGSize(width: (scrollview.frame.size.width * CGFloat(images.count)), height: scrollview.frame.size.height)
        scrollview.delegate = self
        time1 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(changView), userInfo: nil, repeats: true)
    }
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        pageIndexCurrent = pageControl.currentPage
        print(pageIndexCurrent)
    }

   
    @objc func changView(){
        if pageIndexCurrent == images.count - 2 {
            time1.invalidate()
        }
       scrollview.contentOffset.x += scrollview.frame.size.width
    }

}

