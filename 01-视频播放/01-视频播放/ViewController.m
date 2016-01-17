//
//  ViewController.m
//  01-视频播放
//
//  Created by qingyun on 16/1/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

#define  PLAYURL @"http://7xpypo.com2.z0.glb.qiniucdn.com/job_%E5%B8%83%E5%B0%94%E6%95%99%E8%82%B2_%E7%87%95%E5%8D%81%E5%85%AB_MySQL%E8%BD%BB%E5%BF%AB%E5%85%A5%E9%97%A8.001.%E8%AE%A4%E8%AF%86%E5%B9%B6%E5%AE%89%E8%A3%85MySQL.wmv"
@interface ViewController ()
@end

@implementation ViewController

- (IBAction)playAction:(id)sender {
    
#if 0
   //1.生成播放器
    //1.item对象
    AVPlayerItem *item=[AVPlayerItem playerItemWithURL:[NSURL URLWithString:PLAYURL]];
   
    AVPlayer *palyer=[[AVPlayer alloc] initWithPlayerItem:item];
    //2.生成layer
    AVPlayerLayer *playeLayer=[AVPlayerLayer playerLayerWithPlayer:palyer];

    playeLayer.frame=self.view.bounds;
    //设置屏幕填充
    playeLayer.videoGravity=AVLayerVideoGravityResizeAspect;
    
    [self.view.layer addSublayer:playeLayer];
    
    //3.播放
    [palyer play];
#endif
   
    AVPlayerViewController *avPlayController=[[AVPlayerViewController alloc] init];
    //显示控制面板
    avPlayController.showsPlaybackControls=YES;
    
    AVPlayerItem *playeItem=[[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:PLAYURL]];
    
    AVPlayer *avplayer=[[AVPlayer alloc] initWithPlayerItem:playeItem];
    
    avPlayController.player=avplayer;


    [self.navigationController presentViewController:avPlayController animated:YES completion:^{
        //播放视频
        [avPlayController.player play];

    }];
}

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
