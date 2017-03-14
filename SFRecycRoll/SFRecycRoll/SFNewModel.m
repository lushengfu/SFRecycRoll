//
//  SFNewModel.m
//  SFRecycRoll
//
//  Created by lushengfu on 2017/3/14.
//  Copyright © 2017年 CM. All rights reserved.
//

#import "SFNewModel.h"

@implementation SFNewModel

+ (SFNewModel *)modelWith:(NSDictionary *)dict
{
    SFNewModel *newsModel = [[SFNewModel alloc] init];
    newsModel.icon = dict[@"icon"];
    newsModel.title = dict[@"title"];
    return newsModel;
}

@end
