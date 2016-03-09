//
//  ConfigureTripViewController.m
//  Trip
//
//  Created by shustreek on 08.03.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import "ConfigureTripViewController.h"
#import <AFNetworking.h>
#import "Country.h"


@interface ConfigureTripViewController () <UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *coutryTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *countriesArray;
@end

@implementation ConfigureTripViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.coutryTextField.inputView = self.picker;
    
    [ [AFHTTPSessionManager manager] GET:@"http://api.geonames.org/countryInfoJSON?username=bolmax" parameters:nil success: ^(NSURLSessionDataTask *  task, id   responseObject){
        NSDictionary *dictionary = (NSDictionary *)responseObject;
        self.countriesArray = [Country coutryArrayFromJsonArray:dictionary[@"geonames"]];
        
        
//         self.nominations = [OSNomination nominationsArrayFromJsonArray:json];
       
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
      
        
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  }

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.countriesArray.count;

}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    Country *countryName = [self.countriesArray objectAtIndex:row];
    return countryName.coutryName;
}



@end






//
//
//- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    OSNomination *titleNomination = [self.nominations objectAtIndex:row];
//    return titleNomination.title;
//}
