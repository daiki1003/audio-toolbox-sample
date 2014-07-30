//
//  ViewController.m
//  AudioToolBoxSample
//
//  Created by Daiki Asahi on 2014/07/30.
//  Copyright (c) 2014年 Daiki. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    // fanfare.wav file is downloaded by http://www.ne.jp/asahi/music/myuu/wave/wave.htm
    SystemSoundID soundId = UINT32_MAX;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:@"fanfare" withExtension:@"wav"], &soundId);
    AudioServicesPlaySystemSound(soundId);

}

@end
