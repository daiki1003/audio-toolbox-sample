//
//  ViewController.m
//  AudioToolBoxSample
//
//  Created by Daiki Asahi on 2014/07/30.
//  Copyright (c) 2014年 Daiki. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController () {
    
    SystemSoundID fanfareSoundId;
    
}

@property (nonatomic, weak) IBOutlet UIButton *stopButton;
@property (nonatomic) SystemSoundID fanfareSoundId;

- (IBAction)tapButton:(id)sender;

@end

@implementation ViewController

@synthesize stopButton;
@synthesize fanfareSoundId;

void completionBlock(SystemSoundID soundId, void *clientData) {
    
    ViewController *viewController = (__bridge ViewController *)clientData;
    if(soundId == viewController.fanfareSoundId) {
        AudioServicesPlaySystemSound(soundId);
        return;
    }
    
    return;
    
};

- (void)viewDidLoad {

    [super viewDidLoad];

    // fanfare.wav file is downloaded by http://www.ne.jp/asahi/music/myuu/wave/wave.htm
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:@"fanfare" withExtension:@"wav"], &fanfareSoundId);
    AudioServicesAddSystemSoundCompletion(fanfareSoundId, NULL, NULL, completionBlock, (__bridge void *)self);
    AudioServicesPlaySystemSound(fanfareSoundId);

}

- (IBAction)tapButton:(id)sender {
    
    if(sender == stopButton) {
        AudioServicesDisposeSystemSoundID(fanfareSoundId);
        return;
    }
    
}

@end
