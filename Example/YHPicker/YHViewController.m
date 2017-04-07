//
//  YHViewController.m
//  YHPicker
//
//  Created by lewis180777 on 04/07/2017.
//  Copyright (c) 2017 lewis180777. All rights reserved.
//

#import "YHViewController.h"
#import <YHPicker/YHPicker.h>

@interface YHViewController ()

@end

@implementation YHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[YHUIImagePicker sharedInstance] showImagePickerViewController:self selectImagePickerType:NO isVideo:NO withSucessBlock:^(id response) {
        
        
    }];
}

@end
