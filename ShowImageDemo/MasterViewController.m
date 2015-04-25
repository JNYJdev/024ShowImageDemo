//
//  MasterViewController.m
//  ShowImageDemo
//
//  Created by William on 10/3/15.
//  Copyright (c) 2015 William. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "JNYJCore.h"
@interface MasterViewController ()<JNYJViewForImageDelegate>

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    [self.tableView setBackgroundColor:[UIColor yellowColor]];
    
    //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    [self.viewImage setAlpha:0.2];
    [UIView animateWithDuration:0.325 animations:^{
        [self.viewImage setAlpha:1.0];
    } completion:^(BOOL isFinished){
        if (isFinished) {
            //
            [self.viewImage removeFromSuperview];
            //
        }
    }];
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect rect_ = self.view.frame;
    JNYJViewForImage *imageView_ = [[JNYJViewForImage alloc] initWithFrame:CGRectMake(0, 0,
                                                                              rect_.size.width,
                                                                              rect_.size.height)];
    self.viewImage = (UIView *)imageView_;
    [imageView_ setDelegate_callBack:self];
    [self.navigationController.view addSubview:imageView_];
    [imageView_ setAlpha:0.2];
    [UIView animateWithDuration:0.325 animations:^{
        [imageView_ setAlpha:1.0];
    } completion:^(BOOL isFinished){
        if (isFinished) {
            //
            [imageView_ showImage:[UIImage imageNamed:@"2"]];
//            [imageView_ showImageWithUrl:Url_temp];
            //
        }
    }];
}
#pragma mark delegate view of image
-(void)callback_tapView:(id)sender{
    [self.viewImage setAlpha:1.0];
    [UIView animateWithDuration:0.325 animations:^{
        [self.viewImage setAlpha:0.2];
    } completion:^(BOOL isFinished){
        if (isFinished) {
            //
            [self.viewImage removeFromSuperview];
            self.viewImage = nil;
            //
        }
    }];
}
@end
