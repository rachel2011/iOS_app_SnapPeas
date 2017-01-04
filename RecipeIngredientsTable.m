//
//  RecipeIngredientsTable.m
//  SnapPeas
//
//  Created by Labuser on 7/20/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import "RecipeIngredientsTable.h"
#import "Food.h"
#import "AppDelegate.h"
#import "FoodDetailView.h"
#import "DetailInfo.h"

@interface RecipeIngredientsTable ()

@end

@implementation RecipeIngredientsTable
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
    self.tableView.rowHeight=80;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    
    return self.foodArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identy=@"foodcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
 
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identy];
    }
    
    Food* food=self.foodArray[indexPath.row];
    cell.textLabel.numberOfLines=0;
    cell.textLabel.text=[NSString stringWithFormat:@"%ld%@",indexPath.row+1,food.food_name];
   // cell.detailTextLabel.text=[NSString stringWithFormat:@"Description:%@",food.ingredient_description];
    return cell;
}
 

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Food* cur=self.foodArray[indexPath.row];
    
    DetailInfo *temp = [DetailInfo getDetailWith:@"150" andServing:@"1" andProtain:@"3" andScore:91];
    
    NSArray *tempArr = [NSArray arrayWithObjects:cur.food_name,cur.ingredient_url, temp, nil];
    
    FoodDetailView *foodView = [[FoodDetailView alloc]initWithData:@"FoodDetailView" bundle:nil data: tempArr];
    
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    
    
    [del.navigationController pushViewController:foodView animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
