//
//  XZSpeechController.m
//  闲职
//
//  Created by 吴添培 on 2018/3/13.
//  Copyright © 2018年 xianzhi. All rights reserved.
//

#import "XZSpeechPlayer.h"

@interface XZSpeechPlayer ()
//语音合成对象
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;

@property (nonatomic,strong) AVSpeechUtterance *utterance;

@end

@implementation XZSpeechPlayer

+ (instancetype)shareSpeechPlayer{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
        {
            return self;
        }
        // 初始化语音合成器
        _synthesizer = [[AVSpeechSynthesizer alloc]init];
        _volume = 1;
    }
    return self;
}

-(void)setSpeechString:(NSString *)speechString{
    _speechString = speechString;
    [self begin];
}

-(void)setVolume:(NSInteger)volume{
    _volume = volume;
    _utterance.volume = volume;
}

- (void)begin{
    NSString *speechString = [NSString stringWithFormat:@"%@",_speechString];
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:speechString];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];//语言
    utterance.volume = _volume;
    utterance.pitchMultiplier = 0.8;//音调
    utterance.rate = 0.5;//说话速率
    //iOS语音合成在iOS8及以下版本系统上语速异常
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)
    {
        utterance.rate = 0.25;//iOS7设置为0.25
    }
    else if ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0)
    {
        utterance.rate = 0.15;//iOS8设置为0.15
    }
    utterance.postUtteranceDelay = 0.1;//延迟播放声音
    [_synthesizer speakUtterance:utterance];
    _utterance = utterance;
  
}

- (void)stop{
    [_synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

- (void)pause{
    [_synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

-(void)continueSpeak{
    [_synthesizer continueSpeaking];
}



@end
