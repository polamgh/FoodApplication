//
//  ViewController.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/24/1399 AP.
//

import UIKit

class ViewController: UIViewController , FloatingPanelControllerDelegate{

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    let images = ["discount-banner_2x","discount-banner_2x","discount-banner_2x"]
    override func viewDidLoad() {
        super.viewDidLoad()


        
        
        initFloatingView()
        
        setScrollableBackground()
        
        
    }
    
    func initFloatingView() {
        let floating = FloatingPanelController(delegate: self)
        floating.delegate = self
        
        guard let foodController = storyboard?.instantiateViewController(identifier: "foodcontroller") as? FoodBaseViewController else {
            return
        }

        floating.set(contentViewController: foodController)
        floating.layout = MyFloatingPanelLayout()
        floating.addPanel(toParent: self)
        floating.behavior = MyPanelBehavior()
        let appearance = SurfaceAppearance()
        appearance.cornerRadius = 40.0
        floating.surfaceView.appearance = appearance
    }
    func setScrollableBackground() {
        self.mainScrollView.frame = self.view.frame
        self.mainScrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height * 0.7)
        self.mainScrollView.isPagingEnabled = true
        let scrollViewWidth:CGFloat = self.view.frame.width
        let scrollViewHeight:CGFloat = self.view.frame.height * 0.7
        mainScrollView.delegate = self
        
        for index in 0..<images.count {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index) * scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
            imageView.image = UIImage(named: images[index])
            imageView.contentMode = .scaleToFill
            
            self.mainScrollView.addSubview(imageView)
        }
        
        
        self.mainScrollView.contentSize = CGSize(width:self.mainScrollView.frame.width * CGFloat(images.count), height: self.mainScrollView.frame.height)
        
        pageControl.addTarget(self, action: #selector(changePage(sender:)), for: .valueChanged)
    }

    func floatingPanelDidMove(_ vc: FloatingPanelController) {
        
        if vc.isAttracting == false {
            let loc = vc.surfaceLocation
            let minY = vc.surfaceLocation(for: .full).y - 6.0
            let maxY = vc.surfaceLocation(for: .tip).y + 6.0
            vc.surfaceLocation = CGPoint(x: loc.x, y: min(max(loc.y, minY), maxY))
        }
    }
    func floatingPanelDidChangePosition(_ vc: FloatingPanelController) {
        
        if vc.state == FloatingPanelState.full{
            print("salam")
        }
    }
}

class MyFloatingPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .half
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelLayoutAnchor(absoluteInset: 0.0, edge: .top, referenceGuide: .superview),
            .half: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .safeArea)
        ]
    }
    
    
}


class MyPanelBehavior: FloatingPanelBehavior {
    func allowsRubberBanding(for edge: UIRectEdge) -> Bool {
        return true
    }
    
}


extension ViewController : UIScrollViewDelegate{
        @objc func changePage(sender: AnyObject) -> () {
            let x = CGFloat(pageControl.currentPage) * mainScrollView.frame.size.width
            mainScrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
        }

        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControl.currentPage = Int(pageNumber)
        }

}
