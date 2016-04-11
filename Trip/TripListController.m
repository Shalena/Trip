//
//  TripListController.m
//  
//
//  Created by shustreek on 08.03.16.
//
//

#import "TripListController.h"
#import "ConfigureTripViewController.h"
#import "Trip.h"
#import "Country.h"
#import "City.h"

@interface TripListController () <ConfigureViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (strong,nonatomic) NSMutableArray *tripsArray;


@end

@implementation TripListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tripsArray = [NSMutableArray array];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
   Trip  * trip = self.tripsArray[indexPath.row];
    cell.textLabel.text = trip.country.coutryName;
    cell.detailTextLabel.text = trip.city.cityName;
    
    
    
    return cell;
}

@end




//self.nomination.nominees = [self.nomination.nominees arrayByAddingObject:nominee];



//- (void)addNomineeControllerDidCreateNominee:(OSNominees*)nominee{
//    self.nomination.nominees = [self.nomination.nominees arrayByAddingObject:nominee];
//    [self.tableView reloadData];
//}
//
//- (void)addNomineeControllerDidUpdateNominee {
//    [self.tableView reloadData];
//}