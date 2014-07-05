//
//  Grid.m
//  GameOfLife
//
//  Created by Vianney Jayasinha on 7/4/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

static const int GRID_ROWS = 8;
static const int GRID_COLUMNS = 10;

@implementation Grid {
    NSMutableArray *_gridArray;
    float _cellWidth;
    float _cellHeight;
}

-(void)onEnter
{
    [super onEnter];
    [self setupGrid];
    
    self.userInteractionEnabled = YES;

}

-(void)setupGrid
{
    //divide the grid's size by the number of columns/rows to find out the dimensions of the cell
    _cellWidth = self.contentSize.width / GRID_COLUMNS;
    _cellHeight = self.contentSize.height / GRID_ROWS;
    
    float x = 0;
    float y = 0;
    
    //initialize the array as a blank NSMutableArray
    _gridArray = [NSMutableArray array];
    
    //initialize the Creatures with a 2D array
    for(int i=0; i<GRID_ROWS; i++) {
        _gridArray[i] = [NSMutableArray array];
        x=0;
        
        for (int j =0; j<GRID_COLUMNS; j++) {
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0,0);
            creature.position = ccp(x,y);
            
            //adding a creature for the current i,j indeces
            [self addChild:creature];
            
            //shorthand way to access an array inside an array:
            _gridArray[i][j] = creature;
            
            //this is a test... make creatures visible to make sure we have the grid populated correctly
            creature.isAlive = YES;
            
            x+=_cellWidth;
        }
        
        y+= _cellHeight;
        
        }
    }
    

@end
