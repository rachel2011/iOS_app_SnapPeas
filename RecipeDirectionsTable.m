//
//  RecipeDirectionsTable.m
//  SnapPeas
//
//  Created by Labuser on 7/20/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import "RecipeDirectionsTable.h"
#import "Direction.h"
//zxing  scanrop
@interface RecipeDirectionsTable ()

@end

@implementation RecipeDirectionsTable

- (id)initWithData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSArray *)myData
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    //self.foodPic.image = [[UIImage alloc] initWithData:data];
    //self.foodPic.image = [myData objectAtIndex:1];
    //self.foodName.text = [myData objectAtIndex:0];
    
    
    self.passedName = [myData objectAtIndex:0];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight=100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    Direction * di=self.array[indexPath.section];
    cell.textLabel.text=di.direction_description;
    cell.textLabel.numberOfLines=0;
    return cell;
}
 


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    Direction * di=self.array[section];
    return [NSString stringWithFormat:@"Step %ld",di.direction_number];
    
}

@end
