//
//  ViewController.swift
//  实验九ScrollView
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 baoxinbei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollView2: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...6{
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
            scrollView.isPagingEnabled = true
        }
        
        let imageView2 = UIImageView(image: UIImage(named: "7"))
        scrollView2.addSubview(imageView2)
        scrollView2.contentSize = imageView2.bounds.size
        scrollView2.minimumZoomScale = 0.2
        scrollView2.maximumZoomScale = 5
        scrollView2.delegate = self
       
        scrollView.contentSize = CGSize(width: 6 * scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.delegate = self
        
        pageControl.numberOfPages = 6
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView2.subviews.first
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }

    @IBAction func pageControlClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageControl.currentPage) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
}

