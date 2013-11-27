//
//  WTDynamicViewController.h
//  WeiYi
//
//  Created by TY on 13-11-18.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
@interface WTDynamicViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate>
{
    IBOutlet UITableView *dynamicTable;
    IBOutlet UIView *ScreenView;
    IBOutlet UIView *ScreenlableView;
    NSMutableArray *screenlableArray;
    IBOutlet UIView *releaseTypeView;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    int index;
    IBOutlet UIButton *typecamera;
    IBOutlet UIButton *typeImge;
    IBOutlet UIButton *typeVoice;
    IBOutlet UIButton *type;
    IBOutlet UIButton *typePhont;
    BOOL *typeOpen;
}
- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;
@end
