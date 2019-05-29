//
//  ConnectedAd.swift
//  ConnectedSDK
//
//  Created by Firoze Moosakutty on 28/05/19.
//  Copyright © 2019 Firoze Moosakutty. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

public enum AdType {
    case AdMobBanner
}
public protocol ConnectedAdDelegate {
    func connectedAdReceivesAd(_ adtype: AdType)
}
public class ConnectedAd: NSObject {
    
    public var delegate: ConnectedAdDelegate?
    var rootViewController: UIViewController!
    private var bannerView: GADBannerView!
    
    public static func getAds() {
        print("ADS obtained!")
    }
    
    public func initAdsFrom(_ viewController: UIViewController) {
        rootViewController = viewController
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = rootViewController
        bannerView.delegate = self
        bannerView.load(GADRequest())
    }
    
    private func addBannerViewFromView(_ viewController: UIViewController) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        rootViewController.view.addSubview(bannerView)
        rootViewController.view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: rootViewController.view.safeAreaLayoutGuide.bottomAnchor,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: rootViewController.view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
}

extension ConnectedAd: GADBannerViewDelegate {
    /// Tells the delegate an ad request loaded an ad.
    private func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
        addBannerViewFromView(rootViewController)
    }
    
    /// Tells the delegate an ad request failed.
    private func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    private func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    private func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    private func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    private func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
}
