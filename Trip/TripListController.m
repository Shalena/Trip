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

@interface TripListController () <ConfigureViewControllerDelegate>
//@interface NominationListViewController () <UITableViewDataSource, UITableViewDelegate>
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
   TripCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
   Trip  *trip = self.tripsArray[indexPath.row];
    [cell configureWithTrips:trip];
    return cell;
    
    
    
    
//    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//    {
//        OSNomineesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nomineesCell"];
//        OSNominees *nominees = self.filteredArray[indexPath.row];
//        
//        [cell configureWithNominees:nominees];
//        return cell;
//    }
//    
    
    
    
    return cell;
}

@end



