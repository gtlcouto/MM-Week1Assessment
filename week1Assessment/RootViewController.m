//
//  ViewController.m
//  week1Assessment
//
//  Created by Gustavo Couto on 2015-01-09.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import "RootViewController.h"
#import "WebViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldMultiplicand;
@property (weak, nonatomic) IBOutlet UITextField *textFieldMultiplier;
@property (weak, nonatomic) IBOutlet UIButton *webButton;
@property NSString *result;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webButton.enabled = NO;
}

#pragma mark - IBActions
- (IBAction)onCalculateButtonPressed:(id)sender {
    int multiplicand;
    int multiplier;
    NSNumberFormatter * format = [[NSNumberFormatter alloc] init];
    [format setNumberStyle:NSNumberFormatterDecimalStyle];
    multiplicand = [self.textFieldMultiplicand.text intValue];
    multiplier = [self.textFieldMultiplier.text intValue];
        self.result = [NSString stringWithFormat:@"%i",multiplicand * multiplier];
    self.navigationItem.title = self.result;

    [self.textFieldMultiplier resignFirstResponder];
    [self.textFieldMultiplicand resignFirstResponder];

    if (([self.result intValue] % 5) == 0)
    {
        self.webButton.enabled = YES;
    } else
    {
        self.webButton.enabled = NO;
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *vc = segue.destinationViewController;
    vc.multiplicationResult = self.result;
}




@end
