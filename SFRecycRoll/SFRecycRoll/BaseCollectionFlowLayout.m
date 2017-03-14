//
//  BaseCollectionFlowLayout.m
//  CM
//
//  Created by zhuqinlin on 15/9/7.
//  Copyright (c) 2015年 jzkj. All rights reserved.
//

#import "BaseCollectionFlowLayout.h"

@implementation BaseCollectionFlowLayout

-(instancetype)initWithScrollDirection:(UICollectionViewScrollDirection)direction
{
    if (self = [super init])
    {
        self.scrollDirection = direction;
        self.minimumLineSpacing = 8;
        self.minimumInteritemSpacing = 0;
    }
    return self;
}

-(instancetype)initWithScrollDirection:(UICollectionViewScrollDirection)direction space:(CGFloat)space
{
    if (self = [super init])
    {
        self.scrollDirection = direction;
        self.minimumLineSpacing = space;
        self.minimumInteritemSpacing = 0;
    }
    return self;
}

-(instancetype)initWithScrollDirection:(UICollectionViewScrollDirection)direction space:(CGFloat)space interitem:(CGFloat)interitem
{
    if (self = [super init])
    {
        self.scrollDirection = direction;
        self.minimumLineSpacing = space;
        self.minimumInteritemSpacing = interitem;
    }
    return self;
}

@end
