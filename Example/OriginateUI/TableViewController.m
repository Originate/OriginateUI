//
//  TableViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/21/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "TableViewController.h"
#import "TextFieldViewController.h"
#import "MyViewController.h"
#import "GradientViewController.h"
#import "ValidationViewController.h"
#import "TintingViewController.h"
#import "HexadecimalViewController.h"
#import "InstallationViewController.h"
#import "LiscenseViewController.h"
#import "MotionViewController.h"
#import "OriginateValidatedTextField.h"

@interface TableViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) NSArray *labels;
@property (strong,nonatomic) NSArray *details;

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Features";
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.labels = @[ @"Text Fields", @"Validating Text Fields", @"Gradient Views",@"Motion Interpolation",
                     @"Image Tinting", @"Hexadecimal Colors", @"Installation", @"Liscense",];
    self.details = @[
                     @"Specifiy insets for text rendering or other elements",
                     @"For text fields that would benefit from validation.",
                     @"For text fields that would benefit from validation.",
                     @"Enables easy access to motion interpolation on views.",
                     @"Two methods on UIImage to make tinting easier.",
                     @"Allows use of hexadecimal colors with UIColor.",
                     @"Install OriginateUI with just a few lines of code.",
                     @"OriginateUI is available under the MIT license.",];
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.table.backgroundColor = [UIColor lightGrayColor];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.labels.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor lightGrayColor];
}

- (CGFloat)tableView: (UITableView*)tableView heightForRowAtIndexPath: (NSIndexPath*) indexPath
{
    return (self.view.frame.size.height - 64.0)/8.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text =  [self.labels objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"CircularPro-Book" size:17.0];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.text = [self.details objectAtIndex:indexPath.row];
    cell.detailTextLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 12.0];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            TextFieldViewController *textFieldViewController =  [[TextFieldViewController alloc] init];
            [self.navigationController pushViewController:textFieldViewController animated:YES];
        }
            break;
        case 1:
        {
            ValidationViewController *validationViewController =  [[ValidationViewController alloc] init];
            [self.navigationController pushViewController:validationViewController animated:YES];
        }
            break;
        case 2:
        {
            GradientViewController *gradientViewController =  [[GradientViewController alloc] init];
            [self.navigationController pushViewController:gradientViewController animated:YES];
        }
            break;
        case 3:
        {
            MotionViewController *motionViewController =  [[MotionViewController alloc] init];
            [self.navigationController pushViewController:motionViewController animated:YES];
        }
            break;
        case 4:
        {
            TintingViewController *tintingViewController =  [[TintingViewController alloc] init];
            [self.navigationController pushViewController:tintingViewController animated:YES];
        }
            break;
        case 5:
        {
            HexadecimalViewController *hexadecimalViewController =  [[HexadecimalViewController alloc] init];
            [self.navigationController pushViewController:hexadecimalViewController animated:YES];
        }
            break;
        case 6:
        {
            InstallationViewController *installationViewController =  [[InstallationViewController alloc] init];
            [self.navigationController pushViewController:installationViewController animated:YES];
        }
            break;
        case 7:
        {
            LiscenseViewController *liscenseViewController =  [[LiscenseViewController alloc] init];
            [self.navigationController pushViewController:liscenseViewController animated:YES];
        }
            break;
    }
}

@end
