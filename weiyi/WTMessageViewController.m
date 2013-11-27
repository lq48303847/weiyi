//
//  WTMessageViewController.m
//  WeiYi
//
//  Created by TY on 13-11-26.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import "WTMessageViewController.h"
#import "WTMessageDynamicCell.h"
@interface WTMessageViewController ()

@end

@implementation WTMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[WTUserInfo sharedUserInfo].defaultBackgroundColor];
    [self nav];
    [self setscoll];
    [self segmented];
    // Do any additional setup after loading the view from its nib.
}
#pragma  mark-------------导航视图控制器----------------------------------------
-(void)nav
{
    UIButton *backBut=[[UIButton alloc]initWithFrame:CGRectMake(0, 2, 45, 27)];
    [backBut setBackgroundImage:[UIImage imageNamed:@"u7_normal"] forState:UIControlStateNormal];
    [backBut addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [backBut setTitle:@"返回" forState:UIControlStateNormal];
    [backBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBut.titleLabel setFont:[WTUserInfo sharedUserInfo].btnFont];
    UIBarButtonItem *backBarButton=[[UIBarButtonItem alloc]initWithCustomView:backBut];
    [self.navigationItem setLeftBarButtonItem:backBarButton];
    UILabel *titlelabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 44)];
    titlelabel.text=@"消息";
    titlelabel.backgroundColor=[UIColor clearColor];
    titlelabel.textAlignment=UITextAlignmentCenter;
    self.navigationItem.titleView=titlelabel;
   }
-(void)back:(id)sender
{
     [self.navigationController popViewControllerAnimated:YES];
}
#pragma  mark-------------分段控制器----------------------------------------
-(void)segmented
{
    NSArray *items = [NSArray arrayWithObjects:
					  @"动态",
					  @"新增联系人",
                    @"我的群",
					  nil];
	segmentedControl = [[MCSegmentedControl alloc] initWithItems:items];
    [segmentedControl setFrame:CGRectMake(10, 0, 300, 30)];
    segmentedControl.userInteractionEnabled=YES;
    [segmentedControl setFont:[UIFont systemFontOfSize:12]];
    [segmentedControl addTarget:self action:@selector(segmentedControlDidChange:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex =0;
    segmentedControl.tintColor = [UIColor blueColor];
	segmentedControl.selectedItemColor   = [UIColor blackColor];
	segmentedControl.unselectedItemColor = [UIColor whiteColor];
	[self.view addSubview:segmentedControl];
}
#pragma  mark-------------翻页控制----------------------------------------
-(void)setscoll
{
    //初始化scrollView
    scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height)];
    scrollView.bounces = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    //创建视图
    for (int i=0; i<3; i++) {
        UITableView *addtableview=[[UITableView alloc]init];
        addtableview.frame=CGRectMake(320*i, 44, 320, [UIScreen mainScreen].bounds.size.height);
        addtableview.dataSource=self;
        addtableview.delegate=self;
        [addtableview setTag:10000+i];
        [scrollView addSubview:addtableview];
    }
    [scrollView setContentSize:CGSizeMake(320 *3, [UIScreen mainScreen].bounds.size.height)];
    [scrollView setContentOffset:CGPointMake(0, 0)];
    [scrollView scrollRectToVisible:CGRectMake(0,44,320,[UIScreen mainScreen].bounds.size.height) animated:NO];
}
// scrollview 委托函数
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pagewidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pagewidth/2)/pagewidth)+1;
    NSLog(@"%i",page);
    // 默认从第二页开始
    pageControl.currentPage = page;
   [segmentedControl setSelectedSegmentIndex:page];
}
// pagecontrol 选择器的方法
- (void)segmentedControlDidChange:(MCSegmentedControl *)sender
{
    int page =[sender selectedSegmentIndex]; // 获取当前的page
    [scrollView scrollRectToVisible:CGRectMake(320*page,0,320,[UIScreen mainScreen].bounds.size.height) animated:NO]; // 触摸pagecontroller那个点点 往后翻一页 +1
}
#pragma  mark----------------tableview----------------------------------------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==10000) {
        return 20;
    }
    else if(tableView.tag==10001)
    {
        return 20;
    }
    else
    {
        return 20;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==10000) {
           [tableView registerNib:[UINib nibWithNibName:@"WTMessageDynamicCell" bundle:nil] forCellReuseIdentifier:@"dynamicCell"];
        static NSString *identifier=@"dynamicCell";
        WTMessageDynamicCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell=[[WTMessageDynamicCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        }
        return cell;
    }
    else  if(tableView.tag==10001)
    {
    static NSString *identifier=@"dynamicCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
        return cell;
    }
    else
    {
        [tableView registerNib:[UINib nibWithNibName:@"WTMessageDynamicCell" bundle:nil] forCellReuseIdentifier:@"dynamicCell"];
        static NSString *identifier=@"dynamicCell";
        WTMessageDynamicCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell=[[WTMessageDynamicCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        }
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==10000) {
        NSLog(@"ONE");
    }
    else if(tableView.tag==10001)
    {
        NSLog(@"TWO");
    }
    else
    {
        NSLog(@"THREE");
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
