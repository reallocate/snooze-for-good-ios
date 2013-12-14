//
//  ViewController.m
//  snoozeforgood
//
//  Created by Fabrice Armisen on 12/14/13.
//  Copyright (c) 2013 reallocate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Alarm"];
    self.leftSideViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Side Menu"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
