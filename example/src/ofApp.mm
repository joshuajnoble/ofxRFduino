#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup()
{
    //rfduinoManager = RFduinoManager.sharedRFduinoManager;
    
    rfduinoImpl = [[ofxRFduinoDelegate alloc] init];
    [rfduinoImpl setApplication:this];
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
	
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    unsigned char data[3];
    data[0] = '1';
    data[1] = '2';
    data[2] = '3';
    ofxRFDSendData(rfduinoImpl, &data[0], 3);
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}

//--------------------------------------------------------------
void ofApp::didDiscoverRFduino(RFduino *rfduino)
{
    cout << " didDiscoverRFduino " << endl;
    ofxRFDConnectRFduino(rfduino);
}

void ofApp::didUpdateDiscoveredRFduino(RFduino *rfduino)
{
    cout << " didUpdateDiscoveredRFduino " << endl;
}

void ofApp::didConnectRFduino(RFduino *rfduino)
{
    cout << " didConnectRFduino " << endl;
}

void ofApp::didLoadServiceRFduino(RFduino *rfduino)
{
    cout << " didLoadServiceRFduino " << endl;
}

void ofApp::didDisconnectRFduino(RFduino *rfduino)
{
    cout << " didDisconnectRFduino " << endl;
}

void ofApp::receivedData( const char *data)
{
    cout << " got some data! " << endl;
}
