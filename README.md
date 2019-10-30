# SKOpenMapObject
跳转地图导航封装

How to use ?

UIAlertController *alert = [SKOpenMapObject getInstalledMapAppWithEndLocation:self.currentLocation currentLocation:coordinate];

[self presentViewController:alert animated:YES completion:nil];
