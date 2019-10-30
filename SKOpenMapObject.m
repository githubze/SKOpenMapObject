//
//  SKOpenMapObject.m
//  YOUKAJIA
//
//  Created by 阿汤哥 on 2019/10/26.
//  Copyright © 2019 YOUKAJIA. All rights reserved.
//

#import "SKOpenMapObject.h"

@implementation SKOpenMapObject

+(UIAlertController *)getInstalledMapAppWithEndLocationBD09Map:(CLLocationCoordinate2D)coord1 GCJ02Map:(CLLocationCoordinate2D)coord WGS84:(CLLocationCoordinate2D)coord2 currentLocation:(CLLocationCoordinate2D)currentCoord

{
    NSLog(@"%f----%f",coord.longitude,coord.latitude);
    //    调用地图
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:@"前往导航" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //百度地图
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://map/"]]) {
        
        UIAlertAction *baiduMapAction = [UIAlertAction actionWithTitle:@"百度地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *baiduParameterFormat = @"baidumap://map/direction?origin=latlng:%f,%f|name:我的位置&destination=latlng:%f,%f|name:终点&mode=driving";
            
            NSString *urlString = [[NSString stringWithFormat:
                                    
                                    baiduParameterFormat,
                                    
                                    currentCoord.latitude,//用户当前的位置
                                    
                                    currentCoord.longitude,//用户当前的位置
                                    
                                    coord1.latitude,
                                    
                                    coord1.longitude]
                                   
                                   stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            
        }];
        
        [actionSheet addAction:baiduMapAction];
        
    }
    
    //高德地图
    
    //iosamap://path?sourceApplication=applicationName&sid=BGVIS1&sname=%@&did=BGVIS2&dname=%@&dev=0&t=0
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://map/"]]) {
        
        UIAlertAction *gaodeMapAction = [UIAlertAction actionWithTitle:@"高德地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *gaodeParameterFormat = @"iosamap://navi?sourceApplication=%@&backScheme=%@&poiname=%@&lat=%f&lon=%f&dev=1&style=2";
            
            NSString *urlString = [[NSString stringWithFormat:
                                    
                                    gaodeParameterFormat,
                                    
                                    @"优卡加",
                                    
                                    @"com.youkajia.www",
                                    
                                    @"终点",
                                    
                                    coord2.latitude,
                                    
                                    coord2.longitude]
                                   
                                   stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            
        }];
        
        [actionSheet addAction:gaodeMapAction];
        
    }
    
    //苹果地图
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"苹果地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //起点
        
        MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
        
        CLLocationCoordinate2D desCorrdinate = CLLocationCoordinate2DMake(coord.latitude, coord.longitude);
        
        //终点
        
        MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:desCorrdinate addressDictionary:nil]];
        
        //默认驾车
        
        [MKMapItem openMapsWithItems:@[currentLocation, toLocation]
         
                       launchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving,
                                       
                                       MKLaunchOptionsMapTypeKey:[NSNumber numberWithInteger:MKMapTypeStandard],
                                       
                                       MKLaunchOptionsShowsTrafficKey:[NSNumber numberWithBool:YES]}];
        
    }]];
    
    //腾讯地图
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://map/"]]) {
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"腾讯地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *QQParameterFormat = @"qqmap://map/routeplan?type=drive&fromcoord=%f, %f&tocoord=%f,%f&coord_type=1&policy=0&refer=%@";
            
            NSString *urlString = [[NSString stringWithFormat:
                                    
                                    QQParameterFormat,
                                    
                                    currentCoord.latitude,//用户当前的位置
                                    
                                    currentCoord.longitude,//用户当前的位置
                                    
                                    coord.latitude,
                                    
                                    coord.longitude,
                                    
                                    @"优卡加"]
                                   
                                   stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            
        }]];
        
    }
    
    //谷歌地图
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://map/"]]) {
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"谷歌地图"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *urlString = [[NSString stringWithFormat:@"comgooglemaps://?x-source=%@&x-success=%@&saddr=&daddr=%f,%f&directionsmode=driving",
                                    
                                    @"优卡加",
                                    
                                    @"com.youkajia.www",
                                    
                                    coord.latitude,
                                    
                                    coord.longitude]
                                   
                                   stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            
        }]];
        
    }
    
    //取消按钮
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        [actionSheet dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
    [actionSheet addAction:action3];
    
    return actionSheet;
    
}


@end
