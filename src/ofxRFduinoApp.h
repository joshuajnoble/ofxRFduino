//
//  ofxRFduinoApp.h
//  rfduino
//
//  Created by Joshua Noble on 8/5/14.
//
//

#ifndef rfduino_ofxRFduinoApp_h
#define rfduino_ofxRFduinoApp_h

#include "RFDuino.h"

class ofxRFduinoApp
{
public:
    virtual void didDiscoverRFduino(RFduino *rfduino) = 0;
    virtual void didUpdateDiscoveredRFduino(RFduino *rfduino) = 0;
    virtual void didConnectRFduino(RFduino *rfduino) = 0;
    virtual void didLoadServiceRFduino(RFduino *rfduino) = 0;
    virtual void didDisconnectRFduino(RFduino *rfduino) = 0;
    
    virtual void receivedData( const char *data) = 0;
};
#endif
