//
//  HCAlbumScrollView.h
//  Album
//
//  Created by TY on 13-11-22.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 图片相册
 *
 */
@interface HCAlbumView : UIView{
    NSMutableArray *pictureArray;   //图片
    NSMutableArray *viewPosition;   //控制图片位置
    NSMutableArray *selectedArray;
    UIScrollView *albumScrollView;
    UIImageView *backImage;         //背景图片
    BOOL editState;                 //图片是增加或者删除过
}

typedef enum{
    HCAlbumPictureTypesettingTypeTransverse     = 1,  //横向
    HCAlbumPictureTypesettingTypeVertical       = 2,  //竖向
    HCAlbumPictureTypesettingTypeWeiYiDynamic   = 3   //微议动态排版方式
}HCAlbumPictureTypesettingType;

@property (nonatomic,strong)UIImage *defaultImage;//还未下载完成前显示的图片
@property (nonatomic,strong)UIImage *downLoadErrorImage;//当下载图片失败，时显示的图片
@property (nonatomic,assign)CGSize pictureSize; //设置图片正常显示的大小
@property (nonatomic,assign)CGFloat pictureSpacing;//设置图片左右之间的距离
@property (nonatomic,assign)CGFloat pictureRowSpacing;//设置图片上下之间的行距
@property (nonatomic,assign)CGFloat albumMargins; //设置相册与图片之间的边距
@property (nonatomic,assign)UIControlEvents imageControlEventsA;//图片触发事件
@property (nonatomic,assign)UIControlEvents imageControlEventsTwo;//图片触发事件
@property (nonatomic,assign)BOOL multipleChoiceSwitch;//多选开关
@property (nonatomic,assign)HCAlbumPictureTypesettingType pictureTypesettingType; //排版方式
#pragma mark ---URL方式传入图片---

/**使用URL地址传入图片插入到相册指定位置中 0
 * @param url:图片地址
 * @param index:要插入的位置
 */
-(void)insetPictureURL:(NSURL*)url index:(NSInteger)index;

/**使用URL地址传入图片到相册末尾
 * @param url:图片地址
 */
-(void)addPictureURL:(NSURL*)url;

//设置背景图片
-(void)setBackgroundImage:(UIImage*)image;

#pragma mark ---Image方式传入图片---

/**使用URL地址传入图片插入到相册指定位置中 0
 * @param url:图片地址
 * @param index:要插入的位置
 */
-(void)insetPictureImage:(UIImage*)image index:(NSInteger)index;

/**使用Image增加图片到相册末尾
 * @param image:要增加的图片
 */
-(void)addPictureImage:(UIImage*)image;

/**更新加载图片
 * 更新HCAlbumScrollView中显示的图片
 */
-(void)updatePictures;

/**通过index下标移出图片
 *
 */
-(void)removePictureIndex:(NSInteger)index;
@end
