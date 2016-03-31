//
//  TripListController.m
//  
//
//  Created by shustreek on 08.03.16.
//
//

#import "TripListController.h"
#import "ConfigureTripViewController.h"

@interface TripListController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;


@end

@implementation TripListController

- (void)viewDidLoad {
    [super viewDidLoad];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"addTrip"]) {
        ConfigureTripViewController *controller = segue.destinationViewController;

    }
}



@end





