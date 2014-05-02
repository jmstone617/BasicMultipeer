//
//  BMPViewController.m
//  BasicMultipeer
//
//  Created by Stone, Jordan Matthew (US - Denver) on 5/1/14.
//  Copyright (c) 2014 Jordan Stone. All rights reserved.
//

#import "BMPViewController.h"
@import MultipeerConnectivity;

@interface BMPViewController () <MCAdvertiserAssistantDelegate, MCBrowserViewControllerDelegate>

@property (nonatomic, strong) MCAdvertiserAssistant *advertiserAssistant;

@end

@implementation BMPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startBrowsingTapped:(id)sender {
    MCPeerID *peerID = [[MCPeerID alloc] initWithDisplayName:@"JMS-Browser"];
    
    MCSession *session = [[MCSession alloc] initWithPeer:peerID];
    
    MCBrowserViewController *browserViewController = [[MCBrowserViewController alloc] initWithServiceType:@"jms-bsc-mltipr" session:session];
    [browserViewController setDelegate:self];
    
    [self presentViewController:browserViewController animated:YES completion:NULL];
}

- (IBAction)startAdvertisingTapped:(id)sender {
    MCPeerID *peerID = [[MCPeerID alloc] initWithDisplayName:@"JMS-Advertiser"];
    
    MCSession *session = [[MCSession alloc] initWithPeer:peerID];
    
    self.advertiserAssistant = [[MCAdvertiserAssistant alloc] initWithServiceType:@"jms-bsc-mltipr" discoveryInfo:nil session:session];
    [self.advertiserAssistant setDelegate:self];
    
    [self.advertiserAssistant start];
}

#pragma mark - MCAdvertiserAssistantDelegate Methods
- (void)advertiserAssitantWillPresentInvitation:(MCAdvertiserAssistant *)advertiserAssistant {
    NSLog(@"Incoming invitation...");
}

- (void)advertiserAssistantDidDismissInvitation:(MCAdvertiserAssistant *)advertiserAssistant {
    NSLog(@"Invitation dismissed.");
}

#pragma mark - MCBrowserViewControllerDelegate Methods
- (BOOL)browserViewController:(MCBrowserViewController *)browserViewController shouldPresentNearbyPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info {
    // You could check here to only present peers with certain names or peers exposing particular discovery info dictionaries.
    
    // For our purposes, we'll just return YES to show everyone
    return YES;
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    // It's safe to start sending data to peers now
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    // User tapped 'Cancel' on the view controller
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
