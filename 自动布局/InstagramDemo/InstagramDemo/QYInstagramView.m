//
//  QYInstagramView.m
//  InstagramDemo
//
//  Created by qingyun on 16/1/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYInstagramView.h"
#import "Masonry.h"

#define kAvatarSize  CGSizeMake(35,35)

@implementation QYInstagramView

/**
 * 纯代码方式，走的init方法
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 1. 创建并添加子视图
        [self createAndAddSubviews];
        
        // 2. 设置子视图的属性
        [self setupSubviews];
    }
    return self;
}

/**
 * Storyboard/Xib方式，走的init方法
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        // 1. 创建并添加子视图
        [self createAndAddSubviews];
        
        // 2. 设置子视图的属性
        [self setupSubviews];
    }
    return self;
}

/**
 *  创建并添加子视图
 */
- (void)createAndAddSubviews {
    // 创建视图
    _avatarImageView = [UIImageView new];
    _nicknameLabel = [UILabel new];
    _timestampIndicator = [UIView new];
    _timestampLabel = [UILabel new];
    _contentImageView = [UIImageView new];
    _likeIndicator = [UIView new];
    _likesLabel = [UILabel new];
    _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 添加
    [self addSubview:_avatarImageView];
    [self addSubview:_nicknameLabel];
    [self addSubview:_timestampIndicator];
    [self addSubview:_timestampLabel];
    [self addSubview:_contentImageView];
    [self addSubview:_likeIndicator];
    [self addSubview:_likesLabel];
    [self addSubview:_likeButton];
    [self addSubview:_commentButton];
    [self addSubview:_moreButton];
}

/**
 *  设置子视图的属性
 */
- (void)setupSubviews {
    _avatarImageView.backgroundColor = [UIColor redColor];
    _avatarImageView.layer.cornerRadius = kAvatarSize.height/2.0;
    _avatarImageView.layer.masksToBounds = YES;
    
    _nicknameLabel.text = @"Dorayo";
    _nicknameLabel.textColor = [UIColor blueColor];
    _nicknameLabel.font = [UIFont systemFontOfSize:12];
    
    _timestampIndicator.backgroundColor = [UIColor greenColor];
    
    _timestampLabel.text = @"7小时";
    _timestampLabel.textColor = [UIColor lightGrayColor];
    _timestampLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    
    _contentImageView.backgroundColor = [UIColor purpleColor];
    
    _likeIndicator.backgroundColor = [UIColor orangeColor];
    
    _likesLabel.text = @"32个赞";
    _likesLabel.textColor = [UIColor blueColor];
    _likesLabel.font = _timestampLabel.font;
    
    _likeButton.backgroundColor = [UIColor grayColor];
    _commentButton.backgroundColor = [UIColor cyanColor];
    _moreButton.backgroundColor = [UIColor purpleColor];
}

#pragma mark - layout
- (void)updateConstraints {

    // 布局代码
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(20);
        make.size.mas_equalTo(kAvatarSize);
    }];
    
    [_nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatarImageView.mas_right).with.offset(10);
    }];
    
    [_timestampIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_timestampLabel.mas_left).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
    
    [_timestampLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-10);
        make.centerY.equalTo(@[_avatarImageView,_nicknameLabel,_timestampIndicator]);
    }];
    
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_avatarImageView.mas_bottom).with.offset(10);
        make.left.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self.mas_width);
    }];
    
    [_likeIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatarImageView);
        make.top.equalTo(_contentImageView.mas_bottom).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_likesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_likeIndicator);
        make.left.equalTo(_likeIndicator.mas_right).with.offset(10);
    }];
    
    [_likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_likeIndicator);
        make.top.equalTo(_likeIndicator.mas_bottom).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(50, 25));
    }];
    
    [_commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_likeButton.mas_right).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(60, 25));
    }];
    
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(40, 25));
        make.centerY.equalTo(@[_likeButton,_commentButton]);
    }];
    
    [super updateConstraints];
}

- (void)layoutSubviews {
    
}

@end




















