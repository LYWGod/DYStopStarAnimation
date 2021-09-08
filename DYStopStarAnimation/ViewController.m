//
//  ViewController.m
//  DYStopStarAnimation
//
//  Created by git on 2021/9/8.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIImageView *pauseIcon;

@property (nonatomic,assign) BOOL isStoped;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.pauseIcon];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
    
    _isStoped = NO;
    
    _pauseIcon.frame = CGRectMake(self.view.center.x - 50, self.view.center.y - 50, 100, 100);
}

- (void)tapClick
{
    if(_isStoped) {
        [UIView animateWithDuration:0.25f
                         animations:^{
                             self.pauseIcon.alpha = 0.0f;
                         } completion:^(BOOL finished) {
                             [self.pauseIcon setHidden:YES];
                             self.isStoped = NO;
                         }];
        
    }else {
        [_pauseIcon setHidden:NO];
        _pauseIcon.transform = CGAffineTransformMakeScale(1.8f, 1.8f);
        _pauseIcon.alpha = 1.0f;
        [UIView animateWithDuration:0.25f delay:0
                            options:UIViewAnimationOptionCurveEaseIn animations:^{
                                self.pauseIcon.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
                            } completion:^(BOOL finished) {
                                self.isStoped = YES;
                            }];
        
    }
}

- (UIImageView *)pauseIcon
{
    if (!_pauseIcon) {
        _pauseIcon = [[UIImageView alloc] init];
        _pauseIcon.image = [UIImage imageNamed:@"icon_play_pause"];
        _pauseIcon.contentMode = UIViewContentModeCenter;
        _pauseIcon.layer.zPosition = 3;
        _pauseIcon.hidden = YES;
    }
    return _pauseIcon;
}

@end
