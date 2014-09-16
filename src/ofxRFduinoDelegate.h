//
//  ofxRFduinoAppImpl.h
//  rfduino
//
//  Created by Joshua Noble on 8/5/14.
//
//

#pragma once

#import <Foundation/Foundation.h>
#import "RFduinoManagerDelegate.h"
#import "RFduinoManager.h"
#import "ofxRFduinoApp.h"
#import <string>

@class RFduinoManager;
@class RFduino;

@interface ofxRFduinoDelegate : UIResponder<RFduinoManagerDelegate, RFduinoDelegate>
{
    ofxRFduinoApp *application;
    
    @public
    RFduinoManager *rfduinoManager;
}

@property(strong, nonatomic) RFduino *connectedRFduino;

- (id) init;

- (void)setApplication:(ofxRFduinoApp *)app;
- (void)didDiscoverRFduino:(RFduino *)rfduino;
- (void)didUpdateDiscoveredRFduino:(RFduino *)rfduino;
- (void)didConnectRFduino:(RFduino *)rfduino;
- (void)didLoadServiceRFduino:(RFduino *)rfduino;
- (void)didDisconnectRFduino:(RFduino *)rfduino;

- (void)sendData:(NSData*) data;

@end

