//
//  ViewController.m
//  WebSocket
//
//  Created by natsuki.hirose on 2016/11/15.
//  Copyright © 2016年 natsuki.hirose. All rights reserved.

#import "ViewController.h"
#import "SRWebSocket.h"

@interface ViewController ()<SRWebSocketDelegate>

@property(nonatomic, strong)SRWebSocket *web_socket;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _web_socket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://localhost:3000/"]]];
    [_web_socket setDelegate:self];
    [_web_socket open];
    NSTimer *aTimer;
    
    aTimer = [NSTimer
            timerWithTimeInterval:3
            target:self
              selector:@selector(sendToServer)
            userInfo: nil repeats:YES];
    
    [[NSRunLoop mainRunLoop]
        addTimer:aTimer
        forMode:NSDefaultRunLoopMode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket{
    [webSocket send:@"123"];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSLog(@"%@", [message description]);
}

- (void)sendToServer {
    [_web_socket send:@"aaa"];
}

@end
