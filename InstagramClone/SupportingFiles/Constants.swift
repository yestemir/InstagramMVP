//
//  Constants.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import Foundation
import UIKit



import Foundation
import UIKit

struct Constants {
    
    struct Logos {
        static let instagramFont = "instagram_font"
        static let cancel = "cancel_logo"
        static let dontShow = "dontShow_logo"
        static let show = "show_logo"
        static let faceBookLogo = "facebook_logo"
        static let line = "line_logo"
    }
    
    struct Colors {
        static let textFieldBorder = CGColor(red: 199/255, green: 199/255, blue: 199/255, alpha: 1)
        static let textFieldBackgroundColor = CGColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        static let forgetPasswordLabelColor = UIColor(red: 0/255, green: 148/255, blue: 246/255, alpha: 1)
        static let loginButtonColor = UIColor(red: 127/255, green: 202/255, blue: 251/255, alpha: 1)
        static let loginWithFacebook = CGColor(red: 0/255, green: 148/255, blue: 246/255, alpha: 1)
        static let lineImageViewColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1)
        
    }
    
    struct TabBarImages {
        static let home = "home"
        static let search = "search"
        static let add = "add"
        static let like = "like"
        static let liked = "liked"
        static let profile = "profile"
    }
    
    struct Identifiers {
        static let postCellindetifier = "PostTableViewCell"
        static let circleCollectionViewCell = "CircleCollectionViewCell"
    }
    
    
    struct Post {
        static let userImage = "userImage"
        static let postImage = "postImage"
    }
    
    static let moreImage = "more"
    static let heartImage = "heart"
    static let filledHeatrImage = "filled_heart"
    static let commentImage = "comment"
    static let directImage = "direct"
    static let profile = UIImage(named: "profile")
    var newPost = [Post]()
}
