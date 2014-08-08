//
//  ofxRFduinoDelegateCpp.h
//  rfduino
//
//  Created by Joshua Noble on 8/6/14.
//
//

#ifndef rfduino_ofxRFduinoDelegateCpp_h
#define rfduino_ofxRFduinoDelegateCpp_h

bool ofxRFDisScanning();
void ofxRFDStartScan();

void ofxRFDStopScan();
void ofxRFDConnectRFduino(RFduino *rfduino);

void ofxRFDDisconnectRFduino(RFduino *rfduino);
void ofxRFDLoadedServiceRFduino(RFduino *rfduino);

void ofxRFDSendData(void * delegate, unsigned char *data, int length);

#endif
