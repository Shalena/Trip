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
#import "City.h"
#import "Trip.h"

@interface ConfigureTripViewController () <UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *countryTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerCountry;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerCity;
@property (strong, nonatomic) NSArray *countriesArray;
@property (strong, nonatomic) NSArray *citiesArray;
@property (strong, nonatomic) Country *selectedCountry;
@property (strong, nonatomic) City *selectedCity;

@end

@implementation ConfigureTripViewController

# pragma mark PickerView

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == self.countryTextField){
        self.countryTextField.inputView = self.pickerCountry;
        
        [[AFHTTPSessionManager manager] GET:@"http://api.geonames.org/countryInfoJSON?username=bolmax" parameters:nil success: ^(NSURLSessionDataTask *  task, id   responseObject){
            NSDictionary *dictionary = (NSDictionary *)responseObject;
            self.countriesArray = [Country countryArrayFromJsonArray:dictionary[@"geonames"]];
            [self.pickerCountry reloadAllComponents];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {

        }];
    } else if (textField == self.cityTextField){
    
        self.cityTextField.inputView=self.pickerCity;
        NSString *cityUrlString = [NSString stringWithFormat:@"http://api.geonames.org/childrenJSON?geonameId=%@&username=bolmax",self.selectedCountry.geonameId];
        [ [AFHTTPSessionManager manager] GET:cityUrlString parameters:nil success: ^(NSURLSessionDataTask *  task, id   responseObject){
            
            NSDictionary *dictionaryCity = (NSDictionary *)responseObject;
            self.citiesArray = [City cityArrayFromJsonArray:dictionaryCity[@"geonames"]];
            [self.pickerCity reloadAllComponents];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
        }];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView == self.pickerCountry){
        return self.countriesArray.count;
    } else if (pickerView == self.pickerCity){
        return self.citiesArray.count;
    }
    else return 0;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView == self.pickerCountry){
        Country *countryName = [self.countriesArray objectAtIndex:row];
        return countryName.countryName;
    } else if (pickerView == self.pickerCity){
        City *cityName = [self.citiesArray objectAtIndex:row];
        return cityName.cityName;
    }
    else return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
     if (pickerView == self.pickerCountry){
        self.selectedCountry = [self.countriesArray objectAtIndex:row];
        self.countryTextField.text = self.selectedCountry.countryName;
        self.selectedCity = nil;
        self.cityTextField.text = nil;
     } else if (pickerView == self.pickerCity){
         self.selectedCity = [self.citiesArray objectAtIndex:row];
         self.cityTextField.text = self.selectedCity.cityName;
     }
}

- (IBAction)saveButtonAction:(id)sender {
    Trip *trip = [Trip new];
    trip.country = self.selectedCountry;
    trip.city = self.selectedCity;
    
    if ([self.delegate respondsToSelector:@selector(configureTripViewControllerDidCreateTrip:)]) {
        [self.delegate configureTripViewControllerDidCreateTrip:trip];
    }

    [self.navigationController popViewControllerAnimated:YES];
}

@end
