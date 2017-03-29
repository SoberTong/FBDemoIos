//
//  MainViewController.h
//  FBDemoIos
//
//  Created by Avidly on 2017/3/8.
//  Copyright © 2017年 Avidly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (nonatomic)NSMutableArray *fb_friends_array;
@property (weak, nonatomic) IBOutlet UITableView *friends_tableview;
@end

@interface Facebook_friend : NSObject
    
    @property (nonatomic) NSString *name;
    @property (nonatomic) NSString *id;
    @property (nonatomic) NSString *image_url;
    @end

