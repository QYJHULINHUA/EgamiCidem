//
//  GLES_ImageData.m
//  IHFMedicImage2.0
//
//  Created by Yoser on 2/19/16.
//  Copyright © 2016 Hanrovey. All rights reserved.
//

#import "GLES_ImageData.h"

@implementation GLES_ImageData
// 自动合成
@synthesize imageData = _imageData;
@synthesize height = _height;
@synthesize width = _width;
@synthesize isUnsigned = _isUnsigned;

- (CGFloat)height
{
    return _imageData.size.height;
}

- (CGFloat)width
{
    return _imageData.size.width;
}

- (instancetype)initWithImage:(UIImage *)image Isunsigned:(BOOL)isUnsigned
{
    if(self == [super init])
    {
        self.imageData = image;
        self.isUnsigned = isUnsigned;
        
    }
    return self;
}

- (CGSize)size
{
    return _imageData.size;
}

+ (instancetype)GLESWithImage:(UIImage *)image Isunsigned:(BOOL)isUnsigned
{
    return [[GLES_ImageData alloc] initWithImage:image Isunsigned:isUnsigned];
}

@end
