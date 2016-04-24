//
//  TripListController.m
//  
//
//  Created by shustreek on 08.03.16.
//
//

#import "TripListController.h"
#import "TripCellTableViewCell.h"
#import "ConfigureTripViewController.h"
#import "Trip.h"
#import "Country.h"
#import "City.h"
#import "Trip+FetchRequests.h"

@interface TripListController () <ConfigureViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (strong,nonatomic) NSMutableArray *tripsArray;

@end

@implementation TripListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tripsArray = [Trip getAllTrips].mutableCopy;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"addTrip"]) {
        ConfigureTripViewController *controller = segue.destinationViewController;
        controller.delegate = self;
    }
}

- (void)configureTripViewControllerDidCreateTrip: (Trip *) trip {
    [self.tripsArray addObject:trip];
    [self.tableView reloadData];
}

- (void)configureTripViewControllerDidUpdateTrip {
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tripsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TripCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Trip  *trip = self.tripsArray[indexPath.row];
    [cell configureWithTrips:trip];
    return cell;
}

@end



