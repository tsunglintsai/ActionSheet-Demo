//
//  ViewController.m
//  ActionSheet Demo
//
//  Created by Daniela on 3/24/13.
//  Copyright (c) 2013 Pyrogusto. All rights reserved.
//

#import "ViewController.h"

#define OTHER_BUTTON_1_TITLE @"Other Button 1"
#define OTHER_BUTTON_2_TITLE @"Other Button 1"

@interface ViewController ()<UIActionSheetDelegate>
@property (nonatomic,weak) UIActionSheet *actionSheet;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)actionBtnClicked:(id)sender {
    if(!self.actionSheet){
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"title"
                                                                delegate:self cancelButtonTitle:@"Cancel"
                                                  destructiveButtonTitle:@"Delete"
                                                       otherButtonTitles:OTHER_BUTTON_1_TITLE,OTHER_BUTTON_2_TITLE, nil];
        [actionSheet showFromBarButtonItem:sender animated:YES];
        self.actionSheet = actionSheet;
    }
}

#pragma mark - actionsheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == self.actionSheet.destructiveButtonIndex){
        NSLog(@"destuctivebutton clicked");
    }else if(buttonIndex == self.actionSheet.cancelButtonIndex){
        NSLog(@"cancel clicked");
    }else{
        NSString *choice = [actionSheet buttonTitleAtIndex:buttonIndex];
        if([choice isEqualToString:OTHER_BUTTON_1_TITLE]){
            NSLog(@"%@ clicked",OTHER_BUTTON_1_TITLE);
        }else if([choice isEqualToString:OTHER_BUTTON_2_TITLE]){
            NSLog(@"%@ clicked",OTHER_BUTTON_2_TITLE);
        }
        NSLog(@"clicked button at index:%i",buttonIndex);
        
    }
}


@end
