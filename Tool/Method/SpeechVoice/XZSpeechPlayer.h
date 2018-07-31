//
//  XZSpeechController.h
//  闲职
//
//  Created by 吴添培 on 2018/3/13.
//  Copyright © 2018年 xianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface XZSpeechPlayer : NSObject
//语音合成对象
@property (nonatomic,strong,readonly) AVSpeechSynthesizer *synthesizer;

//语音转化的文本
@property (nonatomic,copy) NSString *speechString;

@property (nonatomic,assign) NSInteger volume;

// 实例化语音合成控制器
+ (instancetype)shareSpeechPlayer;

- (void)begin;

- (void)stop;

- (void)pause;

- (void)continueSpeak;

@end
