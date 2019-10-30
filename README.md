# SKOpenMapObject
跳转地图导航封装

How to use ?

UIAlertController *alert = [SKOpenMapObject getInstalledMapAppWithEndLocationBD09Map:coordinate GCJ02Map:coordinate1 WGS84:coordinate2 currentLocation:self.currentLocation];

[weakself presentViewController:alert animated:YES completion:nil];
