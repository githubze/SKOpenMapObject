//
//  SKOpenMapObject.h
//  YOUKAJIA
//
//  Created by 阿汤哥 on 2019/10/26.
//  Copyright © 2019 YOUKAJIA. All rights reserved.
//
#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

#import <MapKit/MKMapItem.h>//用于苹果自带地图

#import <MapKit/MKTypes.h>//用于苹果自带地图
#import "JZLocationConverter.h"

NS_ASSUME_NONNULL_BEGIN

@interface SKOpenMapObject : NSObject

/**

*跳转到已经安装的地图

*@param coord        目标位置

*@param currentCoord 当前位置

*@return sheetAction

*/

+(UIAlertController *)getInstalledMapAppWithEndLocationBD09Map:(CLLocationCoordinate2D)coord1 GCJ02Map:(CLLocationCoordinate2D)coord WGS84:(CLLocationCoordinate2D)coord2 currentLocation:(CLLocationCoordinate2D)currentCoord;

@end

NS_ASSUME_NONNULL_END
