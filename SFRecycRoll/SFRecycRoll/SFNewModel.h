//
//  SFNewModel.h
//  SFRecycRoll
//
//  Created by lushengfu on 2017/3/14.
//  Copyright © 2017年 CM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFNewModel : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *title;

+ (SFNewModel *)modelWith:(NSDictionary *)dict;

@end
