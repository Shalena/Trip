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
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  }






# pragma mark PickerView

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    self.coutryTextField.inputView = self.picker;
 
    
    [ [AFHTTPSessionManager manager] GET:@"http://api.geonames.org/countryInfoJSON?username=bolmax" parameters:nil success: ^(NSURLSessionDataTask *  task, id   responseObject){
        
        NSDictionary *dictionary = (NSDictionary *)responseObject;
        self.countriesArray = [Country coutryArrayFromJsonArray:dictionary[@"geonames"]];
        [self.picker reloadAllComponents];
    } failure:^(NSURLSessionDataTask * task, NSError * error) {

    }];
    
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    Country *selectedCountry = [self.countriesArray objectAtIndex:row];
    
    self.coutryTextField.text = selectedCountry.coutryName;
}


// http://api.geonames.org/childrenJSON?geonameId=630336&username=bolmax


@end






