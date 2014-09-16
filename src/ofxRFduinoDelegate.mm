//
//  whatever.m
//  rfduino
//
//  Created by Joshua Noble on 8/6/14.
//
//

#import "ofxRFduinoDelegate.h"

@implementation ofxRFduinoDelegate

@synthesize connectedRFduino;

- (id) init
{
    rfduinoManager = [RFduinoManager sharedRFduinoManager];
    rfduinoManager.delegate = self;
    return self;
}


bool ofxRFDIsScanning()
{
    return [[RFduinoManager sharedRFduinoManager] isScanning];
}

void ofxRFDStartScan()
{
    return [[RFduinoManager sharedRFduinoManager] startScan];
}

void ofxRFDStopScan()
{
    return [[RFduinoManager sharedRFduinoManager] stopScan];
}

void ofxRFDConnectRFduino(RFduino *rfduino)
{
    return [[RFduinoManager sharedRFduinoManager] connectRFduino:rfduino];
}

void ofxRFDDisconnectRFduino(RFduino *rfduino)
{
    return [[RFduinoManager sharedRFduinoManager] disconnectRFduino:rfduino];
}

void ofxRFDLoadedServiceRFduino(RFduino *rfduino)
{
    return [[RFduinoManager sharedRFduinoManager] loadedServiceRFduino:rfduino];
}

void ofxRFDSendData(void * delegate, unsigned char* data, int length) {
    NSData *nsdata = [NSData dataWithBytes:(void*)data length:length];
    return [(id) delegate sendData:nsdata];
}

std::string ofxRFDGetName( RFduino *rfduino)
{
    std::string name([rfduino.name UTF8String]);
    return name;
}


- (void)setApplication:(ofxRFduinoApp *)app
{
    application = app;
}


- (void)sendData:(NSData*) data
{
    [connectedRFduino send:data];
}

- (void)didReceive:(NSData *)data
{
    NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    const char *cString = [newStr UTF8String];
    application->receivedData(cString);
}

- (void)didDiscoverRFduino:(RFduino *)rfduino
{
    application->didDiscoverRFduino(rfduino);
}

- (void)didUpdateDiscoveredRFduino:(RFduino *)rfduino
{
    application->didUpdateDiscoveredRFduino(rfduino);
}

- (void)didConnectRFduino:(RFduino *)rfduino
{
    [rfduino setDelegate:self];
    connectedRFduino = rfduino;
    application->didConnectRFduino(rfduino);
}

- (void)didLoadServiceRFduino:(RFduino *)rfduino
{
    application->didLoadServiceRFduino(rfduino);
}

- (void)didDisconnectRFduino:(RFduino *)rfduino
{
    application->didDisconnectRFduino(rfduino);
}

@end