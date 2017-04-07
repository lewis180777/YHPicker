//
//  YHUIImagePicker.m
//  XHNews
//
//  Created by 陈亦海 on 2016/11/21.
//  Copyright © 2016年 陈亦海. All rights reserved.
//

#import "YHUIImagePicker.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface YHUIImagePicker()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic,strong) UIImagePickerController *imagePickerController;
@property (nonatomic,weak) UIViewController *myVC;
@property (nonatomic,copy) YHImagePickerSucessBlock mySucessBlock;

@end

@implementation YHUIImagePicker

+ (instancetype)sharedInstance {
//    GCDExecOnce(^{
//        NSDLog(@"This will only be logged once.");
//    });  //只执行一次
//    GCDSharedInstance(^{
//        return [[self class] new];
//    });  //创建一个单例
    
    return [[self class] new];
}

-(UIImagePickerController *)imagePickerController{
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        _imagePickerController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        _imagePickerController.allowsEditing = YES;
        //录制视频时长，默认10s
        _imagePickerController.videoMaximumDuration = 15;
        //视频上传质量
        //UIImagePickerControllerQualityTypeHigh高清
        //UIImagePickerControllerQualityTypeMedium中等质量
        //UIImagePickerControllerQualityTypeLow低质量
        //UIImagePickerControllerQualityType640x480
        _imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    }
    return _imagePickerController;
}

-(instancetype)init{
    if (self == [super init]) {
        
        
    }
    return self;
}

#pragma mark 调用方法
-(void)showImagePickerViewController:(UIViewController *)viewController selectImagePickerType:(BOOL)type isVideo:(BOOL)video withSucessBlock:(YHImagePickerSucessBlock)sucessBlock{
    
//    dispatch_async(dispatch_get_main_queue(), ^{
    
    
    
    self.myVC = viewController;
    self.mySucessBlock = sucessBlock;
    if (type) {
        
        // 判断是否支持相机
        if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){ //
            NSLog(@"不支持相机");
            return;
        }

        
        [self selectImageFromCamera];
        
        //        //相机类型（拍照、录像...）字符串需要做相应的类型转换
        self.imagePickerController.mediaTypes = @[video ? (NSString *) kUTTypeMovie : (NSString *)kUTTypeImage];
        //设置摄像头模式（拍照，录制视频）为拍照模式
        self.imagePickerController.cameraCaptureMode = video ?UIImagePickerControllerCameraCaptureModeVideo : UIImagePickerControllerCameraCaptureModePhoto;

        

    }
    else{
        [self selectImageFromAlbum];
        self.imagePickerController.mediaTypes = [[NSArray alloc] initWithObjects: video ? (NSString *) kUTTypeMovie : (NSString *)kUTTypeImage, nil];
       
    }
    
    
    
    
    
//    if([[[UIDevice
//          currentDevice] systemVersion] floatValue]>=8.0) {
//        
//        self.imagePickerController.modalPresentationStyle=UIModalPresentationOverCurrentContext;
//        self.myVC.modalPresentationStyle=UIModalPresentationOverCurrentContext;
//        
//    }
    
    [self.myVC presentViewController:self.imagePickerController animated:YES completion:nil];
    
    
    
//    NSDLog(@"我来了");
//    [[GCDQueue mainQueue] queueBlock:^{
//        NSDLog(@"我执行了");
//        [self takePicture];
//    } afterDelay:2.f];
//   
//    NSDLog(@"我结束了");
        
//    });
}

#pragma mark 从摄像头获取图片或视频
- (void)selectImageFromCamera
{
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    
}

#pragma mark 从相册获取图片或视频
- (void)selectImageFromAlbum
{
    //NSLog(@"相册");
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;

    

}

#pragma mark 自动拍照
- (void)takePicture{
    
    [self.imagePickerController takePicture];
    
    
}

- (void)startVideoCapture{
    [self.imagePickerController startVideoCapture];
}

#pragma mark UIImagePickerControllerDelegate
//该代理方法仅适用于只选取图片时
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    NSLog(@"选择完毕----image:%@-----info:%@",image,editingInfo);
    
    if (self.mySucessBlock) {
        
        self.mySucessBlock(image);
    }
    
    [self.myVC dismissViewControllerAnimated:YES completion:nil];
    
}


//适用获取所有媒体资源，只需判断资源类型
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    //判断资源类型
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        //如果是图片
        UIImage *image = info[UIImagePickerControllerEditedImage];
        if (self.mySucessBlock) {
            
            self.mySucessBlock(image);
        }
        
//        //保存图片至相册
//        UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
//        //上传图片
//        [self uploadImageWithData:fileData];
        
    }else{
        //如果是视频
        NSURL *url = info[UIImagePickerControllerMediaURL];
//        //播放视频
//        _moviePlayer.contentURL = url;
//        [_moviePlayer play];
        //保存视频至相册（异步线程）
//        NSString *urlStr = [url path];
//        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlStr)) {
//                
//                UISaveVideoAtPathToSavedPhotosAlbum(urlStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
//            }
//        });
//        NSData *videoData = [NSData dataWithContentsOfURL:url];
        
        if (self.mySucessBlock) {
            
            self.mySucessBlock(url);
        }
        
        //显示视频
//        NSURL *url = [NSURL fileURLWithPath:videoPath];
//        _player = [AVPlayer playerWithURL:url];
//        AVPlayerLayer *playerLayer=[AVPlayerLayer playerLayerWithPlayer:_player];
//        playerLayer.frame = self.imgView.frame;
//        [self.imgView.layer addSublayer:playerLayer];
//        [_player play];
        
        //视频上传
//        [self uploadVideoWithData:videoData];
    }
    [self.myVC dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 取消选择
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [self.myVC dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 图片保存完毕的回调
- (void) image: (UIImage *) image didFinishSavingWithError:(NSError *) error contextInfo: (void *)contextInf{
    
}

#pragma mark 视频保存完毕的回调
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInf{
    if (error) {
        NSLog(@"保存视频过程中发生错误，错误信息:%@",error.localizedDescription);
    }else{
        NSLog(@"视频保存成功.");
    }
}

@end
