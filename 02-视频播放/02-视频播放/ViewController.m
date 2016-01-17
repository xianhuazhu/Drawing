//
//  ViewController.m
//  02-视频播放
//
//  Created by qingyun on 16/1/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "PlayerContentView.h"

#define PLAYURL @"http://7xpypo.com2.z0.glb.qiniucdn.com/job_%E5%B8%83%E5%B0%94%E6%95%99%E8%82%B2_%E7%87%95%E5%8D%81%E5%85%AB_MySQL%E8%BD%BB%E5%BF%AB%E5%85%A5%E9%97%A8.001.%E8%AE%A4%E8%AF%86%E5%B9%B6%E5%AE%89%E8%A3%85MySQL.wmv"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressVIew;
@property (weak, nonatomic) IBOutlet UISlider *sliderView;
@property (weak, nonatomic) IBOutlet UIButton *playeBtn;
@property (strong,nonatomic)AVPlayerItem *playeItem;
@property (assign,nonatomic)BOOL isPlaying;//当前是播放还是暂停

@property (weak, nonatomic) IBOutlet PlayerContentView *contentVIew;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url=[NSURL URLWithString:PLAYURL];
    _playeItem=[AVPlayerItem playerItemWithURL:url];

    //kvo
    [self.playeItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:NULL];
    //监听status属性
    [self.playeItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:NULL];
    //监听缓冲的进度
    
    AVPlayer *player=[[AVPlayer alloc] initWithPlayerItem:_playeItem];
    self.contentVIew.player=player;
    
// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)playStatueAction:(UIButton *)sender {
    if(_isPlaying){
        //暂停
        [self.contentVIew.player pause];
        [sender setTitle:@"播放" forState:UIControlStateNormal];
        
    }else{
        [self.contentVIew.player play];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
    }
    _isPlaying=!_isPlaying;
}
//监听播放状态
-(void)monitoringPalyBack:(AVPlayerItem *)playeItem{
    
    [self.contentVIew.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:NULL usingBlock:^(CMTime time) {
        //每秒钟更新进度条
        CGFloat currentSeconds=playeItem.currentTime.value/playeItem.currentTime.timescale;
        [self.sliderView setValue:currentSeconds animated:YES];
    }];

}

-(void)videoSlider:(CGFloat)duration{
    self.sliderView.maximumValue=duration;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    AVPlayerItem *itemObjc=(AVPlayerItem *)object;
    
    if ([keyPath isEqualToString:@"status"]) {
        if (itemObjc.status==AVPlayerStatusReadyToPlay) {
        //正在播放
        //视频总时长
       CMTime time=itemObjc.duration;
       CGFloat totalSeconds= time.value/time.timescale;//秒
       //更新silder最大最小值
       [self videoSlider:totalSeconds];
       [self monitoringPalyBack:itemObjc];
       }else if (itemObjc.status==AVPlayerStatusFailed){
            NSLog(@"AVPlayerStatusFailed");
        }
        
    }else if ([keyPath isEqualToString:@"loadedTimeRanges"]){
    //计算缓冲进度
     NSTimeInterval value=[self avialDuration];
      
     //视频总时长
      CMTime time=itemObjc.duration;
      NSTimeInterval duration=CMTimeGetSeconds(time);
      //更新缓冲进度条
     [self.progressVIew setProgress:value/duration];
    }
}

-(NSTimeInterval)avialDuration{
//获取当前是那个item对象
  AVPlayerItem *item =[self.contentVIew.player currentItem];
//获取当前缓冲的进度
  NSArray *loadArr=[item  loadedTimeRanges];
  NSValue *value =[loadArr firstObject];
  //获取缓冲区
  CMTimeRange range=[value CMTimeRangeValue];
  float startSeconds=CMTimeGetSeconds(range.start);
  float durationSeconds=CMTimeGetSeconds(range.duration);


    return startSeconds+durationSeconds;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
