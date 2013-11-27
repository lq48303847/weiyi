//
//  WTMessageViewController.h
//  WeiYi
//
//  Created by TY on 13-11-26.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCSegmentedControl.h"
@interface WTMessageViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    MCSegmentedControl *segmentedControl;
}
@end
