//
//  PlayerContentView.m
//  02-视频播放
//
//  Created by qingyun on 16/1/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "PlayerContentView.h"

@implementation PlayerContentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)setPlayer:(AVPlayer *)player{
    AVPlayerLayer *plLayer=[AVPlayerLayer playerLayerWithPlayer:player];
    plLayer.frame=self.layer.frame;
    [self.layer addSublayer:plLayer];
    _player=player;
}


@end
