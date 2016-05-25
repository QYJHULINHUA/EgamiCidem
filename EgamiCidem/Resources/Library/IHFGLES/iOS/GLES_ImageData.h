//
//  GLES_ImageData.h
//  IHFMedicImage2.0
//
//  Created by Yoser on 2/19/16.
//  Copyright © 2016 Hanrovey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GLES_ImageData : NSObject

/*!
 *  图像数据源
 */
@property (strong, nonatomic) UIImage *imageData;

/*!
 *  是否为有符号数
 */
@property (assign, nonatomic) BOOL isUnsigned;

/*!
 *  高度
 */
@property (assign, nonatomic) CGFloat height;

/*!
 *  宽度
 */
@property (assign, nonatomic) CGFloat width;

/*!
 *  尺寸
 */
@property (assign, nonatomic) CGSize size;



+ (instancetype)GLESWithImage:(UIImage *)image Isunsigned:(BOOL)isUnsigned;

@end
