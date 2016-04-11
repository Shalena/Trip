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

@interface ConfigureTripViewController () <UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *coutryTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerCountry;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerCity;
@property (strong, nonatomic) NSArray *countriesArray;
@property (strong, nonatomic) NSArray *citiesArray;

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
    if (textField == self.coutryTextField){
    self.coutryTextField.inputView = self.pickerCountry;
 
    
    [ [AFHTTPSessionManager manager] GET:@"http://api.geonames.org/countryInfoJSON?username=bolmax" parameters:nil success: ^(NSURLSessionDataTask *  task, id   responseObject){
        
        NSDictionary *dictionary = (NSDictionary *)responseObject;
        self.countriesArray = [Country coutryArrayFromJsonArray:dictionary[@"geonames"]];
        [self.pickerCountry reloadAllComponents];
    } failure:^(NSURLSessionDataTask * task, NSError * error) {

    }];
    } else if (textField == self.cityTextField){
    
        self.cityTextField.inputView=self.pickerCity;
        [ [AFHTTPSessionManager manager] GET:@"http://api.geonames.org/childrenJSON?geonameId=630336&username=bolmax" parameters:nil success: ^(NSURLSessionDataTask *  task, id   responseObject){
            
            NSDictionary *dictionaryCity = (NSDictionary *)responseObject;
            self.citiesArray = [City cityArrayFromJsonArray:dictionaryCity[@"geonames"]];
            [self.pickerCity reloadAllComponents];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
        }];
    }
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
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
    return countryName.coutryName;
    } else if (pickerView == self.pickerCity){
        City *cityName = [self.citiesArray objectAtIndex:row];
        return cityName.cityName;
    }
    else return 0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
     if (pickerView == self.pickerCountry){
    
    Country *selectedCountry = [self.countriesArray objectAtIndex:row];
    self.coutryTextField.text = selectedCountry.coutryName;
     } else if   (pickerView == self.pickerCity){
         
         City *selectedCity = [self.citiesArray objectAtIndex:row];
         self.cityTextField.text = selectedCity.cityName;
     }
}


// http://api.geonames.org/childrenJSON?geonameId=630336&username=bolmax


- (IBAction)saveButtonAction:(id)sender {
    
}








//- (IBAction)saveButtonAction:(id)sender {
//    
//    
//    OSNominees *nominee = self.nominee;
//    
//    if (!self.nominee) {
//        nominee = [OSNominees new];
//    }
//    
//    nominee.title = self.titleTextField.text;
//    nominee.company = self.companyTextField.text;
//    nominee.detail = self.detailTextField.text;
//    
//    if ([self.delegate respondsToSelector:@selector(addNomineeControllerDidCreateNominee:)] && !self.currentNominee) {
//        [self.delegate addNomineeControllerDidCreateNominee:nominee];
//    } else if([self.delegate respondsToSelector:@selector(addNomineeControllerDidUpdateNominee)]){
//        [self.delegate addNomineeControllerDidUpdateNominee];
//    }
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//
//








@end






