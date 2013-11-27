//
//  WTDynamicViewController.m
//  WeiYi
//
//  Created by TY on 13-11-18.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import "WTDynamicViewController.h"
#import "HMSegmentedControl.h"
#import "WTMessageViewController.h"
#import "WTDynamicCell.h"

#import "AKSSegmentedSliderControl.h"
@interface WTDynamicViewController ()

@end

@implementation WTDynamicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    ScreenView.frame=CGRectMake(0, -[UIScreen mainScreen].bounds.size.height, 320, [UIScreen mainScreen].bounds.size.height);
    [ScreenView setBackgroundColor:[[UIColor alloc]initWithHue:0 saturation:0 brightness:0 alpha:0.7]];
    ScreenView.hidden=YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    typeOpen=NO;
    screenlableArray=[[NSMutableArray alloc]init];
    [self nav];
    //得到数据
    [self addRefreshControl];
    //增加距离控制器
    [self distanceSemented];
    [self addLabel];
    dynamicTable.dataSource=self;
    dynamicTable.delegate=self;
     [dynamicTable registerNib:[UINib nibWithNibName:@"WTDynamicCell" bundle:nil] forCellReuseIdentifier:@"dynamicCell"];
    // Do any additional setup after loading the view from its nib.
}
//导航视图控制
-(void)nav
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"u4_normal"] forBarMetrics:UIBarMetricsDefault];
    UIButton *backBut=[[UIButton alloc]initWithFrame:CGRectMake(0, 2, 45, 27)];
    [backBut setBackgroundImage:[UIImage imageNamed:@"u6_normal.png"] forState:UIControlStateNormal];
    [backBut addTarget:self action:@selector(messages:) forControlEvents:UIControlEventTouchUpInside];
    [backBut setTitle:@"消息" forState:UIControlStateNormal];
    [backBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBut.titleLabel setFont:[WTUserInfo sharedUserInfo].btnFont];
    UIBarButtonItem *backBarButton=[[UIBarButtonItem alloc]initWithCustomView:backBut];
    [self.navigationItem setLeftBarButtonItem:backBarButton];
    UIButton *myButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 2, 45, 27)];
    [myButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   [myButton.titleLabel setFont:[WTUserInfo sharedUserInfo].btnFont];
    [myButton setBackgroundImage:[UIImage imageNamed:@"u6_normal.png"] forState:UIControlStateNormal];
    [myButton addTarget:self action:@selector(screen:) forControlEvents:UIControlEventTouchUpInside];
    [myButton setTitle:@"筛选" forState:UIControlStateNormal];
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithCustomView:myButton];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.navigationItem.titleView=[self addSemented];
}
//添加下拉刷新
-(void)addRefreshControl
{
    //下拉刷新
    if (_refreshHeaderView == nil) {
        NSLog(@"%f",self.view.frame.size.width);
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - dynamicTable.bounds.size.height, self.view.frame.size.width, dynamicTable.bounds.size.height)];
		view.delegate = self;
		[dynamicTable addSubview:view];
		_refreshHeaderView = view;
	}
	[_refreshHeaderView refreshLastUpdatedDate];
}
//消息
-(void)messages:(id)sender
{
    WTMessageViewController *wtmessage=[[WTMessageViewController alloc]initWithNibName:@"WTMessageViewController" bundle:nil];
    [self.navigationController pushViewController:wtmessage animated:YES];
}
//筛选
-(void)screen:(id)sender
{
ScreenView.hidden=NO;
[UIView animateWithDuration:0.5 animations:^{
    ScreenView.frame=CGRectMake(0, 0, 320,[UIScreen mainScreen].bounds.size.height);
}];
}
- (IBAction)screenqueding:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        ScreenView.frame=CGRectMake(0, -[UIScreen mainScreen].bounds.size.height, 320, [UIScreen mainScreen].bounds.size.height);
    }];
}
#pragma mark-----类型选择------------------
- (IBAction)Choosetype:(UIButton*)sender {
    if (typeOpen==NO) {
        [typeImge addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventTouchUpInside];
        [typecamera addTarget:self action:@selector(changeCamera:) forControlEvents:UIControlEventTouchUpInside];
        [typePhont addTarget:self action:@selector(changePhont:) forControlEvents:UIControlEventTouchUpInside];
        [typeVoice addTarget:self action:@selector(changeVoice:) forControlEvents:UIControlEventTouchUpInside];
        typeOpen=YES;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.2 animations:^{
                    type.transform=CGAffineTransformRotate(type.transform, M_PI);
                    [typeImge setHidden:NO];
                    [typeImge setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y-90, typeImge.frame.size.width, typeImge.frame.size.height)];
                }];
            });
            double delayInSeconds = 0.1;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [UIView animateWithDuration:0.2 animations:^{
                    [typePhont setHidden:NO];
                    [typePhont setFrame:CGRectMake(sender.frame.origin.x+45, sender.frame.origin.y-76.5, typePhont.frame.size.width, typePhont.frame.size.height)];
                }];
                double delayInSeconds = 0.1;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    [UIView animateWithDuration:0.2 animations:^{
                        [typecamera setHidden:NO];
                        [typecamera setFrame:CGRectMake(sender.frame.origin.x+76.5, sender.frame.origin.y-45, typecamera.frame.size.width, typecamera.frame.size.height)];

                    }];
                    double delayInSeconds = 0.1;
                    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                        [UIView animateWithDuration:0.2 animations:^{
                            [typeVoice setHidden:NO];
                            [typeVoice setFrame:CGRectMake(sender.frame.origin.x+90, sender.frame.origin.y, typeVoice.frame.size.width, typeVoice.frame.size.height)];
                        }];
                    });
                });
            });
        });

//        [UIView animateWithDuration:0.2f animations:^{
//            [typeImge setHidden:NO];
//            type.transform=CGAffineTransformRotate(type.transform, M_PI_2);
//            [typeImge setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y-45, typeImge.frame.size.width, typeImge.frame.size.height)];
//        } completion:^(BOOL finished) {
//              [UIView animateWithDuration:0.2 animations:^{
//                  [typePhont setHidden:NO];
//                  [typeImge setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y-90, typeImge.frame.size.width, typeImge.frame.size.height)];
//                  [typePhont setFrame:CGRectMake(sender.frame.origin.x+22.5, sender.frame.origin.y-38, typePhont.frame.size.width, typePhont.frame.size.height)];
//              } completion:^(BOOL finished) {
//                   [UIView animateWithDuration:0.2 animations:^{
//                       [typecamera setHidden:NO];
//                       [typePhont setFrame:CGRectMake(sender.frame.origin.x+45, sender.frame.origin.y-76, typePhont.frame.size.width, typePhont.frame.size.height)];
//                       [typecamera setFrame:CGRectMake(sender.frame.origin.x+38, sender.frame.origin.y-22.5, typecamera.frame.size.width, typecamera.frame.size.height)];
//                   } completion:^(BOOL finished) {
//                       [UIView animateWithDuration:0.2 animations:^{
//                           [typeVoice setHidden:NO];
//                           [typecamera setFrame:CGRectMake(sender.frame.origin.x+76, sender.frame.origin.y-45,typecamera.frame.size.width, typecamera.frame.size.height)];
//                           [typeVoice setFrame:CGRectMake(sender.frame.origin.x+45, sender.frame.origin.y, typeVoice.frame.size.width, typeVoice.frame.size.height)];
//                       } completion:^(BOOL finished) {
//                           [typeVoice setFrame:CGRectMake(sender.frame.origin.x+90, sender.frame.origin.y, typeVoice.frame.size.width, typeVoice.frame.size.height)];
//                       }];
//                      
//                   }];
//              }];
//        }];
    }
    else
    {
        typeOpen=NO;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.2 animations:^{
                    type.transform=CGAffineTransformRotate(type.transform, M_PI);
                    [typeVoice setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y, typeVoice.frame.size.width,typeVoice.frame.size.height)];
                }completion:^(BOOL finished) {
                    [typeVoice setHidden:YES];
                }];
            });
            double delayInSeconds = 0.1;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [UIView animateWithDuration:0.2 animations:^{
                      [typecamera setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y, typecamera.frame.size.width, typecamera.frame.size.height)];
                } completion:^(BOOL finished) {
                    [typecamera setHidden:YES];
                }];
            
                double delayInSeconds = 0.1;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    [UIView animateWithDuration:0.2 animations:^{
                        [typePhont setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y, typePhont.frame.size.width, typePhont.frame.size.height)];
                    }completion:^(BOOL finished) {
                        [typePhont setHidden:YES];
                    }];
                    double delayInSeconds = 0.1;
                    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                        [UIView animateWithDuration:0.2 animations:^{
                            [typeImge setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y, typeImge.frame.size.width, typeImge.frame.size.height)];
                        }completion:^(BOOL finished) {
                            [typeImge setHidden:YES];
                        }];
                    });
                });
            });
        });
        
        
//        [UIView animateWithDuration:0.2f animations:^{
//             type.transform=CGAffineTransformRotate(type.transform, M_PI);
//            [typeVoice setFrame:CGRectMake(sender.frame.origin.x+45, sender.frame.origin.y, typeVoice.frame.size.width,typeVoice.frame.size.height)];
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:0.2f animations:^{
//                [typeVoice setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y, typeVoice.frame.size.width, typeVoice.frame.size.height)];
//                [typeVoice setHidden:YES];
//                [typecamera setFrame:CGRectMake(sender.frame.origin.x+38, sender.frame.origin.y-22.5, typecamera.frame.size.width, typecamera.frame.size.height)];
//            } completion:^(BOOL finished) {
//                [UIView animateWithDuration:0.2f animations:^{
//                    [typecamera setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y, typecamera.frame.size.width, typecamera.frame.size.height)];
//                    [typecamera setHidden:YES];
//                    [typePhont setFrame:CGRectMake(sender.frame.origin.x+22.5, sender.frame.origin.y-38, typePhont.frame.size.width, typePhont.frame.size.height)];
//                } completion:^(BOOL finished) {
//                    [UIView animateWithDuration:0.2f animations:^{
//                        [typePhont setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y, typePhont.frame.size.width, typePhont.frame.size.height)];
//                        [typePhont setHidden:YES];
//                        [typeImge setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y-45,typeImge.frame.size.width, typeImge.frame.size.height)];
//                    } completion:^(BOOL finished) {
//                        [typeImge setFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y, typeImge.frame.size.width, typeImge.frame.size.height)];
//                        [typeImge setHidden:YES];
//                    }];
//                }];
//            }];
//        }];
//      releaseTypeView.frame=CGRectMake(releaseTypeView.frame.origin.x, releaseTypeView.frame.origin.y+100, 37, 37);
    
    }
    
}
#pragma mark-------发布类型---------
//发布图片
-(void)changeImage:(UIButton*)sender
{
    NSLog(@"发布图片");
}
//选择视频
-(void)changeCamera:(UIButton*)sender
{
NSLog(@"选择视频");
}
//选择照相
-(void)changePhont:(UIButton*)sender
{
NSLog(@"选择照相");
}
//选择语音
-(void)changeVoice:(UIButton*)sender
{

NSLog(@"选择语音");
}
#pragma mark---------增加距离控制器----------
-(void)distanceSemented
{
#define WIDTH  280
#define HEIGHT 34
#define X_POS  20
#define Y_POS  59
#define RADIUS_POINT  10
#define SPACE_BETWEEN_POINTS  44.75
#define SLIDER_LINE_WIDTH     9
#define IPHONE_4_SUPPORT      88
	CGRect sliderConrolFrame = CGRectNull;
	sliderConrolFrame = CGRectMake(X_POS,Y_POS+6.5,WIDTH,HEIGHT);
    AKSSegmentedSliderControl* sliderControl = [[AKSSegmentedSliderControl alloc] initWithFrame:sliderConrolFrame];
    [sliderControl setDelegate:self];
	[sliderControl moveToIndex:2];
	[sliderControl setSpaceBetweenPoints:SPACE_BETWEEN_POINTS];
	[sliderControl setRadiusPoint:RADIUS_POINT];
	[sliderControl setHeightLine:SLIDER_LINE_WIDTH];
    [ScreenView addSubview:sliderControl];
}
- (void)timeSlider:(AKSSegmentedSliderControl *)timeSlider didSelectPointAtIndex:(int)index{
    NSLog(@"index=%i",index);
}

#pragma mark---------添加标签控制----------------------
-(void)addLabel
{
    int tag=10000;
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            UIButton *screenbutton=[[UIButton alloc]initWithFrame:CGRectMake(j*69, 33*i, 69, 33)];
            [screenbutton addTarget:self action:@selector(changebutton:) forControlEvents:UIControlEventTouchUpInside];
            if (tag==10000) {
                 [screenbutton setBackgroundImage:[UIImage imageNamed:@"u91_normal"] forState:UIControlStateNormal];
                [screenlableArray addObject: [NSNumber numberWithBool:YES]];
            }
            else
            {
                [screenbutton setBackgroundImage:[UIImage imageNamed:@"u88_normal"] forState:UIControlStateNormal];
                [screenlableArray addObject:[NSNumber numberWithBool:NO]];
            }
            [screenbutton setTag:tag++];
            [ScreenlableView addSubview:screenbutton];
        }
    }
}
-(void)changebutton:(UIButton*)sender
{
    
        NSNumber *flag=[screenlableArray objectAtIndex:(sender.tag-10000)];
        if (flag.boolValue) {
            [sender setBackgroundImage:[UIImage imageNamed:@"u88_normal"] forState:UIControlStateNormal];
            [screenlableArray setObject:[NSNumber numberWithBool:NO] atIndexedSubscript:(sender.tag-10000)];
        }
        else
        {
            [sender setBackgroundImage:[UIImage imageNamed:@"u91_normal"] forState:UIControlStateNormal];
            [screenlableArray setObject:[NSNumber numberWithBool:YES] atIndexedSubscript:(sender.tag-10000)];
        }
}
//分段控制器
#pragma  mark-------------分段控制器----------------------------------------
-(HMSegmentedControl*)addSemented
{
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"周边", @"关注"]];
    segmentedControl.segmentEdgeInset = UIEdgeInsetsMake(0, 5, 0, 5);
    segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl.scrollEnabled = YES;
    segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    [segmentedControl setFrame:CGRectMake(0, 0, 120, 44)];
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    return segmentedControl;
}
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
	NSLog(@"Selected index %i (via UIControlEventValueChanged)", segmentedControl.selectedSegmentIndex);
    if (segmentedControl.selectedSegmentIndex==0) {
        
    }
    else
    {
        
    }
    [dynamicTable reloadData];
}

#pragma  mark----------------tableview----------------------------------------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"dynamicCell";
    WTDynamicCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[WTDynamicCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
        [cell.userInfoImage setImageWithURL:[NSURL URLWithString:@"http://p1.qq181.com/cms/120507/2012050702584891001.jpg"] placeholderImage:nil];
    return cell;
    }
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
 }
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 125;
}
#pragma mark -----------------------UIScrollViewDelegate----------------------
// 刚拖动的时候
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
}
// 拖动过程中
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}
// 拖动结束后
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    
    if (scrollView.contentOffset.y<-0) {
        //下拉刷新
        NSLog(@"下拉刷新");
        [dynamicTable reloadData];
         [self performSelector:@selector(doneLoadingTableViewData) withObject:self afterDelay:0.25];
        NSLog(@"刷新完成");
    }else{
        
    }
}
#pragma mark ----------------EGORefreshTableHeaderDelegate Methods------------------

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading;
    // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}
#pragma mark -------------------Data Source Loading / Reloading Methods------------------------



- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:dynamicTable];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
