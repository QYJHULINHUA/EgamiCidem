//
//  IHFMD_2D_SeriesMHD.m
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/30.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import "IHFMD_2D_SeriesMHD.h"

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <sstream>
#include <cmath>
#include <limits>
#include <cstring>

@implementation IHFMD_2D_SeriesMHD

using namespace std;

- (void)setMhdJson:(NSDictionary *)mhdJson
{
    _mhdJson = mhdJson;
    
    NSDictionary *sametagDic = mhdJson[@"sametag"];
    NSDictionary *difftagDic = mhdJson[@"difftag"];
    
    _patientSex = sametagDic[@"0010|0040"];
    _patientBirthday = sametagDic[@"0010|0030"];
    _institutionName = sametagDic[@"0008|0080"];
    _manufactureModelName = sametagDic[@"0008|1090"];
    _patientName = sametagDic[@"0010|0010"];
    _bodyPart = sametagDic[@"0018|0015"];
    _modality = sametagDic[@"0008|0060"];
    _manufacture = sametagDic[@"0008|0070"];
    _gapBetweenSlice = sametagDic[@"0018|0088"];
    _rows = sametagDic[@"0028|0010"];
    _columns = sametagDic[@"0028|0011"];
    NSString *pixelSpacing = sametagDic[@"0028|0030"];
    if ([pixelSpacing isEqualToString:@""] || pixelSpacing == nil) {
        if ([sametagDic.allKeys containsObject:@"0018|1164"]) {
            pixelSpacing = sametagDic[@"0018|1164"];
        }
    }
    
    string str = [pixelSpacing UTF8String];
    string space_x(str.substr(0, str.find_last_of("\\")));
    string space_y(str.substr(str.find_first_of("\\") + 1),0);
    
    _spacvalue.spacing_x = atof(space_x.c_str());
    _spacvalue.spacing_y = atof(space_y.c_str());
    _spacvalue.spacint_z = 1;
    
    NSString *rgb = sametagDic[@"0028|0004"];
    
    if ([rgb isEqualToString:@"MONOCHROME1"]) {
        _reflex = YES;
    }
    
    _isUnsigned = ![sametagDic[@"0028|0103"] boolValue];
    
    NSString *special = sametagDic[@"6000|0102"];
    BOOL isSpecial = NO;
    if([special isEqualToString:@"1"] ||[special isEqualToString:@"0"])
    {
        isSpecial = YES;
    }
    
    BOOL isRGB = [rgb isEqualToString:@"RGB"];
    NSString *secondaryInfo = sametagDic[@"0008|0008"];
    BOOL isSECONDARY = [secondaryInfo containsString:@"SECONDARY"];
    if([_modality isEqualToString:@"CT"] && _isUnsigned)
    {
        if(isRGB)
        {
            
        }else if(!isSECONDARY)
        {
            _isUnsigned =  !_isUnsigned;
        }else if(!isSpecial)
        {
            _isUnsigned = !_isUnsigned;
        }
    }
    

    _dcmArr = [difftagDic.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *  _Nonnull obj1, NSString *  _Nonnull obj2) {
        return [obj1 compare: obj2];
    }];
    
    _dimSizeXYZ.dicSizeX = _rows.integerValue;
    _dimSizeXYZ.dicSizeY = _columns.integerValue;
    _dimSizeXYZ.dicSizeZ = _dcmArr.count;
    
    _dcmPictrueInfoArray = [NSMutableArray array];
    for (NSString *key in _dcmArr) {
        NSDictionary *dcmInfoDic = difftagDic[key];
        
        IHFMD_2D_dcmPictureInfo *dcmInfo = [IHFMD_2D_dcmPictureInfo new];
        dcmInfo.imageData = dcmInfoDic[@"0008|0023"];
        dcmInfo.sliceThickness = dcmInfoDic[@"0018|0050"];
        dcmInfo.defaultWL = dcmInfoDic[@"0028|1050"];
        dcmInfo.defaultWW = dcmInfoDic[@"0028|1051"];
        dcmInfo.sliceLocation = dcmInfoDic[@"0020|1041"];
        
        const char *tempStr = [dcmInfoDic[@"0020|0037"] UTF8String];
        std::string temp(tempStr);
        if(temp.empty())
        {
            dcmInfo.img_Orientation = @"TRA";
        }else
        {
            string orientation = getOrientation(tempStr);
            dcmInfo.img_Orientation = [NSString stringWithUTF8String:orientation.c_str()];
        }
        [_dcmPictrueInfoArray addObject:dcmInfo];
        
    }
    
    
}


string getOrientation(const char *orient)  //0020|0037
{
    
    stringstream ss;
    ss.clear();
    ss.str(orient);
    double pDir[6];
    char c;
    for (int i = 0; i < 6; ++i) {
        ss>>pDir[i]>>c;
    }
    
    float dir[3];
    dir[0] = fabs(pDir[1] * pDir[5] - pDir[4] * pDir[2]);
    dir[1] = fabs(pDir[3] * pDir[2] - pDir[0] * pDir[5]);
    dir[2] = fabs(pDir[0] * pDir[4] - pDir[1] * pDir[3]);
    double dTol = 0.0000001;
    float max = dir[0] - dir[1] >= dTol ? dir[0] : dir[1];
    max = max - dir[2] >= dTol ? max : dir[2];
    if (fabs(max - dir[0]) <= dTol)
    {
        return "SAG";
    }
    else if (fabs(max - dir[1]) <= dTol)
    {
        return "COR";
    }
    else
    {
        return "TRA";
    }
}

@end
