//
//  IHFMD_2D_SeriesMHD.h
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/30.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IHFMD_2D_dcmPictureInfo.h"



struct dicSize{
    float dicSizeX;
    float dicSizeY;
    float dicSizeZ;
};

/**!
 * spacing 像素点间距
 */
struct dicSpacing{
    float spacing_x;
    float spacing_y;
    float spacint_z;
};

@interface IHFMD_2D_SeriesMHD : NSObject

@property (nonatomic ,assign)struct dicSize dimSizeXYZ;

@property (nonatomic ,assign)struct dicSpacing spacvalue;

@property (nonatomic ,strong)NSDictionary *mhdJson;

@property (nonatomic ,strong)NSString *patientSex;

@property (nonatomic ,strong)NSString *patientBirthday;

@property (nonatomic ,strong)NSString *institutionName;

@property (nonatomic ,strong)NSString *manufactureModelName;

@property (nonatomic ,strong)NSString *patientName;

@property (nonatomic ,strong)NSString *bodyPart;

@property (nonatomic ,strong)NSString *modality;

@property (nonatomic ,strong)NSString *manufacture;

@property (nonatomic ,strong)NSString *gapBetweenSlice;

@property (nonatomic ,strong)NSString *rows;

@property (nonatomic ,strong)NSString *columns;

@property (nonatomic ,strong)NSArray *dcmArr;

@property (nonatomic ,strong)NSMutableArray *dcmPictrueInfoArray;

@property (nonatomic ,assign)BOOL isUnsigned;

/*!
 *  @author hulinhua, 16-04-29 15:04:33
 *
 *  @brief 是否为反射，默认为no
 */
@property (assign, nonatomic)BOOL reflex;

@end


