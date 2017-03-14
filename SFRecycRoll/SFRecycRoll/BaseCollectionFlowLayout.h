//
//  BaseCollectionFlowLayout.h
//  CM2
//
//  Created by lushengfu on 16/4/15.
//  Copyright (c) 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionFlowLayout : UICollectionViewFlowLayout

-(instancetype)initWithScrollDirection:(UICollectionViewScrollDirection)direction;

-(instancetype)initWithScrollDirection:(UICollectionViewScrollDirection)direction space:(CGFloat)space;

-(instancetype)initWithScrollDirection:(UICollectionViewScrollDirection)direction space:(CGFloat)space interitem:(CGFloat)interitem;

@end
