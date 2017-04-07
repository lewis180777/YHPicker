//
//  YHUIImagePicker.h
//  XHNews
//
//  Created by 陈亦海 on 2016/11/21.
//  Copyright © 2016年 陈亦海. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void    (^YHImagePickerSucessBlock)(id response) ;

@interface YHUIImagePicker : NSObject

/**
 *  初始化tabbar
 *
 *  @return YHUIImagePicker
 */
+ (instancetype)sharedInstance;

/**
 *  调用相册 相机功能方法
 *
 *  @param viewController 在那个控制使用传进来
 *  @param type           YES 是相机 NO是相册
 *  @param video          YES 是录制视频 NO是照相
 *  @param sucessBlock    成功回调
 */
-(void)showImagePickerViewController:(UIViewController *)viewController selectImagePickerType:(BOOL)type isVideo:(BOOL)video withSucessBlock:(YHImagePickerSucessBlock)sucessBlock;

- (void)takePicture;

- (void)startVideoCapture;

@end
