//
//  MainViewController.m
//  FBDemoIos
//
//  Created by Avidly on 2017/3/8.
//  Copyright © 2017年 Avidly. All rights reserved.
//

#import "MainViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKShareKit/FBSDKGameRequestDialog.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface MainViewController() <FBSDKGameRequestDialogDelegate, FBSDKSharingDelegate, FBSDKAppInviteDialogDelegate, UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UIButton *gameRequestButton;
@property (strong, nonatomic) UIButton *shareDialogButton;
@property (strong, nonatomic) UIButton *shareImageButton;
@property (strong, nonatomic) UIButton *appInviteButton;
@property (strong, nonatomic) UIButton *getFriendsButton;

@end

@implementation Facebook_friend
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor whiteColor];
    
    [self initBackButton];
    [self initLikeViewButton];
    [self initShareButton];
    [self initShareButton2];
    [self initShareButton3];
    [self initShareButton4];
    [self initShareButton5];
    [self initSendButton];
    [self initGameRequestButton];
    [self initAppInviteButton];
    [self initGetFriendsButton];
}

- (void)initBackButton {
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - 25, 100, 50, 20)];
    self.backButton.backgroundColor = [UIColor orangeColor];
    [self.backButton setTag:0];
    [self.backButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.backButton];
    [self.backButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initLikeViewButton {
    FBSDKLikeControl *likeButton = [[FBSDKLikeControl alloc] init];
    float width = likeButton.bounds.size.width;
    float hight = likeButton.bounds.size.height;
    likeButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - width/2, 150, width, hight);
    likeButton.objectID = @"https://www.facebook.com/FacebookDevelopers";
    likeButton.likeControlStyle = FBSDKLikeControlStyleBoxCount;
    [self.view addSubview:likeButton];
}

-(void)initShareButton{
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:@"https://www.facebook.com/FacebookDevelopers"];
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    shareButton.shareContent = content;
    float width = shareButton.bounds.size.width;
    float hight = shareButton.bounds.size.height;
    shareButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - width/2, 200, width, hight);
    [self.view addSubview:shareButton];
}

-(void)initShareButton2{
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Facebook"];
    content.contentTitle = @"My share.";
    content.contentDescription = @"Lorem ipsum dolor sit amet.";
    content.imageURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Facebook_Headquarters_Menlo_Park.jpg/2880px-Facebook_Headquarters_Menlo_Park.jpg"];
    content.peopleIDs = @[@"1561082740838259"];
    content.placeID = @"166793820034304";
    content.ref = @"myRefId";
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    shareButton.shareContent = content;
    float width = shareButton.bounds.size.width;
    float hight = shareButton.bounds.size.height;
    shareButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - width/2, 250, width, hight);
    [self.view addSubview:shareButton];
}

- (void)initShareButton3 {
    NSString *previewPropertyName = @"fitness:course";
    
    NSDictionary *objectProperties = @{
                                       @"og:type" : @"fitness.course",
                                       @"og:title": @"fit course",
                                       @"og:description" : @"come with me.",
                                       @"fitness:duration:value" : @100,
                                       @"fitness:duration:units" : @"s",
                                       @"fitness:distance:value" : @12,
                                       @"fitness:distance:units" : @"km",
                                       @"fitness:speed:value" : @5,
                                       @"fitness:speed:units" : @"m/s",
                                       };
    FBSDKShareOpenGraphObject *object = [FBSDKShareOpenGraphObject objectWithProperties:objectProperties];
    
    FBSDKShareOpenGraphAction *action = [[FBSDKShareOpenGraphAction alloc] init];
    action.actionType = @"fitness.runs";
    [action setObject:object forKey:previewPropertyName];
    
    FBSDKShareOpenGraphContent *content = [[FBSDKShareOpenGraphContent alloc] init];
    content.action = action;
    content.previewPropertyName = previewPropertyName;
    
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    shareButton.shareContent = content;
    float width = shareButton.bounds.size.width;
    float hight = shareButton.bounds.size.height;
    shareButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - width/2, 300, width, hight);
    [self.view addSubview:shareButton];
}

- (void)initShareButton4 {
    self.shareDialogButton = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - 80, 450, 160, 20)];
    self.shareDialogButton.backgroundColor = [UIColor orangeColor];
    [self.shareDialogButton setTag:2];
    [self.shareDialogButton setTitle:@"shareDialog" forState:UIControlStateNormal];
    [self.shareDialogButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.shareDialogButton];
    [self.shareDialogButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}
    
- (void)initShareButton5 {
    self.shareImageButton = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - 80, 500, 160, 20)];
    self.shareImageButton.backgroundColor = [UIColor orangeColor];
    [self.shareImageButton setTag:3];
    [self.shareImageButton setTitle:@"分享截图" forState:UIControlStateNormal];
    [self.shareImageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.shareImageButton];
    [self.shareImageButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initSendButton {
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Facebook"];
    content.contentTitle = @"My share.";
    content.contentDescription = @"Lorem ipsum dolor sit amet.";
    content.imageURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Facebook_Headquarters_Menlo_Park.jpg/2880px-Facebook_Headquarters_Menlo_Park.jpg"];
    content.peopleIDs = nil;
    content.placeID = nil;
    content.ref = nil;
    FBSDKSendButton *sndButton = [[FBSDKSendButton alloc] init];
    if (sndButton.isHidden) {
        NSLog(@"发送按钮被隐藏了");
    }else {
        sndButton.shareContent = content;
        float width = sndButton.bounds.size.width;
        float hight = sndButton.bounds.size.height;
        sndButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - width/2, 350, width, hight);
        [self.view addSubview:sndButton];
    }
}

- (void)initGameRequestButton {
    self.gameRequestButton = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - 80, 400, 160, 20)];
    self.gameRequestButton.backgroundColor = [UIColor orangeColor];
    [self.gameRequestButton setTag:1];
    [self.gameRequestButton setTitle:@"GameRequest" forState:UIControlStateNormal];
    [self.gameRequestButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.gameRequestButton];
    [self.gameRequestButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)gameRequestDialog:(FBSDKGameRequestDialog *)gameRequestDialog didCompleteWithResults:(NSDictionary *)results {
    NSLog(@"facebook gamerequest complete result:%@", results);
}

- (void)gameRequestDialog:(FBSDKGameRequestDialog *)gameRequestDialog didFailWithError:(NSError *)error {
    NSLog(@"facebook gamerequest error:%@", error);
}

- (void)gameRequestDialogDidCancel:(FBSDKGameRequestDialog *)gameRequestDialog {
    NSLog(@"facebook gamerequest cancel");
}
    
- (void)initAppInviteButton {
    self.appInviteButton = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - 80, 550, 160, 20)];
    self.appInviteButton.backgroundColor = [UIColor orangeColor];
    [self.appInviteButton setTag:4];
    [self.appInviteButton setTitle:@"appInvite" forState:UIControlStateNormal];
    [self.appInviteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.appInviteButton];
    [self.appInviteButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initGetFriendsButton {
    self.getFriendsButton = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - 80, 600, 160, 20)];
    self.getFriendsButton.backgroundColor = [UIColor orangeColor];
    [self.getFriendsButton setTag:5];
    [self.getFriendsButton setTitle:@"拉取好友" forState:UIControlStateNormal];
    [self.getFriendsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.getFriendsButton];
    [self.getFriendsButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}
    
-(void)buttonPressed:(id)sender {
    UIButton* button = (UIButton*)sender;
    switch (button.tag) {
        case 0:
        {
            [self dismissViewControllerAnimated:true completion:^{
                NSLog(@"按了返回键");
            }];
        }
            break;
        case 1:
        {
            FBSDKGameRequestContent *content = [[FBSDKGameRequestContent alloc] init];
            content.message = @"Come play with me.";
            content.title = @"GameRequest";
            [FBSDKGameRequestDialog showWithContent:content delegate:self];
        }
            break;
        case 2:
        {
            FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
            content.contentURL = [NSURL URLWithString:@"https://fb.me/269391403509711"];
            content.contentTitle = @"幸运筹码在这里，看谁手快抢Top~3!";
            [FBSDKShareDialog showFromViewController:self withContent:content delegate:self];

        }
            break;
        case 3:
        {
            FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
            photo.image = [self screenShot:self.view];
            FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
            content.photos = @[photo];
            [FBSDKShareDialog showFromViewController:self withContent:content delegate:self];
        }
            break;
        case 4:
        {
            FBSDKAppInviteContent *content = [[FBSDKAppInviteContent alloc] init];
            content.appLinkURL = [NSURL URLWithString:@"https://fb.me/269391403509711?id=10010&name=sober"];
            content.appInvitePreviewImageURL = [NSURL URLWithString:@"http://p3.qhimg.com/dmfd/400_300_/t018bf836bbffcbb8d8.jpg"];
            [FBSDKAppInviteDialog showFromViewController:self withContent:content delegate:self];
        }
            break;
        case 5:
        {
            if([[FBSDKAccessToken currentAccessToken] hasGranted:@"user_friends"]) {
                [self facebook_inapp_friends];
            }else {
                NSLog(@"没有user_friends权限。");
                FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
                [loginManager logInWithReadPermissions:@[@"user_friends"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                    if(error) {
                        NSLog(@"申请user_friends权限错误； %@", error.description);
                    }else {
                        NSLog(@"申请user_friends权限成功； %@", result.description);
                        [self facebook_inapp_friends];
                    }
                }];
            }
        }
            break;
        default:
            break;
    }
}
    
-(UIImage*)screenShot:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results {
    if ([results count] > 0) {
        NSLog(@"fb share success %@", results.description);
    }else {
        NSLog(@"fb share cancel.");
    }
}

-(void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error {
    NSLog(@"fb share error %@", error.description);
}

-(void)sharerDidCancel:(id<FBSDKSharing>)sharer {
    NSLog(@"fb share cancel.");
}
    
-(void)appInviteDialog:(FBSDKAppInviteDialog *)appInviteDialog didCompleteWithResults:(NSDictionary *)results {
    NSLog(@"appInvite success %@", results.description);
}

-(void)appInviteDialog:(FBSDKAppInviteDialog *)appInviteDialog didFailWithError:(NSError *)error {
    NSLog(@"appInvite error %@", error.description);
}
    
    // facebook get friends via graph api
- (void)facebook_inapp_friends {
    //https://developers.facebook.com/docs/graph-api/reference/user/friends
    NSDictionary *params = @{
                             @"fields":@"id,name,picture"
                             };
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:[NSString stringWithFormat:@"/%@/friends", [FBSDKAccessToken currentAccessToken].userID]
                                  parameters:params
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          id result,
                                          NSError *error) {
        NSLog(@"facebook graph api get friends %i", (int)[[result objectForKey:@"data"]count]);
        NSArray *friends_array = [result objectForKey:@"data"];
        _fb_friends_array = [[NSMutableArray alloc] init];
        for(id friend in friends_array){
            Facebook_friend *ff = [[Facebook_friend alloc] init];
            ff.name = [friend objectForKey:@"name"];
            ff.id = [friend objectForKey:@"id"];
            ff.image_url = [[[friend objectForKey:@"picture"]objectForKey:@"data"]objectForKey:@"url"];
            [_fb_friends_array addObject:ff];
        }
        _friends_tableview.dataSource = self;
        _friends_tableview.delegate = self;
        [_friends_tableview reloadData];
    }];
}
    
    //friends datasource protocol
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_fb_friends_array count];
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2
                                                  reuseIdentifier:nil];
    Facebook_friend *ff = [_fb_friends_array objectAtIndex:(int)indexPath.item];
    cell.textLabel.text = ff.name;
    cell.detailTextLabel.text = ff.id;
    return cell;
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //facebook game request https://developers.facebook.com/docs/games/services/gamerequests
    Facebook_friend *ff = [_fb_friends_array objectAtIndex:(int)indexPath.item];
    FBSDKGameRequestContent *content = [[FBSDKGameRequestContent alloc] init];
    content.message = @"game request message";
    content.recipients = @[ff.id];
    content.actionType = FBSDKGameRequestActionTypeTurn;
    [FBSDKGameRequestDialog showWithContent:content
                                   delegate:self];
}


@end
