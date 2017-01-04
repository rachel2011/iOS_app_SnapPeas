//
//  HCell.m
//  SnapPeas
//
//  Created by Labuser on 7/14/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import "HCell.h"
#import "ConstantVars.h"
#import "ItemCell.h"
#import "FoodDetailView.h"
#import "AppDelegate.h"
#import "RecipeDetailView.h"
#import "UIImageView+WebCache.h"
#import "Recipe.h"

@implementation HCell

@synthesize hTableView;
@synthesize items;
@synthesize rowType;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    // Display Alert Message
    if([self.rowType isEqualToString:@"food"])
    {
     
     
        FoodDetailView *foodView = [[FoodDetailView alloc]initWithData:@"FoodDetailView" bundle:nil data:nil];

        AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
     
        foodView.foodArray=self.purchaseArray;
        foodView.detail=self.purchaseArray[indexPath.row];
        
        [del.navigationController pushViewController:foodView animated:YES];
       
    }
    else if([self.rowType isEqualToString:@"recipe"])
    {
     
        RecipeDetailView *recipeView = [[RecipeDetailView alloc]initWithData:@"RecipeDetailView" bundle:nil data: nil];
        recipeView.recipe=self.recipeArray[indexPath.row];
        AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
        [del.navigationController pushViewController:recipeView animated:YES];
        
    }
    
}
-(UINavigationController *) parentTableView {
    // iterate up the view hierarchy to find the table containing this cell/view
    UIView *aView = self.superview;
    while(aView != nil) {
        if([aView isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)aView;
        }
        aView = aView.superview;
    }
    return nil; // this view is not within a tableView
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if ([self.rowType isEqualToString:@"food"]) {
        return self.purchaseArray.count;
    }else{
        return self.recipeArray.count;
    }
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    // Set up the cell...
 
    if ([self.rowType isEqualToString:@"food"]) {
        if(self.purchaseArray.count>indexPath.row){
            DetailInfo * detail=  self.purchaseArray[indexPath.row];
            cell.title.text=detail.name;
            [cell.pic setImageWithURL:[NSURL URLWithString:detail.url] placeholderImage:nil];
        }
        
    }else{
        
        Recipe * recip=self.recipeArray[indexPath.row];
        cell.title.text =recip.recipe_name;
        NSURL *url = [NSURL URLWithString:recip.recipe_image];
        [cell.pic setImageWithURL:url placeholderImage:nil];

    }
    
    
 
    
    
    
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [self initWithFrame:self.frame];
    return self;
    
}

- (id)initWithFrame:(CGRect)frame
{
    //if ((self = [super initWithFrame:frame]))
    //{
        self.hTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kCellHeight, kTableLength)];
        self.hTableView.showsVerticalScrollIndicator = NO;
        self.hTableView.showsHorizontalScrollIndicator = NO;
        self.hTableView.transform = CGAffineTransformMakeRotation(-M_PI * 0.5);
        [self.hTableView setFrame:CGRectMake(kRowHorizontalPadding * 0.5, kRowVerticalPadding * 0.5, kTableLength - kRowHorizontalPadding, kCellHeight)];
        
        self.hTableView.rowHeight = kCellWidth;
        self.hTableView.backgroundColor = kHorizontalTableBackgroundColor;
        
        self.hTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.hTableView.separatorColor = [UIColor clearColor];
        
        self.hTableView.dataSource = self;
        self.hTableView.delegate = self;
        [self addSubview:self.hTableView];
    //}
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 刷新数据
- (void) reloadData{
  
    [self.hTableView reloadData];
}


@end
