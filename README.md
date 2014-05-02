BasicMultipeer
==============

A shell for a basic implementation of the Multipeer Connectivity framework. Produced for a presentation at iOS DevCamp 2014

This entire project consists mostly of 13 lines of code.

## Getting Started
To fully understand how this application works, you will need to build it onto two separate devices running iOS 7.1 or greater (The framework is available starting in iOS 7, but this was just a sample application, so the default build settings were left alone).

One one device, tap on "Start Browsing" to bring up an instance of `MCBrowserViewController`. On the other device, tap on "Start Advertising" to instantiate and start an instance of `MCAdvertiserAssistant`.

Next, you should see an entry appear in the `MCBrowserViewController`, representing the device that is acting as the advertising peer. Tapping this row will send an invitation to the advertiser to connect.

On the advertiser, you'll see a `UIAlertView` asking if you would like to accept the invitation from the browser. Tap `Accept`, and the two apps will be connected and ready to send data.
