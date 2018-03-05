//
//  ViewController.m
//  MobileAbility
//
//  Created by 李保磊 on 2018/3/5.
//  Copyright © 2018年 USTC Sinovate Software Co.,Ltd. All rights reserved.
//

#import "ViewController.h"
#import <MobileAbilityFramework/WebViewJavascriptBridge.h>

@interface ViewController ()<UIWebViewDelegate>
@property WebViewJavascriptBridge *bridge;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIWebView *webView = [[UIWebView alloc]
                          initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width,
                                                   self.view.bounds.size.height)];
    webView.delegate = self;
    webView.scalesPageToFit = YES; //自动
    
    webView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:webView];
    
     [[GCAbility abilityInstnace] startEngine:webView];
    
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"Src"]]]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
