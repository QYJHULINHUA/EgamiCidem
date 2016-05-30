//
//  IHFMD_2D_dcmPictureInfo.h
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/30.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IHFMD_2D_dcmPictureInfo : NSObject

@property (nonatomic ,strong)NSString *imageData;//0023

@property (nonatomic ,strong)NSString *sliceThickness;//0050

@property (nonatomic ,strong)NSString *defaultWL;//1050

@property (nonatomic ,strong)NSString *defaultWW;//1051

@property (nonatomic ,strong)NSString *img_Orientation;//0037

@property (nonatomic ,strong)NSString *sliceLocation; //1041(图像位置)


@end


