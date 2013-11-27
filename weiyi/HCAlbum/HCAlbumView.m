//
//  HCAlbumScrollView.m
//  Album
//
//  Created by TY on 13-11-22.
//  Copyright (c) 2013年 hc. All rights reserved.
//
#define SELECTED @"checked"
#define NOT_SELECTED @"unchecked"


#import "HCAlbumView.h"
#import "UIImageView+WebCache.h"

@implementation HCAlbumView
@synthesize pictureSize;//设置图片正常显示的大小
@synthesize pictureSpacing;//设置图片左右之间的距离
@synthesize pictureRowSpacing;//设置图片上下之间的行距
@synthesize albumMargins; //设置相册与图片之间的边距
@synthesize imageControlEventsA;
@synthesize imageControlEventsTwo;
@synthesize multipleChoiceSwitch;
@synthesize defaultImage;
@synthesize pictureTypesettingType;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadDefineValue];
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark ---加载默认设置---
//加载默认设置
-(void)loadDefineValue{
    albumScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
     backImage=[[UIImageView alloc]initWithFrame:albumScrollView.frame];
    //默认图片大小
    pictureSize=CGSizeMake(60, 60);
    //默认图片左右间距
    pictureSpacing=10;
    //默认图片上下间距
    pictureRowSpacing=10;
    //默认相册与图片的边距
    albumMargins=20;
    pictureArray=[[NSMutableArray alloc]init];
    [albumScrollView setShowsHorizontalScrollIndicator:NO];
    [albumScrollView setShowsVerticalScrollIndicator:NO];
    [self addSubview:backImage];
    [self addSubview:albumScrollView];
    
    pictureArray=[[NSMutableArray alloc]init];
    
    selectedArray=[[NSMutableArray alloc]init];
    
    viewPosition=[[NSMutableArray alloc]init];
    
    pictureTypesettingType=HCAlbumPictureTypesettingTypeTransverse;
    
    albumScrollView.userInteractionEnabled=YES;
    
}

//根据值类型不同 调用不同方法取的图片视图
-(UIImageView*)imageViewWithPictureArrayIndex:(NSInteger)index{
    UIImageView *imageView;
    if (index>=0&&index<pictureArray.count) {
        id pictureType=pictureArray[index];
        if ([pictureType isKindOfClass:[NSURL class]]) {
            imageView=[self imageViewWithURL:pictureType];
        }else if ([pictureType isKindOfClass:[UIImage class]]){
            imageView=[self imageViewWithImage:pictureType];
        }else{
            NSLog(@"图片来源异常");
            NSAssert(NO, @"图片来源异常");
        }
    }
    
    if (!imageView) {
        NSLog(@"图片空");
    }
    return imageView;
}

//使用URL设置ImageView
-(UIImageView*)imageViewWithURL:(NSURL*)url{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, pictureSize.width, pictureSize.height)];
    editState=YES;
    [imageView setImageWithURL:url placeholderImage:defaultImage options:SDWebImageRetryFailed];
    return imageView;
}

//使用Image设置ImageView
-(UIImageView*)imageViewWithImage:(UIImage*)image{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, pictureSize.width, pictureSize.height)];
    [imageView setImage:image];
    return imageView;
}

#pragma mark ---加载界面---
/**更新加载图片
 * 更新HCAlbumScrollView中显示的图片
 */
-(void)updatePictures{
    //加载图片到每个子视图中
    [self loadPictures];
    
    //排版子视图
    [self loadpictureTypesetting];
    
    //加载子视图到主视图中
    [self updateWindow];
}
 //加载子视图到主视图中
-(void)updateWindow{
    for (UIView *view in viewPosition) {
        [albumScrollView addSubview:view];
    }
    if (viewPosition.count>0) {
        CGRect viewRect=[viewPosition[viewPosition.count-1] frame];
        [albumScrollView setContentSize:CGSizeMake(viewRect.origin.x+viewRect.size.width+albumMargins,viewRect.origin.y+viewRect.size.height+albumMargins)];
    }
   
}

//排版子视图
-(void)loadpictureTypesetting{
    switch (pictureTypesettingType) {
        case HCAlbumPictureTypesettingTypeVertical:
        {//横向
            NSLog(@"横向");
            int maxCloumn=(self.frame.size.width-2*albumMargins)/(pictureSize.width+pictureSpacing);
            for (int i=0; i<viewPosition.count; i++) {
                
                UIButton *button=viewPosition[i];
                
                int row=i/maxCloumn;
                
                int column=i%maxCloumn;
                
                int x=albumMargins+column*(pictureSize.width+pictureSpacing);
                
                int y=albumMargins+row*(pictureSize.height+pictureRowSpacing);
                
                [button setFrame:CGRectMake(x, y,button.frame.size.width, button.frame.size.height)];
                
            }
        }
            break;
        case HCAlbumPictureTypesettingTypeTransverse:
        {//竖向
            NSLog(@"竖向");
            for (int i=0; i<viewPosition.count; i++) {
                UIButton *button=viewPosition[i];
                
                int x=albumMargins+i*(pictureSize.width+pictureSpacing);
                int y=albumMargins;
                
                [button setFrame:CGRectMake(x, y,button.frame.size.width, button.frame.size.height)];
            }
        }
            break;
        case HCAlbumPictureTypesettingTypeWeiYiDynamic:
        {//微议动态
            NSLog(@"微议动态");
        }
            break;
        default:
            break;
    }
}

//加载图片
-(void)loadPictures{
    if (editState) {
        
        for (UIButton *button in viewPosition) {
            [button removeFromSuperview];
        }
        [viewPosition removeAllObjects];
        

        for (int i=0; i<pictureArray.count; i++) {
            
            UIImageView *imageView=[self imageViewWithPictureArrayIndex:i];

            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    
            [button setTag:10000+i];
            
            [button setFrame:CGRectMake(0, 0, pictureSize.width, pictureSize.height)];

            [button addSubview:imageView];
            //设置多选
            if (multipleChoiceSwitch) {
                [button addTarget:self action:@selector(multipleChoiceClick:) forControlEvents:UIControlEventTouchUpInside];
                UIImageView *markImageView;
                if ([selectedArray[i] boolValue]) {
                    markImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:SELECTED]];
                }else{
                    markImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:NOT_SELECTED]];
                }
                markImageView.tag=20000+i;
                [markImageView setFrame:CGRectMake(button.frame.size.width-markImageView.frame.size.width,
                                                   button.frame.size.height-markImageView.frame.size.height,
                                                   markImageView.frame.size.width,
                                                   markImageView.frame.size.height)];
                [button addSubview:markImageView];
            }
            //设置图片事件
            if (imageControlEventsA!=0) {
                [button addTarget:self action:@selector(imageClickA:) forControlEvents:imageControlEventsA];
            }
            if (imageControlEventsTwo!=0) {
                [button addTarget:self action:@selector(imageClickTwo:) forControlEvents:imageControlEventsTwo];
            }
            [viewPosition addObject:button];
        }
    }
}


-(void)imageClickA:(UIButton*)button{
    NSInteger index=button.tag-10000;
    NSLog(@"A%ld",(long)index);
}
-(void)imageClickTwo:(UIButton*)button{
    NSInteger index=button.tag-10000;
    NSLog(@"TWO%ld",(long)index);
}
-(void)multipleChoiceClick:(UIButton*)button{
    NSInteger index=button.tag-10000;
    UIImageView *markImageView=(UIImageView*)[button viewWithTag:index+20000];
    NSLog(@"%ld",(long)index);
    if (markImageView) {
        if ([selectedArray[index] boolValue]) {
            [markImageView setImage:[UIImage imageNamed:NOT_SELECTED]];
            [selectedArray setObject:[NSNumber numberWithBool:NO] atIndexedSubscript:index];
            NSLog(@"NO");
        }else{
            [markImageView setImage:[UIImage imageNamed:SELECTED]];
            [selectedArray setObject:[NSNumber numberWithBool:YES] atIndexedSubscript:index];
            NSLog(@"YES");
        }
    }
}

#pragma mark ---URL方式传入图片---
/**使用URL地址传入图片插入到相册指定位置中 0
 * @param url:图片地址
 * @param index:要插入的位置
 */
-(void)insetPictureURL:(NSURL*)url index:(NSInteger)index{
    if (url!=nil) {
        [pictureArray insertObject:url atIndex:index];
        [selectedArray insertObject:[NSNumber numberWithBool:NO] atIndex:index];
        editState=YES;
    }
}

/**使用URL地址传入图片到相册末尾
 * @param url:图片地址
 */
-(void)addPictureURL:(NSURL*)url{
    if (url!=nil) {
        [pictureArray addObject:url];
        [selectedArray addObject:[NSNumber numberWithBool:NO]];
        editState=YES;
    }
}

#pragma mark ---Image方式传入图片---

/**使用URL地址传入图片插入到相册指定位置中 0
 * @param url:图片地址
 * @param index:要插入的位置
 */
-(void)insetPictureImage:(UIImage*)image index:(NSInteger)index{
    if (image!=nil) {
        [pictureArray insertObject:image atIndex:index];
        [selectedArray insertObject:[NSNumber numberWithBool:NO] atIndex:index];
        editState=YES;
    }
}

/**使用Image增加图片到相册末尾
 * @param image:要增加的图片
 */
-(void)addPictureImage:(UIImage*)image{
    if (image!=nil) {
        [pictureArray addObject:image];
        [selectedArray addObject:[NSNumber numberWithBool:NO]];
        editState=YES;
    }
}
/**通过index下标移出图片
 *
 */
-(void)removePictureIndex:(NSInteger)index{
    if (index>=0&&index<pictureArray.count) {
        [pictureArray removeObjectAtIndex:index];
        [selectedArray removeObjectAtIndex:index];
        editState=YES;
    }
}

//设置背景图片
-(void)setBackgroundImage:(UIImage*)image{
    [backImage setImage:image];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击");
}
@end
